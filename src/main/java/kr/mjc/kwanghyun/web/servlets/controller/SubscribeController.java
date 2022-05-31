package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

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
    public void subscribeList(@SessionAttribute("ME") User user, int count, int page, Model model) {
        List<Subscribe> subscribeList = subscribeDao.listSubscribe(user.getUserId(), count, page);

        int size = subscribeList.size();//리스트 사이즈 확인을 위한 변수
        int sum = 0;//구독물 금액 합계 계산을 위한 변수
        for (int i = 0; i < size; i++) {//금액 계산을 위한 반복문
            Subscribe subscribe = subscribeList.get(i);
            sum += subscribe.getPrice();
        }
        model.addAttribute("sum", sum);
        model.addAttribute("subscribeList", subscribeList);
    }

    /**
     * 구독 추가 화면
     */
    @GetMapping("/subscribe/subscribeForm")
    public void subscribeForm() {
    }

    /**
     * 구독 추가
     */
    @PostMapping("/subscribe/addSubscribe")
    public String addSubscribe(@SessionAttribute("ME") User user, String name, int price, String pdate) {
        Subscribe subscribe = new Subscribe();
        subscribe.setUserId(user.getUserId());//유저 세션으로 유저 아이디 가져와서 세팅
        subscribe.setName(name);//입력받은 값으로 세팅
        subscribe.setPrice(price);//입력받은 값으로 세팅
        subscribe.setPdate(pdate);//입력받은 값으로 세팅

        subscribeDao.addSubscribe(subscribe);
        return "redirect:/app/subscribe/subscribeList?count=20&page=1";
    }

    /**
     * 구독물 수정 페이지
     */
    @GetMapping("/subscribe/subscribeEdit")
    public void subscribeEdit(int subId, Model model) {
        Subscribe subscribe = subscribeDao.subscribeView(subId);
        model.addAttribute("subscribe", subscribe);
    }

    /**
     * 구독물 수정
     */
    @PostMapping("/subscribe/updateSubscribe")
    public String updateSubscribe(@SessionAttribute("ME") User user,
                                  String name, int price, String pdate, int subId) {
        Subscribe subscribe = new Subscribe();
        subscribe.setName(name);
        subscribe.setPrice(price);
        subscribe.setPdate(pdate);
        subscribe.setSubId(subId);
        subscribe.setUserId(user.getUserId());

        try {
            subscribeDao.updateSubscribe(subscribe);
            // 수정 성공시 구독 리스트로
            return "redirect:/app/subscribe/subscribeList?count=20&page=1";
        } catch (DataAccessException e) {
            // 수정 실패하면 다시 수정 화면으로
            log.error(e.toString());
            return "redirect:/app/subscribe/updateSubscribe";
        }
    }

    /**
     * 구독물 삭제
     */
    @GetMapping("/subscribe/deleteSubscribe")
    public String deleteSubscribe(@SessionAttribute("ME") User user, int subId) {
        subscribeDao.deleteSubscribe(subId, user.getUserId());
        return "redirect:/app/subscribe/subscribeList?count=20&page=1";
    }
}
