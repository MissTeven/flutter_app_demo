import 'package:dio/dio.dart';
import 'package:test_flutter_app/common/config/Config.dart';
import 'package:test_flutter_app/common/local/LocalStorage.dart';
import 'package:test_flutter_app/common/net/Code.dart';
import 'dart:collection';
import 'package:connectivity/connectivity.dart';
import 'package:test_flutter_app/common/net/ResultData.dart';

///http请求
class HttpManager {
  static const CONTENT_TYPE_JSON = "application/json";
  static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
  static Map optionParams = {
    "timeoutMs": 15000,
    "token": null,
    "authorizationCode": null,
  };

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  static netFetch(url, params, Map<String, String> header, Options option,
      {noTip = false}) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return new ResultData(
          Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip),
          false,
          Code.NETWORK_ERROR);
    }

    Map<String, String> headers = new HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    //授权码
//    if (optionParams["authorizationCode"] == null) {
//      var authorizationCode = await getAuthorization();
//      if (authorizationCode != null) {
//        optionParams["authorizationCode"] = authorizationCode;
//      }
//    }
//
//    headers["Authorization"] = optionParams["authorizationCode"];

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    ///超时
    option.connectTimeout = 15000;

    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      if (Config.DEBUG) {
        print('请求异常: ' + e.toString());
        print('请求异常url: ' + url);
      }
//      return new ResultData(
//          Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip),
//          false,
//          errorResponse.statusCode);
    }
    return response;

//    if (Config.DEBUG) {
//      print('请求url: ' + url);
//      print('请求头: ' + option.headers.toString());
//      if (params != null) {
//        print('请求参数: ' + params.toString());
//      }
//      if (response != null) {
//        print('返回参数: ' + response.toString());
//      }
//      if (optionParams["authorizationCode"] != null) {
//        print('authorizationCode: ' + optionParams["authorizationCode"]);
//      }
//    }

//    try {
//      if (option.contentType != null && option.contentType.primaryType == "text") {
//        return new ResultData(response.data, true, Code.SUCCESS);
//      } else {
//        var responseJson = response.data;
//        if (response.statusCode == 201 && responseJson["token"] != null) {
//          optionParams["authorizationCode"] = 'token ' + responseJson["token"];
//          await LocalStorage.save(Config.TOKEN_KEY, optionParams["authorizationCode"]);
//        }
//      }
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return new ResultData(response.data, true, Code.SUCCESS, headers: response.headers);
//      }
//    } catch (e) {
//      print(e.toString() + url);
//      return new ResultData(response.data, false, response.statusCode, headers: response.headers);
//    }
//    return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
  }

  ///清除授权
  static clearAuthorization() {
    optionParams["authorizationCode"] = null;
    LocalStorage.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  static getAuthorization() async {
    String token = await LocalStorage.get(Config.TOKEN_KEY);
    if (token == null) {
      String basic = await LocalStorage.get(Config.USER_BASIC_CODE);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      optionParams["authorizationCode"] = token;
      return token;
    }
  }
}
