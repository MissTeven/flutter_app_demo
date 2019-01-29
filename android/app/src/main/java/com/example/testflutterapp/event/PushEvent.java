package com.example.testflutterapp.event;

import android.support.annotation.NonNull;

import org.json.JSONObject;

public class PushEvent {
    public String mTitle;
    public String mContent;

    public PushEvent(String title, String content) {
        this.mTitle = title;
        this.mContent = content;
    }
    @NonNull
    public String toString() {
        String str = "";
        try {
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("mTitle", mTitle);
            jsonObject.put("mContent", mContent);
            str = jsonObject.toString();
        } catch (Exception ex) {
        }
        return str;
    }
}
