import 'dart:math';

import 'package:cafeteria_ofline/Models/seat.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/foundation.dart';

class SeatProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> get data_ => data;

  String sum1 = "0";
  String sum2 = "0";
  String sum3 = "0";
  String sum4 = "0" ?? "0";
  String sum5 = "0";

  String sum6 = "0";
  String sum7 = "0";
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
    item_sum();
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

    return "check:$randomString";
  }

  void alldata() async {
    await sqlhellper.deleteAllData();
  }

  void allcat() async {
    await sqlhellper.executeQuery(tableCreationQueries);
  }

  Future<int> seat_new(String reservation) async {
    print('Test point 1 ::=> ${generateRandomString(10)}');
    int ins = await sqlhellper.addData(
        Seat(
            Seatx: reservation,
            Varieties: "BOOK",
            Quantity: "1",
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

  void item_sum() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "select sum(price) from seat",
    );

    List<Map<String, dynamic>> fetchedData2 = await sqlhellper.readData(
      "select sum(price) from item",
    );

    List<Map<String, dynamic>> fetchedData3 = await sqlhellper.readData(
      "select sum(price) from Worker",
    );

    List<Map<String, dynamic>> fetchedData4 = await sqlhellper.readData(
      "select sum(price) from Consumptions",
    );
    List<Map<String, dynamic>> fetchedData5 = await sqlhellper.readData(
        "select sum(price) from seat    where NOT  seatx  =  ?", ["Done"]);

    List<Map<String, dynamic>> fetchedData7 = await sqlhellper.readData(
        "select sum(price) from seat    where   seatx  =  ?", ["Done"]);
// select sum(Total) from a77    where NOT  seat  =  ?
    sum1 = fetchedData[0]['sum(price)'].toString() ?? "0";
    sum2 = fetchedData2[0]['sum(price)'].toString() ?? "0";
    sum3 = fetchedData3[0]['sum(price)'].toString() ?? "0";
    sum4 = fetchedData4[0]['sum(price)'].toString() ?? '0';
    sum5 = fetchedData5[0]['sum(price)'].toString() ?? "0";
    sum5 = fetchedData5[0]['sum(price)'].toString() ?? "0";
    sum7 = fetchedData7[0]['sum(price)'].toString() ?? "0";
    // double item = double.parse(sum2);
    // double Consumptions = double.parse(sum4.replaceAll(RegExp(r'[^0-9.]'),'' )??0;

// debugPrint("$sum4"+"sssssss");
double? Consumptions = double.tryParse(sum4) ?? 0;

double? Worker = double.tryParse(sum3) ?? 0;

double? item = double.tryParse(sum2) ?? 0;
double? all = double.tryParse(sum7) ?? 0;
double x =item + Consumptions + Worker;
    double all_ =  all-x;
    sum6 = all_.toString();
    notifyListeners();
  }
}
