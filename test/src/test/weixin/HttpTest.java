package test.weixin;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.google.gson.Gson;


public class HttpTest {

	public static void main(String[] args) {
		String url="https://open.weixin.qq.com/connect/oauth2/authorize?"
				+ "appid=wx614c453e0d1dcd12&redirect_uri=http://www.wechat68.com/Javen/OauthTest&response_type=code"
				+ "&scope=snsapi_userinfo&state=1#wechat_redirect";
	//	String result=HttpConnect(url);
	//	System.out.println(result);
		//JSONObject a = new JSONObject(str);  
		 Gson gson = new Gson();
	//	 String json = gson.toJson(result);
	//	System.out.println(json);
		

		//Test product = new Test();
		/*product = gson.fromJson(json, Test.class);
		System.out.println("Name:" + product.getStatus());
		System.out.println("lng:" + product.getLng());*/
		 
		 String get_access_token_url="https://api.weixin.qq.com/sns/oauth2/access_token?" +
			        "appid=APPID" +
			        "&secret=SECRET&" +
			        "code=CODE&grant_type=authorization_code";
			//request.setCharacterEncoding("UTF-8");  
	       // response.setCharacterEncoding("UTF-8"); 
	        get_access_token_url=get_access_token_url.replace("APPID", "wxb338e08fd2e8573f");
	        get_access_token_url=get_access_token_url.replace("SECRET", "01d290abe1305e45525ed4aeaaf91927");
	        get_access_token_url=get_access_token_url.replace("CODE", "001dTepD1GCYUf0xlFpD1osepD1dTepj");
	        String result2=HttpConnect(get_access_token_url);
	        System.out.println(result2);
	       // String json2 = gson.toJson(result2);
	       // System.out.println(json2);
	       // json2=json2.substring(1, json2.length()-1);
	        WeixinLogin wl=gson.fromJson(result2, WeixinLogin.class);
//	        System.out.println(wl);
	        System.out.println("Access_token:" + wl.getAccess_token());
	        System.out.println("Refresh_token:" + wl.getRefresh_token());
	        System.out.println("Errmsg:" + wl.getErrmsg());
	        String result3=HttpConnect("https://api.weixin.qq.com/sns/oauth2/access_token?"
	        		+ "access_token=rsAqa1aZSEnJKZ0KanDtSsXGxpVQFg9zgzI9JUwOBzVf_C8s7B33alI_18M6B_O2K8gLX3btzc_-Qs0ERawXq71sVVEPeo_gyGXisx4ljHU"
	        		+ "&openid=o0hq8wYNuXlVM7iEgB53J_tWTVgc&lang=zh_CN");
	        
	        WeixinLogin w2=gson.fromJson(result3, WeixinLogin.class);
	       
	        System.out.println("@@@@@@@@@@@@@Refresh_token:@@@@@@" + w2.getAccess_token());
	        System.out.println("@@@@@@@@@@@@@Refresh_token:@@@@@@" + w2.getErrcode());
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
