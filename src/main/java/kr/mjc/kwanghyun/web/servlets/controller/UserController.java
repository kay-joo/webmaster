package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.User;
import kr.mjc.kwanghyun.web.dao.UserDao;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.context.MessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Locale;

@Controller
@Slf4j
public class UserController {

    private final UserDao userDao;
    private final MessageSource messages;

    public UserController(UserDao userDao, MessageSource messages) {
        this.userDao = userDao;
        this.messages = messages;
    }

    /**
     * 로그인
     */
    @RequestMapping("/user/signin")
    public String signin(String email, String password, String redirectUrl,
                         HttpSession session, RedirectAttributes attributes) {
        redirectUrl = StringUtils.defaultIfEmpty(redirectUrl,
                "/app/subscribe/subscribeList");
        log.debug("signin redirectUrl={}", redirectUrl);

        try {
            User user = userDao.login(email, password);
            // 로그인 성공하면 redirectUrl로
            session.setAttribute("ME", user);
            return "redirect:" + redirectUrl;
        } catch (DataAccessException e) {
            // 로그인 실패하면 다시 로그인 화면으로
            attributes.addFlashAttribute("message",
                    messages.getMessage("signin.failure.password", null, Locale.getDefault()));
            return "redirect:/app/user/signinForm?redirectUrl=" + URLEncoder.encode(redirectUrl, Charset.defaultCharset());
        }
    }

    /**
     * 로그아웃
     */
    @GetMapping("/user/signout")
    public String signout(HttpSession session) {
        session.invalidate();
        return "redirect:/app/article/articleList?count=20&page=1";
    }

    /**
     * 회원가입
     */
    @PostMapping("/user/signup")
    public String signup(User user, HttpSession session, RedirectAttributes attributes) {

        try {
            userDao.addUser(user);
            // 회원가입 성공하면 로그인
            return signin(user.getEmail(), user.getPassword(), null, session, attributes);
        } catch (DataAccessException e) {
            // 회원가입 실패하면 다시 회원가입 화면으로
            log.error(e.toString());
            //플래시 설정, 한번 쓰고나면 사라지는 내용
            attributes.addFlashAttribute("message",
                    messages.getMessage("signup.failure.duplication", null, Locale.getDefault()));
            return "redirect:/app/user/signupForm";
        }
    }

    /**
     * 비밀번호 변경
     */
    @PostMapping("/user/updatePassword")
    public String updatePassword(String currentPassword, String newPassword,
                                 @SessionAttribute("ME") User me, RedirectAttributes attributes) {
        int updatedRows =
                userDao.updatePassword(me.getUserId(), currentPassword, newPassword);
        if (updatedRows >= 1)
            // 업데이트 성공하면 내정보 화면으로
            return "redirect:/app/user/myInfo";
        else {
            // 업데이트 실패하면 다시 비밀번호변경 화면으로
            attributes.addFlashAttribute("message",
                    messages.getMessage("password.failure", null, Locale.getDefault()));
            return "redirect:/app/user/passwordEdit";
        }
    }

    /**
     * 회원 목록
     */
    @GetMapping("/user/userList")
    public void userList(int count, int page, Model model) {
        List<User> userList = userDao.listUsers(count, page);
        model.addAttribute("userList", userList);
    }

    /**
     * 회원 정보
     */
    @GetMapping("/user/userInfo")
    public void userInfo(int userId, Model model) {
        User user = userDao.getUser(userId);
        model.addAttribute("user", user);
    }

    //디폴트 맵핑
    @GetMapping({"/user/signinForm", "/user/signupForm", "/user/myInfo", "/user/passwordEdit"})
    private void mapDefault() {
        //보이드로 반환값을 주면 스프링에서 자동으로 application.properties 파일에 있는
        //프리픽스 서픽스를 매핑경로 앞뒤로 붙여주고 포워드한다.
        //prefix=/WEB-INF/jsp/
        //spring.mvc.view.suffix=.jsp
    }
}
