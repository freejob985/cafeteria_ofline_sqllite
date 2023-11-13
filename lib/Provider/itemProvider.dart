import 'package:cafeteria_ofline/Models/item.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';

class ItemProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];
  // List<Map<String, dynamic>> get data_ => data;
  String sum = "0";
  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "SELECT *  FROM item ",
    );
    data = fetchedData;
    sum = "0";
    item_sum();
    notifyListeners();
    return data;
  }

  Future<int?> item_new(String item, String price, BuildContext context) async {
    int ins = await sqlhellper.addData(Item(item: item, price: price), "item");
    if (ins != -1) {
      fetchData();
      item_sum();
      //  print(1);
      showNotification(context, title: "", message: "تم اضافة بند جديد");
    } else {
      ///print(2);
      showNotification(context,
          title: "", message: "فشل اضافة بند جديد", success: false);
    }
  }

// Inside your function or widget where you want to trigger the AlertDialog
  showAlertDialog(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Directionality(
textDirection: TextDirection.rtl,
          child: AlertDialog(
            title: Text("تأكيد الإجراء",
style: TextStyle_(fontSize: 15),),
            content: Text("هل أنت متأكد من رغبتك في القيام بهذا الإجراء؟",
style: TextStyle_(fontSize: 15),),
            actions: <Widget>[
              TextButton(
                child: Text("نعم",
style: TextStyle_(fontSize: 15),),
                onPressed: () async {
                  int rowsAffected = await sqlhellper.removeEntry("item", id);
                  if (rowsAffected > 0) {
                    fetchData();
                    item_sum();
                    showNotification(context,
                        title: "", message: " تم الحذف ", success: false);
                  } else {
                    // print('No entry found with ID: $idToDelete.');
                  }
                  // Close the dialog
                  // Your action when 'Yes' is selected
                  // e.g., call a function, update state, etc.
                },
              ),
              TextButton(
                child: Text("لا",
style: TextStyle_(fontSize: 15),),
                onPressed: () {
                  // Perform action when 'No' is selected
                  // For example, you can do something here
                  // You can also close the dialog
                  Navigator.of(context).pop(); // Close the dialog
                  // Your action when 'No' is selected
                  // e.g., do nothing or perform a different action
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void item_sum() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "select sum(price) from item",
    );
    sum = fetchedData[0]['sum(price)'].toString() ?? "0";
    notifyListeners();
  }
}
