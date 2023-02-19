import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled53/macDetay/macModel.dart';
import 'package:untitled53/payment/eft_pay_screen.dart';

import '../colors.dart';
import '../constans.dart';
import '../login/login_screen.dart';

class MacDetay extends StatefulWidget {
  const MacDetay({Key? key, required this.nesne}) : super(key: key);
  final MacModel nesne;

  @override
  State<MacDetay> createState() => _MacDetayState();
}

class _MacDetayState extends State<MacDetay> {
  @override
  void initState() {
    print(user.id);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGround_Color,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: titleColor,
          ),
        ),
        backgroundColor: backGround_Color,
        title: Text(
          "${widget.nesne.ev} & ${widget.nesne.dep}",
          style: TextStyle(color: titleColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "${widget.nesne.saat}",
                      style: TextStyle(
                          color: black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                  height: 50,
                  width: double.maxFinite,
                  color: Colors.white.withOpacity(0.6),
                )
              ],
            ),
            height: 180,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("$baseUrl${widget.nesne.image}"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: widget.nesne.comments?.length == 0
                            ? 0
                            : widget.nesne.comments?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return widget.nesne.comments![index].vip == 1 &&
                                  user.vip == "0"
                              ? Padding(
                                  padding: padding,
                                  child: GestureDetector(
                                    onTap: () {
                                      _showDialog();
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      decoration: style,
                                      child: Icon(
                                        Icons.visibility_off_outlined,
                                        size: 80,
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: padding,
                                  child: Container(
                                    padding: padding,
                                    decoration: style,
                                    width: double.maxFinite,
                                    child: Text(
                                      widget.nesne.comments!.isNotEmpty
                                          ? "${widget.nesne.comments![index].content}"
                                          : "",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(color: black),
                                    ),
                                  ),
                                );
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _showDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Text("Üyeliğinizi yükseltin"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Vip yorumları görebilmek için üyeliğinizi yükseltiniz",
                  style: textStyle,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Aylık 400",
                  style: textStyle,
                ),
                Text(
                  "2 Aylık 600",
                  style: textStyle,
                ),
                Text(
                  "3 Aylık 750",
                  style: textStyle,
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            actions: [
              MaterialButton(
                color: unselectedItemColor,
                child: Text(
                  "Kapat",
                  style: TextStyle(
                    color: backGround_Color,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                shape: StadiumBorder(),
              ),
              MaterialButton(
                  minWidth: 150,
                  shape: StadiumBorder(),
                  color: vipButtonColor,
                  child: Text(
                    "VIP al",
                    style: TextStyle(
                        color: backGround_Color,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Get.to(PaymentPage());
                  }),
            ],
          );
        });
  }
}
