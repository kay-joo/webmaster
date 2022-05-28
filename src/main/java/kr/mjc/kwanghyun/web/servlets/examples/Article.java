package kr.mjc.kwanghyun.web.servlets.examples;


import lombok.Data;

@Data
public class Article {
  int articleId;
  String title;
  String content;
  int userId;
  String name;
  String cdate;
  String udate;
}
