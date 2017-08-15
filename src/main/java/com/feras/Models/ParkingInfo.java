package com.feras.Models;

/**
 * Created by michaelgleeson on 8/15/17.
 */
public class ParkingInfo {

    public String locationName;
    public double latitude;
    public double longitude;
    public String address;
    public String price;
    public String openSpots;
    public String reserveURL;

    public ParkingInfo(String locationName, double latitude, double longitude, String address, String price, String openSpots, String reserveURL) {
        this.locationName = locationName;
        this.latitude = latitude;
        this.longitude = longitude;
        this.address = address;
        this.price = price;
        this.openSpots = openSpots;
        this.reserveURL = reserveURL;
    }

    public String getLocationName() {
        return locationName;
    }

    public double getLatitude() {
        return latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public String getAddress() {
        return address;
    }

    public String getPrice() {
        return price;
    }

    public String getOpenSpots() {
        return openSpots;
    }

    public String getReserveURL() {
        return reserveURL;
    }
}
