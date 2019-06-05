package pers.wmx.learningcenter.utils;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;

/**
 * @author: wang ming xin
 * @create: 2019-04-10 10:15
 */
public class HttpUtil {
    public static String get(String url) {
        HttpURLConnection connection = null;
        String response = "";
        int code = -1;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            if (connection != null) {
                connection.setRequestMethod("GET");
                response = readStream(connection);
                code = connection.getResponseCode();
            } else {
            }
        } catch (Exception e) {
        } finally {
            if (connection != null) {
                try {
                    connection.disconnect();
                } catch (Exception e) {
                }
            }
        }
        return response;
    }

    private static String readStream(HttpURLConnection connection) throws IOException {
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        String result = null;
        StringBuilder sb = new StringBuilder();
        InputStream is = null;
        try {
            is = new BufferedInputStream(connection.getInputStream());
            BufferedReader br = new BufferedReader(new InputStreamReader(is, Charset.forName("utf-8")));
            String inputLine = "";
            while ((inputLine = br.readLine()) != null) {
                sb.append(inputLine);
            }
            result = sb.toString();
        } catch (Exception e) {
        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                }
            }
        }
        return result;
    }
}
