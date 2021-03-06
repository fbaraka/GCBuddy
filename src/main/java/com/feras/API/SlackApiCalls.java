package com.feras.API;

import com.feras.Models.UsersEntity;
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
            // the line above is how we create the url code in order to call the JSON response with the information we request.
            BufferedReader reader;
            // we need a reader to go through the JSON
            String jsonStr = "";
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            // openStream allows us to open and read the url that was given in response.
            // we then have a for loop that makes the JSON into one, continuous, string of information from the JSON response
            for (String line; (line = reader.readLine()) != null; ) {
                jsonStr += line;
            }
            JSONObject json = new JSONObject(jsonStr); // we create a JSONObject using that string
            accessToken = json.getString("access_token"); // we can then parse through the JSONObject to grab the object we need, which is the access_token. The access_token is a "key" word that we use to identify the object
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return accessToken; // this is all we wanted from this method
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
            usersId = json.getJSONObject("user").getString("id");
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

    public static String sendDirectMessage(String code, String usersChannel, String slackId, String slackMessage) {

        URL url = null;
        String statusMessage = null;

        try {
             url = new URL("https://slack.com/api/chat.postMessage?token=" + code + "&channel=" + usersChannel + "&text=" + slackId + "&as_user=" + slackMessage + "&pretty=1");

            BufferedReader reader;
            String jsonStr = "";
            reader = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
            for (String line; (line = reader.readLine()) != null; ) {
                jsonStr += line;
            }
            JSONObject json = new JSONObject(jsonStr);
            String status = json.getString("ok");
            System.out.println(json);

            if (status.equals("true")){
                statusMessage = "Message sent!";
            } else {
                statusMessage = "Message failed to send!";
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JSONException e) {
            e.printStackTrace();
        }


        return statusMessage;
    }
}
