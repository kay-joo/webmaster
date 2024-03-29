package kr.mjc.kwanghyun.web.servlets.controller;

import javax.servlet.http.HttpServletRequest;

public class HttpUtils {
    /**
     * queryString을 포함한 requestURL
     */
    public static String getRequestURLWithQueryString(
            HttpServletRequest request) {
        StringBuffer requestURL = request.getRequestURL();
        String queryString = request.getQueryString();
        return queryString == null ? requestURL.toString() :
                requestURL.append("?").append(queryString).toString();
    }
}