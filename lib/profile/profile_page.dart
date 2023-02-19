import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:untitled53/constans.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors.dart';
import '../login/login_screen.dart';
import '../payment/eft_pay_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround_Color,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              width: 100,
              height: 100,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            _spacer(),
            Text("${user.isim} ${user.soyisim}"),
            _spacer(),
            Text("${user.email}"),
            _spacer(),
            GestureDetector(
              onTap: () {
                Get.to(PaymentPage());
              },
              child: Padding(
                padding: padding * 1.5,
                child: Container(
                  decoration: vipDecoration,
                  height: 60,
                  width: double.maxFinite,
                  padding: padding,
                  child: Center(
                    child: Text(
                      "Üyeliğinizi Yükseltin",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: padding * 1.5,
        child: GestureDetector(
          onTap: () => _openWhatsApp(),
          child: Container(
            decoration: whatsAppDestekDecoration,
            height: 60,
            width: double.maxFinite,
            padding: padding,
            child: Row(
              children: [
                SvgPicture.asset(
                  whatsappIcon,
                  color: black,
                  height: iconSizeLarge,
                  width: iconSizeLarge,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Whats App Destek",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _spacer() {
    return SizedBox(
      height: 20,
    );
  }
}

void _openWhatsApp() async {
  var url = whatsApp;
  await launch(url);
}
