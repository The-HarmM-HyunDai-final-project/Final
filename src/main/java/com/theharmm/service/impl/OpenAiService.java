package com.theharmm.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.JSONObject;

public class OpenAiService {

	 public static void chatGPT(String text) throws Exception {
	        String url = "https://api.openai.com/v1/completions";
	        HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();

	        con.setRequestMethod("POST");
	        con.setRequestProperty("Content-Type", "application/json");
	        con.setRequestProperty("Authorization", "Bearer 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");

	        JSONObject data = new JSONObject();
	        data.put("model", "text-davinci-003");
	        data.put("prompt", text);
	        data.put("max_tokens", 4000);
	        data.put("temperature", 1.0);

	        con.setDoOutput(true);
	        con.getOutputStream().write(data.toString().getBytes());

	        //String output = new BufferedReader(new InputStreamReader(con.getInputStream())).lines().reduce((a, b) -> a + b).get();
	        String output = new BufferedReader(new InputStreamReader(con.getInputStream())).lines().reduce((a, b) -> a + b).get();

	        String test = new JSONObject(output).getJSONArray("choices").getJSONObject(0).getString("text").toString();
	        System.out.println(test);
	        System.out.println(output);
	    }

	    public static void main(String[] args) throws Exception {
	    	
	    	ArrayList<String> list = new ArrayList<>();
	    	list.add("배송은 많이 느린데, 디자인은 예쁘네요");
	    	list.add("내구성이 좋네요");
	    	list.add("배송은 좀 느렸는데, 재질이 좋아요");
	    	list.add("배송은 빠르게 왔는데, 단추가 곧 떨어질거 같아요");
	    	
	        chatGPT("'배송은 빠르게 왔는데, 단추가 곧 떨어질 거 같아요'가 긍정적인 리뷰인지 yes 또는 no로 표현해줘");
	    }
 
}