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
