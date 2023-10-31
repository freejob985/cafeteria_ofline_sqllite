import 'dart:math';
import 'dart:ui';

import 'package:another_flushbar/flushbar.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:flutter/material.dart';

TextStyle? TextStyle_(
    {int fontSize = 10, Color color = const Color.fromARGB(255, 70, 69, 69)}) {
  return TextStyle(
    fontSize: fontSize.toDouble(),
    fontFamily: 'Al-Jazeera',
    fontWeight: FontWeight.normal,
    color: color,
  );
}

void showNotification(BuildContext context,
    {required String title, required String message, bool success = true}) {
  Flushbar(
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 16, // تغيير حجم الخط
        color: Colors.white, // تغيير لون النص
        fontWeight: FontWeight.bold,
        // fontFamily: Jazeera, // تغيير وزن الخط
      ),
    ),
    icon: success ? const Icon(Icons.check) : const Icon(Icons.error),
    backgroundColor: success ? Colors.green : Colors.red,
    duration: success ? Duration(seconds: 6) : Duration(seconds: 6),
  ).show(context);
}

void navigateToPage(BuildContext context, Widget page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    return Scaffold(
      body: page,
    );
  }));
}

String generateRandomNumber(int length) {
  final random = Random();

  // حدود القيمة المسموح بها تبدأ من 1 وليست من 0
  final max = pow(10, length).toInt() - 1;

  int randomInt = random.nextInt(max); // توليد رقم عشوائي

  // يجب التحقق من أن الرقم المولد له الطول المطلوب
  String randomString =
      randomInt.toString().padLeft(length, '0'); // استخدام padLeft لتكوين الرقم

  String n = "check:$randomString";
  return n;
}


void addbook(BuildContext context, SeatProvider databaseProvider) {
  TextEditingController newReservationController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('إضافة حجز جديد'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: newReservationController, // تعيين الـ controller هنا
              decoration: InputDecoration(
                hintText: 'اسم الحجز',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newReservationName = newReservationController.text;
                print(newReservationName); // الحصول على القيمة
                if (newReservationName.isNotEmpty) {
                  var x = databaseProvider.seat_new(newReservationName);
                  //   databaseProvider.alldata();
                  print(x);
                }
              },
              child: Text('إضافة'),
            ),
          ],
        ),
      );
    },
  );
}
