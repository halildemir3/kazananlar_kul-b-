import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled53/colors.dart';
import 'package:untitled53/constans.dart';
import 'package:untitled53/login/login_screen.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formKey = GlobalKey<FormState>();
  var tfAd = TextEditingController();
  var tfSoyad = TextEditingController();
  var tfEmail = TextEditingController();
  var tfSifre = TextEditingController();
  var tfSifreTekrar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: titleColor,
          ),
        ),
        title: Image.asset("assets/register_title.png"),
        centerTitle: true,
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: tfAd,
                        decoration: InputDecoration(
                          hintText: " Ad",
                          border: OutlineInputBorder(),
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi!.isEmpty) {
                            return "Adınız Giriniz";
                          }
                          return null;
                        },
                      ),
                      spacer(),
                      TextFormField(
                        controller: tfSoyad,
                        decoration: InputDecoration(
                          hintText: "Soyad",
                          border: OutlineInputBorder(),
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi!.isEmpty) {
                            return "Soyadınızı giriniz";
                          }
                          return null;
                        },
                      ),
                      spacer(),
                      TextFormField(
                        controller: tfEmail,
                        decoration: InputDecoration(
                          hintText: "E-mail",
                          border: OutlineInputBorder(),
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi!.isEmpty) {
                            return "E-mail adresinizi giriniz";
                          }
                          return null;
                        },
                      ),
                      spacer(),
                      TextFormField(
                        controller: tfSifre,
                        decoration: InputDecoration(
                          hintText: "Şifre",
                          border: OutlineInputBorder(),
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi!.isEmpty) {
                            return "Bir şifre giriniz";
                          } else if (tfgirdisi.length < 6) {
                            return "Şifreniz en az 6 haneli olmalıdır";
                          } else {
                            return null;
                          }
                        },
                      ),
                      spacer(),
                      TextFormField(
                        controller: tfSifreTekrar,
                        decoration: InputDecoration(
                          hintText: "Şifre Tekrar",
                          border: OutlineInputBorder(),
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi!.isEmpty) {
                            return "Şifrenizi tekrar giriniz";
                          } else if (tfgirdisi == tfSifre.text) {
                            return null;
                          } else {
                            return "Şifrelerniz aynı değil";
                          }
                        },
                      ),
                      spacer(),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          child: Center(
                              child: Text(
                            "KAYIT OL",
                            style: TextStyle(color: backGround_Color),
                          )),
                          decoration: BoxDecoration(
                              color: Colors.brown,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Colors.black12, width: 1)),
                        ),
                        onTap: () {
                          bool kontrolSonucu = formKey.currentState!.validate();

                          if (kontrolSonucu) {
                            String isim = tfAd.text;
                            String soyisim = tfSoyad.text;
                            String email = tfEmail.text;
                            String sifre = tfSifre.text;
                            saveUser(isim, soyisim, email, sifre);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox spacer() {
    return SizedBox(
      height: 30,
    );
  }
}

saveUser(
  String isim,
  String soyisim,
  String email,
  String sifre,
) async {
  var headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
  Map<String, dynamic> body = {
    'isim': isim,
    'soyisim': soyisim,
    'email': email,
    'pass': sifre,
  };
  String jsonBody = json.encode(body);
  var res = await http.post(
    Uri.parse(registerUrl),
    body: jsonBody,
    headers: headers,
  );

  if (res.statusCode == 200) {
    var body = jsonDecode(res.body);
    print("${body["message"]}");

    if (body["code"] == 200) {
      Get.snackbar(
        "Kayıt Başarılı",
        "Giriş Sayfasına yönlendiriliyorsunuz",
      );
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.off(LoginPage());
      });
    } else {
      Get.snackbar(
        "Kayıt Başarısız",
        "Lütfen bilgilerinizi kontrol edip tekrar deneyiniz",
      );
    }
  } else {
    throw "Unable to retrieve posts.";
  }
}
