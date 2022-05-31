package kr.mjc.kwanghyun.web.servlets.controller;

import kr.mjc.kwanghyun.web.dao.ArticleDao;
import kr.mjc.kwanghyun.web.dao.Article;
import kr.mjc.kwanghyun.web.dao.User;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.math.NumberUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.server.ResponseStatusException;

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
public class ArticleController {

    public static final String CURRENT_ARTICLE_LIST = "CURRENT_ARTICLE_LIST";
    private final ArticleDao articleDao;

    public ArticleController(ArticleDao articleDao) {
        this.articleDao = articleDao;
    }

    /**
     * 기사 목록
     */
    @GetMapping("/article/articleList")
    public void articleList(int count, int page, HttpServletRequest request, Model model) {
        List<Article> articleList = articleDao.listArticles(count, page);

        //Url 세팅
        String currentUrl = HttpUtils.getRequestURLWithQueryString(request);
        request.getSession().setAttribute(CURRENT_ARTICLE_LIST, currentUrl);

        model.addAttribute("articleList", articleList);
    }

    /**
     * 게시글 조회
     */
    @GetMapping("/article/articleView")
    public void articleView(int articleId, Model model) {
        Article article = articleDao.articleView(articleId);
        model.addAttribute("article", article);
    }

    /**
     * 글쓰기 화면
     */
    @GetMapping("/article/articleForm")
    public void articleForm() {
    }

    /**
     * 게시글 수정화면
     */
    @GetMapping("/article/articleEdit")
    public void articleEdit(int articleId, @SessionAttribute("ME") User me, Model model) {
        Article article = articleDao.articleView(articleId);
        //본인 글이 아닌 경우
        if (article.getUserId() != me.getUserId())
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        model.addAttribute("article", article);
    }

    /**
     * 게시글 추가 후 목록 1페이지로 리다이렉트
     */
    @PostMapping("/article/addArticle")
    public String addArticle(Article article, @SessionAttribute("ME") User me) {
        article.setUserId(me.getUserId());
        article.setName(me.getName());
        articleDao.addArticle(article);
        return "redirect:/app/article/articleList?count=25&page=1";
    }

    /**
     * 게시글 수정 후 수정된 글로 리다이렉트
     */
    @PostMapping("/article/updateArticle")
    public String updateArticle(Article article, @SessionAttribute("ME") User me) {
        article.setUserId(me.getUserId());
        if (articleDao.updateArticle(article) < 1)
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        return "redirect:/app/article/articleView?articleId=" + article.getArticleId();
    }

    /**
     * 게시글 삭제 후 현재목록으로 리다이렉트
     */
    @GetMapping("/article/deleteArticle")
    public String deleteArticle(int articleId, @SessionAttribute("ME") User me,
                              @SessionAttribute(CURRENT_ARTICLE_LIST) String currentArticleList) {
        if (articleDao.deleteArticle(articleId, me.getUserId()) < 1)
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        return "redirect:" + currentArticleList;
    }
}
