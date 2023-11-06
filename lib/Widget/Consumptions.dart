import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/ConsumptionsProvider.dart';
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إضافة الاستهلاكات'),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _itemController,
                decoration: InputDecoration(
                  labelText: 'البند',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _priceController,
                decoration: InputDecoration(
                  labelText: 'السعر',
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String item = _itemController.text;
                  final String price = _priceController.text;
                  _ConsumptionsProvider.item_new(item, price, context);
                  _itemController.clear();
                  _priceController.clear();
                },
                child: Text('إضافة'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Consumer<ConsumptionsProvider>(
                  builder: (context, itemList, child) {
                    return GestureDetector(
                      child: Card(
                        color: Colors.blue,
                        child: ListView.builder(
                          itemCount: itemList.data.length,
                          itemBuilder: (context, index) {
                            final item = itemList.data[index];
                            return Container(
                              color: const Color.fromARGB(255, 112, 191, 255),
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
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  trailing: Text(
                                    item["price"],
                                    style: TextStyle(color: Colors.white),
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
                        color: Colors.blue,
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
