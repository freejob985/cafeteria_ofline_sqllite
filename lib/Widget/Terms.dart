import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class Terms extends StatefulWidget {
  const Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  List<Map<String, dynamic>> itemList = [];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إضافة البنود'),
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
                  labelText: 'بند',
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
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue, // Blue background color for the Card
                      child: Column(
                        children: <Widget>[
                          ListTile(
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
                          ),
                        ],
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
                  Text("0"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
