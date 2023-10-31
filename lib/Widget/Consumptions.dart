import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class Consumptions extends StatefulWidget {
  const Consumptions({Key? key}) : super(key: key);

  @override
  _ConsumptionsState createState() => _ConsumptionsState();
}

class _ConsumptionsState extends State<Consumptions> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> itemList = [];

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
                  setState(() {
                    final String item = _itemController.text;
                    final double price =
                        double.tryParse(_priceController.text) ?? 0.0;

                    itemList.add({
                      "item": item,
                      "price": price,
                      "icon": Icons.attach_money,
                    });

                    _itemController.clear();
                    _priceController.clear();
                  });
                },
                child: Text('إضافة'),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Card(
                  color: Colors.blue, // Blue background color for the Card
                  child: ListView.builder(
                    itemCount: itemList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: const Color.fromARGB(255, 112, 191, 255),
                        child: ListTile(
                          leading: Icon(
                            itemList[index]["icon"],
                            color: Colors.white, // White color for the icon
                          ),
                          title: Text(
                            itemList[index]["item"],
                            style: TextStyle(
                                color:
                                    Colors.white), // White color for the text
                          ),
                          subtitle: Text(
                            'السعر: ${itemList[index]["price"]}',
                            style: TextStyle(
                                color:
                                    Colors.white), // White color for the text
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
