import 'package:flutter/material.dart';

colorX(String color) {
  String newColor = '0xff' + color;

  newColor = newColor.replaceAll('#', '');

  int dartColor = int.parse(newColor);
  return Color(dartColor);
}

List<Color> linearColors = [colorX('28D146'), colorX('5FFC7B')];
List<Color> linearVipColors = [
  colorX('FFD700'),
  colorX('D2AC47'),
];
Color loginScaffoldColor = colorX('FFFFFF');
Color monthColor = colorX('D3CACA');
Color twoMonth = colorX('12DB00');
Color threeMonth = colorX('FAFF00');
Color macItemColor = colorX('F5EDED');
Color titleColor = colorX("#8C6A52");
Color vipButtonColor = colorX("#FFD700");

Color backGround_Color = colorX("#FFFFFF");
Color loginmenuColor = colorX('413838');
Color black = colorX("#000000");
Color bottomBarColor = colorX('191919');
Color appBarColor = colorX('191919').withOpacity(0.1);
Color bodyColor = colorX('333333');
Color textColor = colorX('ffffff');
Color unselectedItemColor = colorX("#6A4225");
Color selectedItemColor = colorX("#000000");
List<Color> buttonColor = [colorX("#B9845F"), colorX("#6A4225")];
//Color textColor = colorX("#FFFFFF");
Color activeColor = colorX("#6A4225");
Color inActiveColor = colorX("#3F3F3F");
Color cardColor = colorX("#F5EDED");

Color locationText = colorX("#010101");
Color categoriesTextColor = colorX("#8C6A52");

Color textFieldColor = colorX("#F8F7FA");
Color unSlectedCategoriesColor = colorX("#F8F7FA");
Color backGroundColor = colorX("#FFFFFF");
Color bottomSheetBackGroundColor = colorX("#F8F7FA");
Color bottomSheetTabBarColor = colorX("#E6E6E9");
