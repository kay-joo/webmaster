package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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

        int size = subscribeList.size();//리스트 사이즈 확인을 위한 변수
        int sum = 0;//구독물 금액 합계 계산을 위한 변수
        for (int i = 0; i < size; i++) {//금액 계산을 위한 반복문
            Subscribe subscribe = subscribeList.get(i);
            sum += subscribe.getPrice();
        }

        request.setAttribute("sum", sum);
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

    /**
     * 구독 추가
     */
    @PostMapping("/subscribe/addSubscribe")
    public void addSubscribe(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("ME");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/app/user/signin");
            return;
        }
        Subscribe subscribe = new Subscribe();
        subscribe.setUserId(user.getUserId());//유저 세션으로 유저 아이디 가져와서 세팅
        subscribe.setName(request.getParameter("name"));//입력받은 값으로 세팅
        subscribe.setPrice(Integer.parseInt(request.getParameter("price")));//입력받은 값으로 세팅
        subscribe.setPdate(request.getParameter("pdate"));//입력받은 값으로 세팅

        subscribeDao.addSubscribe(subscribe);
        response.sendRedirect(request.getContextPath() + "/app/subscribe/subscribeList");
    }

    /**
     * 구독물 삭제
     */
    @GetMapping("/subscribe/deleteSubscribe")
    public void deleteSubscribe(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("ME");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/app/user/signin");
            return;
        }

        int userId = user.getUserId();
        int subId = Integer.parseInt(request.getParameter("subId"));

        subscribeDao.deleteSubscribe(subId,userId);

        subscribeList(request, response);
    }
}
