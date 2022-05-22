package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
        int count = NumberUtils.toInt(request.getParameter("count"), 20);
        int page = NumberUtils.toInt(request.getParameter("page"), 1);

        List<Subscribe> subscribeList = subscribeDao.listSubscribe(count, page);
        request.setAttribute("subscribeList", subscribeList);
        request.getRequestDispatcher("/WEB-INF/jsp/subscribe/subscribeList.jsp")
                .forward(request, response);
    }



}
