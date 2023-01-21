package com.theharmm.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
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

	        String output = new BufferedReader(new InputStreamReader(con.getInputStream())).lines()
	                .reduce((a, b) -> a + b).get();

	        System.out.println(new JSONObject(output).getJSONArray("choices").getJSONObject(0).getString("text"));
	    }
	 
	    public static void main(String[] args) throws Exception {
	        chatGPT("'내구성은 좋은데, 배송이 느려요'에서 긍정적인 키워드만 명사 리스트로 추출해줘");
	    }
 
}