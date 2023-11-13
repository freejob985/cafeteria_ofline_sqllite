import 'dart:math';

import 'package:cafeteria_ofline/Models/seat.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';

class BenchProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> get data_ => data;
// seat = ?

  Future<List<Map<String, dynamic>>> fetchData() async {
    String? seat = await SessionManager.getSession('seat');

    List<Map<String, dynamic>> fetchedData =
        await sqlhellper.getDataWithSorting('Cat', 'id');
    data = fetchedData;
    notifyListeners();
    return data;
  }

  Future<List<Map<String, dynamic>>> serche(String key) async {
    // List<Map<String, dynamic>> fetchedData = await sqlhellper
    //     .searchWithMultipleConditions("Cat", "id", ['Category'], [key]);
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
        'select * from Cat where Category like ? or ty like ?  ',
        ['%$key%', '%$key%']);
    data = fetchedData;
    // print(data);
    notifyListeners();
    return data;
  }

  Future<List<Map<String, dynamic>>> sec(String key) async {
    // List<Map<String, dynamic>> fetchedData = await sqlhellper
    //     .searchWithMultipleConditions("Cat", "id", ['Category'], [key]);
    List<Map<String, dynamic>> fetchedData = await sqlhellper
        .readData('select * from Cat where  ty like ?  ', ['%$key%']);
    data = fetchedData;
    // print(data);
    notifyListeners();
    return data;
  }

  Future<List<Map<String, dynamic>>> seat() async {
    String? seat = await SessionManager.getSession('seat');

    List<Map<String, dynamic>> fetchedData = await sqlhellper
        .getDataWithSorting('seat', 'id',
            whereClause: 'seatx = ?', additionalArgs: [seat]);
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

    return "check:$randomString";
  }

  Future<void> addres(String Product, seat, BuildContext context) async {
    List<Map<String, dynamic>> seat_data = await sqlhellper.readData(
        'select  *  from  seat  where  seatx = ?  and  Varieties= ?  ',
        [seat, Product]);

// =============================
    List<Map<String, dynamic>> Cat = await sqlhellper
        .readData('select  *  from  Cat  where   Category= ?  ', [Product]);

    String Categoryx = Cat[0]['Category'];
    String price = Cat[0]['price'];
// =============================

    List<Map<String, dynamic>> check = await sqlhellper
        .readData('select  *  from  seat where    `seatx`  =  ?  ', [seat]);

    if (seat_data.isEmpty) {
      if (check.isEmpty) {
        print('Test point 1 ::=> ${generateRandomString(10)}');
        int ins = await sqlhellper.addData(
            Seat(
                Seatx: seat,
                Varieties: Product,
                Quantity: "1",
                amount: "0",
                price: price,
                check: generateRandomString(10),
                computer: "0",
                reservation: seat),
            "seat");

        if (ins != -1) {
          showNotification(context, title: "", message: "تمت الأضافة");
        } else {
          print(2);
        }
      } else {
        String Check_ = check[0]['check'];

        int ins = await sqlhellper.addData(
            Seat(
                Seatx: seat,
                Varieties: Product,
                Quantity: "1",
                amount: "0",
                price: price,
                check: Check_,
                computer: "0",
                reservation: seat),
            "seat");

        if (ins != -1) {
          showNotification(context, title: "", message: "تمت الأضافة");
        } else {
          print(2);
        }
      }
    } else {
      int quantity =
          int.parse(seat_data[0]['Quantity']); // تحويل النص إلى عدد صحيح
      quantity = quantity + 1; // إجراء العملية الحسابية
      String updatedQuantity = quantity.toString();
      int totel = quantity * int.parse(price);

      String sql =
          "UPDATE seat  SET `Quantity`=?, `price`=? , `computer`=?  WHERE `seatx`=? and `Varieties`=?";
      int up = await sqlhellper
          .updateData(sql, [updatedQuantity, totel, '0', seat, Product]);

      if (up > 0) {
        showNotification(context,
            title: "",
            message: "تمت اضافة $Product الي $seat العدد $updatedQuantity ");
      } else {
        print('لم يتم العثور على صفوف للتحديث');
      }
    }
  }
}
