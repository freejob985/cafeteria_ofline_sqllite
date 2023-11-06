import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/WorkersProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class Workers extends StatefulWidget {
  const Workers({Key? key}) : super(key: key);

  @override
  _WorkersState createState() => _WorkersState();
}

class _WorkersState extends State<Workers> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> itemList = [];

  Sqlhellper sqlhellper = Sqlhellper();
  late WorkersProvider _WorkersProvider;
  void initState() {
    super.initState();
    _WorkersProvider =
        provider.Provider.of<WorkersProvider>(context, listen: false);
    _WorkersProvider.item_sum();
    _WorkersProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pr,
          title: Text(
            'إضافة عمال',
            style: TextStyle_(fontSize: 20, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: Consumer<WorkersProvider>(
          builder: (context, itemList, child) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Field(_itemController, "العامل", "يومية عامل"),

                  // TextField(
                  //   controller: _itemController,
                  //   decoration: InputDecoration(
                  //     labelText: 'العامل',
                  //   ),
                  // ),
                  const SizedBox(height: 20),
                  Field(_priceController, "السعر", " السعر",
                      keyboardType: TextInputType.number),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(pr),
// تغيير لون الخلفية
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // تغيير لون الخلفية
                    ),
                    onPressed: () {
                      final String item = _itemController.text;
                      final String price = _priceController.text;
                      _WorkersProvider.item_new(item, price, context);
                      _itemController.clear();
                      _priceController.clear();
                    },
                    child: Text(
                      'إضافة',
                      style: TextStyle_(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: itemList.data.length,
                      itemBuilder: (context, index) {
                        final item = itemList.data[index];
                        return GestureDetector(
                          onTap: () {
                            _WorkersProvider.showAlertDialog(
                                context, item['id']);
                          },
                          child: Card(
                            color: Colors
                                .blue, // Blue background color for the Card
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  leading: Icon(
                                    Icons.attach_money,
                                    color: Colors
                                        .white, // White color for the icon
                                  ),
                                  title: Text(
                                    item['name'],
                                    style: TextStyle_(
                                        fontSize: 15,
                                        color: Colors
                                            .white), // White color for the text
                                  ),
                                  trailing: Text(
                                    item["price"],
                                    style: TextStyle_(
                                        fontSize: 15, color: Colors.white),
                                    // White color for the text
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
                      Text(itemList.sum ?? "0"),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
