import 'package:cafeteria_ofline/hellper/SessionManager.dart';
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
    print(data);
    notifyListeners();
    return data;
  }

  Future<List<Map<String, dynamic>>> sec(String key) async {
    // List<Map<String, dynamic>> fetchedData = await sqlhellper
    //     .searchWithMultipleConditions("Cat", "id", ['Category'], [key]);
    List<Map<String, dynamic>> fetchedData = await sqlhellper
        .readData('select * from Cat where  ty like ?  ', ['%$key%']);
    data = fetchedData;
    print(data);
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
}
