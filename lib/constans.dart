import 'package:flutter/material.dart';

import 'colors.dart';

var textStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
var whatsAppDestekDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
      colors: linearColors,
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);
var vipDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  gradient: LinearGradient(
      colors: linearVipColors,
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

final String instagramIcon = "assets/icons/instagram.svg";
final String whatsappIcon = "assets/icons/whats_app.svg";
final String tiktokIcon = "assets/icons/tiktok.svg";
final String twitterIcon = "assets/icons/twitter.svg";
final String homeIcon = "assets/icons/home_screen.svg";
final String newsIcon = "assets/icons/new_screen.svg";
final String profileIcon = "assets/icons/profile_screen.svg";
final String aboutIcon = "assets/icons/contact_screen.svg";
final String macUrl = "https://xn--kazananlarkulb-ssbb.com/api/macs";
final String newsUrl = "https://xn--kazananlarkulb-ssbb.com/api/news";
final String loginUrl = "https://xn--kazananlarkulb-ssbb.com/api/login";
final String registerUrl = "https://xn--kazananlarkulb-ssbb.com/api/register";
final String baseUrl = "https://xn--kazananlarkulb-ssbb.com/public/images/";
double iconSize = 25;
double iconSizeLarge = 50;

var padding = EdgeInsets.all(8);
var paddingHorizontal = EdgeInsets.symmetric(horizontal: 8.0);
var paddingVertical = EdgeInsets.symmetric(vertical: 8);
var style =
    BoxDecoration(color: macItemColor, borderRadius: BorderRadius.circular(10));
BoxDecoration imageDecoration = BoxDecoration(
    image:
        DecorationImage(image: AssetImage("assets/mac.jpg"), fit: BoxFit.fill),
    borderRadius: BorderRadius.circular(0),
    color: Colors.red);
var loginDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      color: macItemColor,
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.circular(15),
  color: macItemColor,
);
var texFieldDecoration = InputDecoration(
  hintText: "Kullanıcı Adı",
  isDense: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
  ),
);

final String hakkimizda =
    """Herkese merhabalar arkadaşlar. Kısaca sizlere kendimden bahsetmek istiyorum. Ben Cenk Karataş,  :39 yaşındayım. Yaklaşık olarak 18 yıldır resmî olarak bir çok (misli- birebin- tuttur) vb gibi platformlar da editörlük ve yazarlık yapmış bulunmaktayım. 2 yıldır bu tür platformları bırakıp ara vermiştim, fakat kısa bir aradan sonra bomba gibi ücretsiz mobil uygulamamız İle karşınızdayım.. Sizlere ücretsiz şekilde her konuda detaylı bilgiler vermek istiyorum… 

Öncelikle daha önce  yapmış olduğum işten sizlere biraz bahsetmek istiyorum. Editörlükten.. Sizlerde görüyorsunuzdur ki çoğu yazar genelde takımların son durumlarına form durumuna, iç saha da söyle oynuyor deplasman bu şekilde oynuyor eksikler vb basit şeylere bakarak basit  yorumlar yapıyorlar ki genelde yazarların çoğu tahmini ters cıkıyor. Zaten önceden bende dahil yazarlar bu sitelerin bir nevi iddianın adamı gibidir. Sizin kazanmanız İÇİN değil basit yorumlar İle kaybedip kasanın yani idda’nın kazanması İÇİN oradadır.. 

Kısacası İdda’dan kazanmak istiyen arkadaşlarım öncelikle oranları düzenli olarak takip etmelidir. Benim gibi üniversite de İstatistik bölümü okuyan arkadaşlarım nedemek isteyeceğimi çok iyi anlayacaktır. 

Size açılmış oranları İdda istatistik bölümü açmaktadır. Peki bu oranlar neye göre açılıyor… Bu oranları açan arkadaşlarımız zaten bu oynayacak olan iki takımın tüm herseyine bakarak bu oranları sizlere Açıyor. Yani ev sahibi evinde ortalama kaç gol atıyor, eksik var mı, suni çimde nasıl oynuyor, hava durumuna, maçı yöneten hakeme dahi vb bir çok verilere bakarak bu oranları size açıyorlar. Bizim yazarlar da yazmak İÇİN işte ev Şahibi  çok formda su eksik hava yagmurlu mac sonucu su olur diyor.. bunlar önemli elbette önemli fakat bunlara zaten bakılıp bizlere bu oranlar açılıyor. Burada önemli olan oranlar arasındaki bağlardır. Tam da burada devreye Biz Kazananlar Kulübü ekibi olarak biz giriyoruz …  Zamanla herşeyi burada sizlere paylaşacağız…""";
final String tiktok =
    "https://www.tiktok.com/@kazananlarkulubu45?_t=8Z1EDQcQulp&_r=1";
final String twitter =
    "https://twitter.com/kazananlarklbu?s=11&t=lXr9oiBFbG8JfPfTSvJgsw";
final String instagram =
    "https://instagram.com/kazananlarkulubu45?igshid=YmMyMTA2M2Y=";
final String whatsApp = 'https://wa.me/05558891448?text=hello';
