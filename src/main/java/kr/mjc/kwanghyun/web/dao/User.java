package kr.mjc.kwanghyun.web.dao;

import lombok.Data;
import lombok.ToString;

@Data
public class User {
  int userId;
  String email;
  @ToString.Exclude
  String password;
  String password2;
  String name;
  String user_birth;
  String user_phone;
  String user_gender;
  String zipcode;
  String jaddress;
  String raddress;
  String address;

}
