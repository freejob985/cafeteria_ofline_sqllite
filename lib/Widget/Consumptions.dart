import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/ConsumptionsProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Consumptions extends StatefulWidget {
  const Consumptions({Key? key}) : super(key: key);
  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<Consumptions> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  late ConsumptionsProvider _ConsumptionsProvider;

  @override
  void initState() {
    super.initState();
    _ConsumptionsProvider =
        Provider.of<ConsumptionsProvider>(context, listen: false);
    _ConsumptionsProvider.item_sum();
    _ConsumptionsProvider.fetchData();
  }
 void dispose() {
    _ConsumptionsProvider.dispose();
 _itemController.dispose(); // 
 _ConsumptionsProvider.dispose(); // 
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
            'إضافة الاستهلاكات',
            style: TextStyle_(fontSize: 20, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Field(_itemController, "البند", "بنود يومية"),
              const SizedBox(height: 20),
              Field(_priceController, "السعر", "سعر البند"),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    final String item = _itemController.text;
                    final String price = _priceController.text;
                    _ConsumptionsProvider.item_new(item, price, context);
                    _itemController.clear();
                    _priceController.clear();
                  },
                  child: Text(
                    'إضافة',
                    style: TextStyle_(fontSize: 15, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(pr),
// تغيير لون الخلفية
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // تغيير لون الخلفية
                  )),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<ConsumptionsProvider>(
                  builder: (context, itemList, child) {
                    return GestureDetector(
                      child: Card(
                        elevation: 0,
                        child: ListView.builder(
                          itemCount: itemList.data.length,
                          itemBuilder: (context, index) {
                            final item = itemList.data[index];
                            return Container(
                              color: pr,
                              child: GestureDetector(
                                onTap: () {
                                  _ConsumptionsProvider.showAlertDialog(
                                      context, item['id']);
                                },
                                child: ListTile(
                                  leading: Icon(
                                    Icons.attach_money,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    item["consumption"],
                                    style: TextStyle_(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                  trailing: Text(
                                    item["price"],
                                    style: TextStyle_(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Consumer<ConsumptionsProvider>(
                    builder: (context, myType, child) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        color: pr,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.attach_money_rounded,
                                  color: Colors.white),
                              onPressed: () {
                                // Add functionality for the button
                                // For example, you can perform some action when the button is pressed
                              },
                            ),
                            SizedBox(width: 8),
                            Text(
                              myType.sum,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
