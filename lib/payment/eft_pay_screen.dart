import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:untitled53/colors.dart';
import 'package:untitled53/constans.dart';

import '../login/login_screen.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGround_Color,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: titleColor,
          ),
        ),
      ),
      backgroundColor: backGround_Color,
      body: Center(
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/Component.png", width: 120),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    "Üyliğinizi Yükseltin ve kazanmaya başlayın",
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Items("  Aylık", "400", monthColor),
                      Items("2 Aylık", "600", twoMonth),
                      Items("3 Aylık", "750", threeMonth),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: padding,
                color: backGround_Color,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              "IBAN:TR03 0011 1000 0000 0078 5942 19",
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(
                                  "TR03 0011 1000 0000 0078 5942 19");
                            },
                            icon: Icon(Icons.copy)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Furkan kupşen", style: textStyle),
                        IconButton(
                            onPressed: () {
                              FlutterClipboard.copy("Furkan kupşen");
                            },
                            icon: Icon(Icons.copy))
                      ],
                    ),
                    Text(
                      "Açıklama kısmına ekletiniz!",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${user.isim} ${user.soyisim}\n${user.email}",
                            style: textStyle),
                        IconButton(
                            onPressed: () {
                              FlutterClipboard.copy(
                                  "${user.isim} ${user.soyisim}\n${user.email}");
                            },
                            icon: Icon(Icons.copy))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding Items(String ay, String fiyat, Color renk) {
    return Padding(
      padding: padding,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: renk,
        ),
        padding: padding,
        width: 100,
        child: Text(
          "$ay \n\n\n\n$fiyat",
          style: textStyle,
        ),
      ),
    );
  }
}
