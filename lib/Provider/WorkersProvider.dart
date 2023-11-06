import 'package:cafeteria_ofline/Models/Worker.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';

class WorkersProvider with ChangeNotifier {
  Sqlhellper sqlhellper = Sqlhellper();
  List<Map<String, dynamic>> data = [];

  // List<Map<String, dynamic>> get data_ => data;
  String sum = "0";
  Future<List<Map<String, dynamic>>> fetchData() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "SELECT *  FROM Worker ",
    );
    data = fetchedData;
    notifyListeners();
    return data;
  }

  Future<int?> item_new(String name, String price, BuildContext context) async {
    int ins =
        await sqlhellper.addData(Worker(name: name, price: price), "Worker");
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
        return AlertDialog(
          title: Text("تأكيد الإجراء"),
          content: Text("هل أنت متأكد من رغبتك في القيام بهذا الإجراء؟"),
          actions: <Widget>[
            TextButton(
              child: Text("نعم"),
              onPressed: () async {
                int rowsAffected = await sqlhellper.removeEntry("Worker", id);
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
              child: Text("لا"),
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
        );
      },
    );
  }

  void item_sum() async {
    List<Map<String, dynamic>> fetchedData = await sqlhellper.readData(
      "select sum(price) from Worker",
    );
    sum = fetchedData[0]['sum(price)'].toString();
    notifyListeners();
  }
}
