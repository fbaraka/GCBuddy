package com.feras.Dao;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;

/*
Aaron Board
 */
public class SlackApiCalls {

    //Slack API Method that pulls user information from slack upon login
    public static JSONObject getUserInfo(String token) {
        try {
            URL url = new URL("https://slack.com/api/users.profile.get?token=" + token);

            BufferedReader reader;
            String jsonStr = "";
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            for (String line; (line = reader.readLine()) != null; ) {
                jsonStr += line;
            }

            return new JSONObject(jsonStr);
        } catch (FileNotFoundException e) {
            return null;
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }

    //Gets authorization token for Slack
    //Reads the slack URL, finds the client ID, secret, and the access token
    //Uses those to acquire the authorization token for slack
    public static String getOAuthToken(String code) {

        //TODO always delete before a push
        String clientId = "219461147683.223751169686";
        String clientSecret = "c8c878fd247e9509eb946b700857a1c8";
        String accessToken = "";
        try {
            URL url = new URL("https://slack.com/api/oauth.access?client_id=" + clientId + "&client_secret=" + clientSecret + "&code=" + code);
            BufferedReader reader;
            String jsonStr = "";
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            for (String line; (line = reader.readLine()) != null; ) {
                jsonStr += line;
            }
            JSONObject json = new JSONObject(jsonStr);
            accessToken = json.getString("access_token");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return accessToken;
    }

    public static String getUserId(String code) {

        String usersId = "";
        try {
            URL url = new URL("https://slack.com/api/users.identity?token=" + code);
            BufferedReader reader;
            String jsonStr = "";
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            for (String line; (line = reader.readLine()) != null; ) {
                jsonStr += line;
            }
            JSONObject json = new JSONObject(jsonStr);
            usersId = json.getJSONObject("users").getString("id");
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return usersId;
    }

}
