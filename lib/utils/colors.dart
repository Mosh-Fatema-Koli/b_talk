import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String uri = "https://apihomechef.antopolis.xyz/api/admin/";

//flutter run -d chrome --web-renderer htmlY

class AppColors {

  static const Color backgroundColor = Colors.white;
  static const Color primaryColor = Color(0xff9572EF);


  static const Color colorDark = Colors.black;
  static const Color colorWhite = Colors.white;
  static const Color colorButton =  Color(0xFF05265A);
  static const Color colorButton2 =  Color(0xFF249FD7);

  static const Color lightGreyColor = Color(0xFFEFEFEF);
  static const Color greyColor = Color(0xFF918D8D);

  static const Color light_purple = Color(0xFFECE3FE);
  static const Color Deep_purple = Color(0xFF9260F4);


}


myStyle(double size, [Color? color, FontWeight? fw]) {
  return GoogleFonts.roboto(
    fontSize: size,
    color: color,
    fontWeight: fw,
  );
}

myStyles14() {
  return GoogleFonts.roboto(
    fontSize: 14,
    color: AppColors.colorDark,
  );
}

myStyles12() {
  return GoogleFonts.roboto(
    fontSize: 12,
    color: AppColors.colorDark,
  );
}

myStyles16() {
  return GoogleFonts.roboto(
    fontSize: 16,
    color: AppColors.colorDark,
    fontWeight: FontWeight.w400,
  );
}

myStyles18() {
  return GoogleFonts.roboto(
    fontSize: 18,
    color: Color.fromARGB(255, 221, 221, 223),
    fontWeight: FontWeight.w700,
  );
}

myStyles20() {
  return GoogleFonts.roboto(
    fontSize: 20,
    color: AppColors.colorDark,
    fontWeight: FontWeight.w700,
  );
}