package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;


@Controller
@Slf4j
public class SubscribeController {
    private final SubscribeDao subscribeDao;

    public SubscribeController(SubscribeDao subscribeDao) {
        this.subscribeDao = subscribeDao;
    }

    /**
     * 구독 목록
     */
    @GetMapping("/subscribe/subscribeList")
    public void subscribeList(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("ME");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/app/user/signin");
            return;
        }

        int userId = user.getUserId();
        int count = NumberUtils.toInt(request.getParameter("count"), 20);
        int page = NumberUtils.toInt(request.getParameter("page"), 1);

        List<Subscribe> subscribeList = subscribeDao.listSubscribe(userId, count, page);
        request.setAttribute("subscribeList", subscribeList);
        request.getRequestDispatcher("/WEB-INF/jsp/subscribe/subscribeList.jsp")
                .forward(request, response);
    }

    /**
     * 구독 추가 화면
     */
    @GetMapping("/subscribe/subscribeForm")
    public void subscribeForm(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("ME") == null) {
            // 로그인 안한 경우 로그인 화면으로. redirectUrl=구독추가 화면
            String redirectUrl =
                    request.getContextPath() + "/app/subscribe/subscribeForm";
            response.sendRedirect(//리다이렉트를 리다이렉트
                    request.getContextPath() + "/app/user/signinForm?redirectUrl=" +
                            URLEncoder.encode(redirectUrl, Charset.defaultCharset()));//리다이렉트를 변환 후 리다이렉트
        } else {
            // 로그인 한 경우 구독추가 화면으로
            request.getRequestDispatcher("/WEB-INF/jsp/subscribe/subscribeForm.jsp")
                    .forward(request, response);
        }
    }



}
