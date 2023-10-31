import 'dart:math';

import 'package:cafeteria_ofline/Models/seat.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/foundation.dart';

class SeatProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> get data_ => data;

  // Future<List<Map<String, dynamic>>> fetchData() async {
  //   List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
  //       "SELECT DISTINCT  seatx FROM seat    where NOT    seatx  =  ?",
  //       ["Done"]);
  //   data = fetchedData;
  //   notifyListeners();
  // }

  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "SELECT DISTINCT seatx FROM seat WHERE seatx IS NOT 'Done' ",
    );
    data = fetchedData;
    notifyListeners();
    return data;
  }

  String generateRandomString(int length) {
    final random = Random();
    const chars = '0123456789'; // الأحرف الممكنة للرقم العشوائي

    String randomString = '';

    for (int i = 0; i < length; i++) {
      randomString += chars[random.nextInt(chars.length)];
    }

    return randomString;
  }

  void alldata() async {
    await sqlhellper.deleteAllData();
  }

  Future<int> seat_new(String reservation) async {
    print('Test point 1 ::=> ${generateRandomString(10)}');

//     'id' INTEGER PRIMARY KEY AUTOINCREMENT,
//  'seatx' TEXT,
// 'Varieties' TEXT,
//     'amount' TEXT,
//     'price' TEXT,
//     'check' TEXT,
//     'computer' TEXT,
//     'reservation' TEXT
    int ins = await sqlhellper.addData(
        Seat(
            Seatx: reservation,
            Varieties: "BOOK",
            amount: "0",
            price: "0",
            check: generateRandomString(10),
            computer: "0",
            reservation: reservation),
        "seat");

    if (ins != -1) {
      fetchData();
      print(1);
      return 1;
    } else {
      print(2);
      return 2;
    }
  }
}
