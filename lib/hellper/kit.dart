import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:flutter/material.dart';

TextField Field(
  TextEditingController _itemController,
  String labelText,
  String hintText, {
  TextInputType? keyboardType,
  String? Function(String?)?
      validator, // إضافة معامل اختياري لنوع لوحة المفاتيح
}) {
  return TextField(
    controller: _itemController,
    decoration: InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle_(fontSize: 15, color: Colors.white),
      border: InputBorder.none,
      filled: true,
      fillColor: pr,
      hintText: hintText,
      hintStyle: TextStyle_(fontSize: 15, color: Colors.white),
    ),
    style: TextStyle(fontSize: 15, color: Colors.white),
    keyboardType: keyboardType,

// تعيين نوع لوحة المفاتيح
  );
}

TextStyle? TextStyle_({
  int fontSize = 10,
  Color color = const Color.fromARGB(255, 70, 69, 69),
  TextDecoration? decoration, // جعل القيمة اختيارية بواسطة TextDecoration?
}) {
  return TextStyle(
    fontSize: fontSize.toDouble(),
    fontFamily: 'Al-Jazeera',
    fontWeight: FontWeight.normal,
    color: color,
    decorationThickness: 2,
    decoration: decoration, // استخدام القيمة الاختيارية هنا
  );
}

ElevatedButton elvbtn({
  required BuildContext context,
  VoidCallback? func,
  String label = 'Button',
  double w = 0.45,
  double h = 0.30,
double fontSize = 15,
  Icon icon = const Icon(Icons.access_alarm),
  Color buttonColor = Colors.green,
  String? font_ = "Al-Jazeera",
}) {
  return ElevatedButton.icon(
    onPressed: func,
    icon: icon, // إضافة الأيقونة المحددة للزر
    label: Text(
      textAlign: TextAlign.center,
      label,
      style: TextStyle(
        fontFamily: font_,
        fontSize: fontSize,
      ),
    ), // استخدام label كنص للزر
    style: ElevatedButton.styleFrom(
      fixedSize: Size(
        MediaQuery.of(context).size.width * w,
        MediaQuery.of(context).size.width * h,
      ), // تعيين الحجم بناءً على عرض الشاشة
      primary: buttonColor, // تغيير لون الزر
    ),
  );
}
