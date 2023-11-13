import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/itemProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> itemList = [];

  Sqlhellper sqlhellper = Sqlhellper();
  late ItemProvider _ItemProvider;
  void initState() {
    super.initState();
    _ItemProvider = provider.Provider.of<ItemProvider>(context, listen: false);
    _ItemProvider.item_sum();
    _ItemProvider.fetchData();
  }

  void dispose() {
    // تحرير الموارد عند إغلاق الواجهة
    _ItemProvider.dispose();
_itemController.dispose();
_priceController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
   actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Home");
                },
                child: Text(
                  'الرئسية',
                  style: TextStyle_(fontSize: 15, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(pr), // تغيير لون الخلفية
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // تغيير لون النص
                )),
          ],
          backgroundColor: pr,
          title: Text(
            'إضافة البنود',
            style: TextStyle_(fontSize: 15, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Field(_itemController, "بند", "اضافة بند جديد"),
              const SizedBox(height: 20),
              Field(_priceController, "السعر", "ادخال السعر",
                  keyboardType: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String item = _itemController.text;
                  final String price = _priceController.text;
                  _ItemProvider.item_new(item, price, context);
                  _itemController.clear();
                  _priceController.clear();
                },
                child: Text(
                  'إضافة',
                  style: TextStyle_(fontSize: 13, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(pr),
// تغيير لون الخلفية
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // تغيير لون الخلفية
                ),
              ),
              const SizedBox(height: 20),
              Consumer<ItemProvider>(
                builder: (context, itemList, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: itemList.data.length,
                      itemBuilder: (context, index) {
                        final item = itemList.data[index];
                        return GestureDetector(
                          onTap: () {
                            _ItemProvider.showAlertDialog(context, item['id']);
                          },
                          child: Card(
                            color: pr, // Blue background color for the Card
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.attach_money,
                                    color: Colors
                                        .white, // White color for the icon
                                  ),
                                  title: Text(
                                    item["item"],
                                    style: TextStyle_(
                                        fontSize: 15, color: Colors.white),
                                    // White color for the text
                                  ),
                                  trailing: Text(
                                    item["price"],
                                    style: TextStyle_(
                                        fontSize: 10, color: Colors.white),
                                    // White color for the text
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.attach_money,
                      color: Color.fromARGB(255, 61, 5, 150),
                    ),
                    onPressed: () {},
                  ),
                  Consumer<ItemProvider>(
                    builder: (context, myType, child) {
                      if (myType.sum == "") {
                        return Text("0");
                      } else {
                        return Text(myType.sum);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
