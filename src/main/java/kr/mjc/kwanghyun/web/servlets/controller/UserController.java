package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.User;
import kr.mjc.kwanghyun.web.dao.UserDao;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.dao.DataAccessException;
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
public class UserController {

  private final UserDao userDao;

  public UserController(UserDao userDao) {
    this.userDao = userDao;
  }

  /**
   * 로그인
   */
  @PostMapping("/user/signin")
  public void signin(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String redirectUrl =
        StringUtils.defaultIfEmpty(request.getParameter("redirectUrl"),
            request.getContextPath() + "/app/subscribe/subscribeList");
    log.debug("signin redirectUrl={}", redirectUrl);

    try {
      User user = userDao.login(email, password);
      // 로그인 성공하면 redirectUrl로
      request.getSession().setAttribute("ME", user);
      response.sendRedirect(redirectUrl);
    } catch (DataAccessException e) {
      // 로그인 실패하면 다시 로그인 화면으로
      response.sendRedirect(
          request.getContextPath() + "/app/user/signinForm?redirectUrl=" +
              URLEncoder.encode(redirectUrl, Charset.defaultCharset()));
    }
  }

  /**
   * 로그아웃
   */
  @GetMapping("/user/signout")
  public void signout(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    request.getSession().invalidate();
    response.sendRedirect(request.getContextPath() + "/app/article/articleList");
  }

  /**
   * 회원가입
   */
  @PostMapping("/user/signup")
  public void signup(HttpServletRequest request, HttpServletResponse response)
      throws IOException {
    User user = new User();
    user.setEmail(request.getParameter("email"));
    user.setPassword(request.getParameter("password"));
    user.setName(request.getParameter("name"));

    try {
      userDao.addUser(user);
      // 회원가입 성공하면 로그인
      signin(request, response);
    } catch (DataAccessException e) {
      // 회원가입 실패하면 다시 회원가입 화면으로
      log.error(e.toString());
      response.sendRedirect(request.getContextPath() + "/app/user/signupForm");
    }
  }

  /**
   * 비밀번호 변경
   */
  @PostMapping("/user/updatePassword")
  public void updatePassword(HttpServletRequest request,
      HttpServletResponse response) throws IOException {
    HttpSession session = request.getSession();
    User me = (User) session.getAttribute("ME");
    String currentPassword = request.getParameter("currentPassword");
    String newPassword = request.getParameter("newPassword");

    int updatedRows =
        userDao.updatePassword(me.getUserId(), currentPassword, newPassword);
    if (updatedRows >= 1)
      // 업데이트 성공하면 내정보 화면으로
      response.sendRedirect(request.getContextPath() + "/app/user/myInfo");
    else
      // 업데이트 실패하면 다시 비밀번호변경 화면으로
      response.sendRedirect(
          request.getContextPath() + "/app/user/passwordEdit");
  }

  /**
   * 회원 목록
   */
  @GetMapping("/user/userList")
  public void userList(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int count = NumberUtils.toInt(request.getParameter("count"), 20);
    int page = NumberUtils.toInt(request.getParameter("page"), 1);

    List<User> userList = userDao.listUsers(count, page);
    request.setAttribute("userList", userList);
    request.getRequestDispatcher("/WEB-INF/jsp/user/userList.jsp")
        .forward(request, response);
  }

  /**
   * 회원 정보
   */
  @GetMapping("/user/userInfo")
  public void userInfo(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    int userId = Integer.parseInt(request.getParameter("userId"));

    User user = userDao.getUser(userId);
    request.setAttribute("user", user);
    request.getRequestDispatcher("/WEB-INF/jsp/user/userInfo.jsp")
        .forward(request, response);
  }
  
  //디폴트 맵핑
  @GetMapping({"/user/signinForm", "/user/signupForm", "/user/myInfo", "/user/passwordEdit"})
  private void mapDefault(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
    String pathInfo = request.getPathInfo();
    request.getRequestDispatcher("/WEB-INF/jsp" + pathInfo + ".jsp")
            .forward(request, response);
  }
}
