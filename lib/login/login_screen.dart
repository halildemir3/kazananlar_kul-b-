import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:untitled53/homePage/homePage.dart';
import 'package:untitled53/login/user_model.dart';
import 'package:untitled53/register/register_screen.dart';
import '../colors.dart';
import '../constans.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible = true;
  var formKey = GlobalKey<FormState>();
  var tfKullaniciadi = TextEditingController();
  var tfSifre = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround_Color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _spacer(),
              Image.asset("assets/Component.png", width: 120),
              _spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: loginDecoration,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: tfKullaniciadi,
                          decoration: texFieldDecoration,
                          validator: (tfgirdisi) {
                            if (tfgirdisi!.isEmpty) {
                              return "Kullanıcı adı giriniz";
                            }
                            return null;
                          },
                        ),
                        spacer(),
                        TextFormField(
                          controller: tfSifre,
                          obscureText: isVisible,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              child: isVisible
                                  ? Icon(Icons.visibility) //visibility_off
                                  : Icon(Icons.visibility_off),
                              onTap: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                            ),
                            hintText: "Şifre",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          validator: (tfgirdisi) {
                            if (tfgirdisi!.isEmpty) {
                              return "Şifre giriniz";
                            }

                            if (tfgirdisi.length < 6) {
                              return "Şifreniz en az 6 haneli olmalıdır";
                            }

                            return null;
                          },
                        ),
                        spacer(),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: double.maxFinite,
                            child: Center(
                                child: Text(
                              "GİRİŞ",
                              style: TextStyle(color: backGround_Color),
                            )),
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 1)),
                          ),
                          onTap: () async {
                            bool kontrolSonucu =
                                formKey.currentState!.validate();

                            if (kontrolSonucu) {
                              String ka = tfKullaniciadi.text;
                              String s = tfSifre.text;
                              print("Kullanıcı adı : $ka - Şifre : $s");
                              getUser(ka, s);
                              /* var headers = {
                                "Content-Type": "application/json",
                                "Accept": "application/json",
                              };
                              Map<String, dynamic> body = {
                                'email': ka,
                                'pass': s,
                              };
                              String jsonBody = json.encode(body);
                              var res = await http.post(
                                Uri.parse(loginUrl),
                                body: jsonBody,
                                headers: headers,
                              );

                              if (res.statusCode == 200) {
                                var body = jsonDecode(res.body);
                                User user = User(
                                  id: body["user"][0]["id"],
                                  isim: body["user"][0]["isim"],
                                  admin: 0,
                                  createdAt: body["user"][0]["created_at"],
                                  email: body["user"][0]["email"],
                                  pass: "",
                                  soyisim: body["user"][0]["soyisim"],
                                  updatedAt: body["user"][0]["updated_at"],
                                  vip: body["user"][0]["vip"],
                                );
                                if (body["code"] == 200) {
                                  Get.off(HomePage(
                                    user: user,
                                  ));
                                }
                              } else {
                                throw "Unable to retrieve posts.";
                              }*/
                            }
                          },
                        ),
                        spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.to(RegisterPage());
                            },
                            child: Container(
                              child: Center(
                                child: Text(
                                  "Kayıt Ol",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: backGround_Color,
                                  borderRadius: BorderRadius.circular(30)),
                              width: double.maxFinite,
                              height: 50,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox _spacer() {
    return SizedBox(
      height: 60,
    );
  }

  spacer() {
    return SizedBox(
      height: 30,
    );
  }
}

User user = User();
getUser(String email, String password) async {
  var headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  Map<String, dynamic> body = {
    'email': email,
    'pass': password,
  };
  String jsonBody = json.encode(body);
  var res = await http.post(
    Uri.parse(loginUrl),
    body: jsonBody,
    headers: headers,
  );

  if (res.statusCode == 200) {
    var body = jsonDecode(res.body);
    print("${body["code"] == 200}");

    if (body["code"] == 200) {
      user = User(
          id: body["user"][0]["id"],
          isim: body["user"][0]["isim"],
          admin: 0,
          createdAt: body["user"][0]["created_at"],
          email: body["user"][0]["email"],
          pass: "",
          soyisim: body["user"][0]["soyisim"],
          updatedAt: body["user"][0]["updated_at"],
          vip: body["user"][0]["vip"].toString() //body["user"][0]["vip"],
          );
      Get.snackbar(
        duration: Duration(milliseconds: 1000),
        isDismissible: true,
        "Başarılı",
        "Anasyafaya yönlendiriliyorsunuz",
      );
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.off(HomePage());
      });
    } else {
      Get.snackbar(
        duration: Duration(milliseconds: 1000),
        isDismissible: true,
        "Giriş başarısız",
        "e-mail ve şifrenizi kontrol ediniz",
      );
    }
  }
}
