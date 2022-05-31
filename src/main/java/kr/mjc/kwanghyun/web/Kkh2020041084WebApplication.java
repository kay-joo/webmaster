package kr.mjc.kwanghyun.web;

import kr.mjc.kwanghyun.web.servlets.controller.SigninInterceptor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.web.servlet.config.annotation.InterceptorRegistration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@ServletComponentScan(basePackages = "kr.mjc.kwanghyun.web.servlets")
@Slf4j
public class Kkh2020041084WebApplication extends SpringBootServletInitializer
        implements WebMvcConfigurer {
    public static void main(String[] args) {
        SpringApplication.run(Kkh2020041084WebApplication.class, args);
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        InterceptorRegistration signinReg =
                registry.addInterceptor(new SigninInterceptor());
        signinReg.addPathPatterns("/user/myInfo", "/user/passwordEdit", "/user/userList",
                "/user/updatePassword", "/article/articleForm", "/article/articleEdit",
                "/article/addArticle", "/article/updateArticle", "/article/deleteArticle",
                "/subscribe/subscribeList", "/subscribe/subscribeForm", "/subscribe/addSubscribe",
                "/subscribe/subscribeEdit", "/subscribe/updateSubscribe", "/subscribe/deleteSubscribe");
        log.info("SigninInterceptor 등록");
    }

    /**
     * 서블릿 컨테이너에 배포하기 위한 구성
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(Kkh2020041084WebApplication.class);
    }
}
