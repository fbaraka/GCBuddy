package com.feras.API;

import com.feras.Models.ParkingInfo;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

/**
 * Created by michaelgleeson on 8/15/17.
 */
public class ParkWhizApiCalls {

    public static JSONObject parkingSearch() {
//        try {
//            URL url = new URL("http://api.parkwhiz.com/search/?key=b6a76a06d63d66ef9bbceebedd6c0c656b5bbc17&lat=42.335849&lng=-83.049848");
//
//            BufferedReader reader;
//            String jsonStr = "";
//            reader = new BufferedReader(new InputStreamReader(url.openStream()));
//            for (String line; (line = reader.readLine()) != null; ) {
//                jsonStr += line;
//            }
//            System.out.println(jsonStr);
//
//            return new JSONObject(jsonStr);
//        } catch (FileNotFoundException e) {
//            return null;
//        } catch (IOException e) {
//            e.printStackTrace();
//        } catch (JSONException e) {
//            e.printStackTrace();
//        }

        String prodCenter = null;
        try {
            //the HttpClient Interface represents the contract for the Http Request execution
            HttpClient client = HttpClientBuilder.create().build();
            //HttpHost holds variables needed for the connection DEFAULT PORTS:  http: 80, https: 443
            HttpHost host = new HttpHost("api.parkwhiz.com", 443, "https");
            //HttpGet retrieves the info identified by the request URI (in the form of an Entity
            HttpGet getPage = new HttpGet("/search/?key=b6a76a06d63d66ef9bbceebedd6c0c656b5bbc17&lat=42.335849&lng=-83.049848");
            //execute the http request and pull the response back
            String jsonStr = "";
            HttpResponse response = client.execute(host, getPage);
            jsonStr = EntityUtils.toString(response.getEntity());
            System.out.println("Response Code: " + response.getStatusLine().getStatusCode());
            JSONObject json = new JSONObject(jsonStr);
            System.out.println(json);

            return json;
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return null;
    }

    public static ArrayList<ParkingInfo> getParking(){
        ArrayList<ParkingInfo> parkingInfo = new ArrayList<ParkingInfo>();
        JSONObject json = parkingSearch();
        try {
            JSONArray parking = json.getJSONArray("parking_listings");
            for (int i = 0; i <parking.length() ; i++) {
                String locationName = parking.getJSONObject(i).getString("location_name");
                double latitude = parking.getJSONObject(i).getDouble("lat");
                double longitude = parking.getJSONObject(i).getDouble("lng");
                String address = parking.getJSONObject(i).getString("address");
                String price = parking.getJSONObject(i).getString("price_formatted");
                String openSpots = parking.getJSONObject(i).getString("available_spots");
                String reserveURL = parking.getJSONObject(i).getString("www_reserve_url");
                ParkingInfo parkingInfo1 = new ParkingInfo(locationName, latitude, longitude, address, price, openSpots, reserveURL);
                parkingInfo.add(parkingInfo1);
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return parkingInfo;
    }




}
