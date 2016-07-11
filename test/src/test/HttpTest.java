package test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;


public class HttpTest {

	public static void main(String[] args) {
		String url="http://api.map.baidu.com/geocoder?address=福州&output=json&key=37492c0ee6f924cb5e934fa08c6b1676";
		String result=HttpConnect(url);
		System.out.println(result);
		//JSONObject a = new JSONObject(str);  
		 Gson gson = new Gson();
		 String json = gson.toJson(result);
		System.out.println(json);
		Test product = new Test();
		/*product = gson.fromJson(json, Test.class);
		System.out.println("Name:" + product.getStatus());
		System.out.println("lng:" + product.getLng());*/
	}

	private static String HttpConnect(String url) {
		 StringBuffer buffer = new StringBuffer();  
		 try {  
	            URL url1 = new URL(url);  
	            HttpURLConnection httpUrlConn = (HttpURLConnection) url1.openConnection();  
	   
	            httpUrlConn.setDoOutput(false);  
	            httpUrlConn.setDoInput(true);  
	            httpUrlConn.setUseCaches(false);  
	   
	            httpUrlConn.setRequestMethod("GET");  
	            httpUrlConn.connect();  
	   
	            // 将返回的输入流转换成字符串  
	            InputStream inputStream = httpUrlConn.getInputStream();  
	            InputStreamReader inputStreamReader = new InputStreamReader(inputStream, "utf-8");  
	            BufferedReader bufferedReader = new BufferedReader(inputStreamReader);  
	   
	            String str = null;  
	            while ((str = bufferedReader.readLine()) != null) {  
	                buffer.append(str);  
	            }  
	            bufferedReader.close();  
	            inputStreamReader.close();  
	            // 释放资源  
	            inputStream.close();  
	            inputStream = null;  
	            httpUrlConn.disconnect();  
	   
	        } catch (Exception e) {  
	            System.out.println(e.getStackTrace());  
	        }  
	        return buffer.toString();  
	}

}
