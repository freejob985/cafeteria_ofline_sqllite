import 'package:cafeteria_ofline/Models/seat.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';

class ReservationProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];
  List<Map<String, dynamic>> data_SQL = [];

  List<Map<String, dynamic>> get data_ => data;
  String sum = "0";
  Future<List<Map<String, dynamic>>> fetchData() async {
    print('Test point 1 ::=> fetchData');
    String? seat = await SessionManager.getSession('seat');

    final sql =
        "SELECT   *  FROM seat where seatx = ? and Varieties IS NOT 'BOOK' ";

    List<Map<String, dynamic>> fetchedData =
        await sqlhellper.readData(sql, [seat]);
    data = fetchedData;
    item_sum();
    notifyListeners();
    return data;
  }

  void item_sum() async {
    String? seat = await SessionManager.getSession('seat');

    List<Map<String, dynamic>> fetchedData = await sqlhellper
        .readData("select sum(price) from seat  where seatx  =  ? ", [seat]);
    sum = fetchedData[0]['sum(price)'].toString();
    notifyListeners();
  }

  Future<void> computer(int id, String computer) async {
    String sql = "UPDATE seat  SET `computer`=?  WHERE `id`=? ";
    print(computer.contains("1"));
    if (computer.contains("0")) {
      int up = await sqlhellper.updateData(sql, ["1", id]);
      // print('Test point 1 ::=> $up');
      fetchData();
      notifyListeners();
    } else {
      int up = await sqlhellper.updateData(sql, ["0", id]);
      fetchData();
      notifyListeners();
    }
  }

  Future<void> addres(
      String Product, seat, BuildContext context, bool add) async {
    List<Map<String, dynamic>> seat_data = await sqlhellper.readData(
        'select  *  from  seat  where  seatx = ?  and  Varieties= ?  ',
        [seat, Product]);

// =============================
    List<Map<String, dynamic>> Cat = await sqlhellper
        .readData('select  *  from  Cat  where   Category= ?  ', [Product]);

    String Categoryx = Cat[0]['Category'];
    String price = Cat[0]['price'];
// =============================

    if (add) {
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
        fetchData();
        notifyListeners();
        showNotification(context,
            title: "",
            message: "تمت اضافة $Product الي $seat العدد $updatedQuantity ");
      }
    } else {
      int quantity =
          int.parse(seat_data[0]['Quantity']); // تحويل النص إلى عدد صحيح
      quantity = quantity - 1; // إجراء العملية الحسابية
      String updatedQuantity = quantity.toString();
      int totel = quantity * int.parse(price);

      String sql =
          "UPDATE seat  SET `Quantity`=?, `price`=? , `computer`=?  WHERE `seatx`=? and `Varieties`=?";
      int up = await sqlhellper
          .updateData(sql, [updatedQuantity, totel, '0', seat, Product]);

      if (up > 0) {
        fetchData();
        notifyListeners();
        showNotification(context,
            title: "",
            message: "تمت اضافة $Product الي $seat العدد $updatedQuantity ");
      }
    }
  }

  Future<List<Map<String, dynamic>>?> new_computer() async {
    final sql =
        "SELECT   *  FROM seat where Varieties IS NOT 'BOOK' and seatx IS NOT 'Done'  ORDER BY  `computer` ASC ";
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(sql);
    data_SQL = fetchedData;

    notifyListeners();
    return data_SQL;
  }

  Future<List<Map<String, dynamic>>> Accounts_() async {
    final sql =
        "SELECT SUM(`price`) AS `Rows`, * FROM `seat` GROUP BY `check` ORDER BY `check`";
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(sql);
    print('Test point fetchedData ::=> $fetchedData');
    data = fetchedData;
    notifyListeners();
    return data;
  }

  Future<void> seatx_done(BuildContext context) async {
    String? seat = await SessionManager.getSession('seat');
    String sql = "UPDATE `seat` SET `seatx`=?  WHERE `seatx`=?";
    int up = await sqlhellper.updateData(sql, ["Done", seat]);
    if (up > 0) {
      // notifyListeners();
      Navigator.pushNamed(context, "Home");

      showNotification(context, title: "", message: "تم تقفيل المقعد");
    }
  }

  Future<void> computer_(int id, String computer) async {
    String sql = "UPDATE seat  SET `computer`=?  WHERE `id`=? ";
    print(computer.contains("1"));
    if (computer.contains("0")) {
      int up = await sqlhellper.updateData(sql, ["1", id]);
      // print('Test point 1 ::=> $up');
      new_computer();
      notifyListeners();
    } else {
      int up = await sqlhellper.updateData(sql, ["0", id]);
      new_computer();
      notifyListeners();
    }
  }
}
