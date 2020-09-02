package com.mapbox.rctmgl.http;

import android.util.Log;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

public class CustomHeadersInterceptor implements Interceptor {

    public static final CustomHeadersInterceptor INSTANCE = new CustomHeadersInterceptor();
    private Map<String, String> customHeaders = new HashMap<>();

    public void addHeader(final String headerName, String headerValue) {
        Log.d("header", String.format("Add custom header headerName=%s headerValue=%s",
                headerName, headerValue));
        customHeaders.put(headerName, headerValue);
    }

    public void removeHeader( final String headerName) {
        customHeaders.remove(headerName);
    }

    @Override
    public Response intercept( Chain chain) throws IOException {
        Request.Builder modifiedHeaderBuilder = chain.request().newBuilder();
        for (Map.Entry<String, String> entry : customHeaders.entrySet()) {
            modifiedHeaderBuilder.addHeader(entry.getKey(), entry.getValue());
        }

        Request request = modifiedHeaderBuilder.build();
        Log.d("header", String.format("Sending request url=%s headers=%s",
                request.url(), request.headers()));
        return chain.proceed(request);
    }
}
