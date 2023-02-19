import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:untitled53/colors.dart';
import 'package:untitled53/constans.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround_Color,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: padding,
                    child: Text(
                      hakkimizda,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 75,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: padding * 1.5,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: macItemColor),
            //width: double.maxFinite,
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: paddingHorizontal,
                  child: GestureDetector(
                    onTap: () => _launchUrl(twitter),
                    child: SvgPicture.asset(
                      twitterIcon,
                      color: black,
                      height: iconSizeLarge,
                      width: iconSizeLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: paddingHorizontal,
                  child: GestureDetector(
                    onTap: () => _launchUrl(instagram),
                    child: SvgPicture.asset(
                      instagramIcon,
                      color: black,
                      height: iconSizeLarge,
                      width: iconSizeLarge,
                    ),
                  ),
                ),
                Padding(
                  padding: paddingHorizontal,
                  child: GestureDetector(
                    onTap: () => _launchUrl(tiktok),
                    child: SvgPicture.asset(
                      tiktokIcon,
                      color: black,
                      height: iconSizeLarge,
                      width: iconSizeLarge,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

Future<void> _launchUrl(String _url) async {
  await launch(_url);
}
