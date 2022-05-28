package kr.mjc.kwanghyun.web.model1;

import kr.mjc.kwanghyun.web.servlets.examples.Article;
import kr.mjc.kwanghyun.web.servlets.examples.ArticleDao;
import kr.mjc.kwanghyun.web.servlets.examples.User;
import kr.mjc.kwanghyun.web.servlets.examples.UserDao;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 *  기사 목록 화면
 */
@WebServlet("/model1/article/articleList")
public class ArticleListServlet extends HttpServlet {

    @Autowired
    private ArticleDao articleDao;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int count = NumberUtils.toInt(request.getParameter("count"), 20);
        int page = NumberUtils.toInt(request.getParameter("page"), 1);
        List<Article> articleList = articleDao.listArticles(count, page);
        request.setAttribute("articleList", articleList);
        request.getRequestDispatcher("/WEB-INF/jsp/model1/user/articleList.jsp")
                .forward(request, response);
    }
}
