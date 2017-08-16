package com.feras.API.Watson;

import com.ibm.watson.developer_cloud.personality_insights.v3.PersonalityInsights;
import com.ibm.watson.developer_cloud.personality_insights.v3.model.Profile;
import org.json.JSONObject;

/**
 * Created by michaelgleeson on 8/10/17.
 */
public class ProfileGenerator {
    public static JSONObject generateProfile(String bio) {
        JSONObject profile;
        PersonalityInsights service = new PersonalityInsights("2016-10-20");
        //Username and Password created on Bluemix. Only work for 1000 API calls before becoming invalid
        service.setUsernameAndPassword("a30f0086-4ad9-4ebb-8dd2-5f683c97a295", "LwgIHm54RpQj");
        service.setEndPoint("https://gateway.watsonplatform.net/personality-insights/api");
        Profile watsonProfile = service.getProfile(bio).execute();
        watsonProfile.getPersonality();
        profile = new JSONObject(watsonProfile);
        return profile;
    }


}
