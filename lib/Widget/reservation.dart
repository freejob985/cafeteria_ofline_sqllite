import 'package:cafeteria_ofline/Provider/ReservationProvider.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';
import 'package:provider/provider.dart' as provider;

class Reservation extends StatefulWidget {
  const Reservation({Key? key}) : super(key: key);

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  List<Map<String, dynamic>> items = [
    {'name': 'منتج 1', 'quantity': 2, 'price': 50},
    {'name': 'منتج 2', 'quantity': 1, 'price': 30},
    // Add more items as needed
  ];

  Sqlhellper sqlhellper = Sqlhellper();
  late ReservationProvider _ReservationProvider;
  void initState() {
    super.initState();
    _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: false);
    _ReservationProvider.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MyCustomListView(
              items: items,
            ),
          ),
          GestureDetector(
            onTap: () {
              _ReservationProvider.seatx_done(context);
              print('Test point 1 ::=> 1');
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Container(
                padding: EdgeInsets.all(16),
                color: Colors.green, // لون الخلفية الخاصة بالمال
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Consumer<ReservationProvider>(
                      builder: (context, myType, child) {
                        return Text(
                          'المجموع: ${myType.sum} جنيه',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Al-Jazeera',
                          ),
                        );
                      },
                    ),
                    Icon(
                      Icons.attach_money, // الأيقونة المرتبطة بالمال
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomListView extends StatefulWidget {
  final List<Map<String, dynamic>> items;

  const MyCustomListView({Key? key, required this.items}) : super(key: key);

  @override
  _MyCustomListViewState createState() => _MyCustomListViewState();
}

class _MyCustomListViewState extends State<MyCustomListView> {
  @override
  Widget build(BuildContext context) {
    var _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: true);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<ReservationProvider>(
          builder: (context, myType, child) {
            return ListView.builder(
              itemCount: myType.data.length,
              itemBuilder: (context, index) {
                final item = myType.data[index];
                int id = item['id'];
                String seatx = item['seatx'];
                String Varieties = item['Varieties'];
                String Quantity = item['Quantity'];
                String price = item['price'];
                String computer = item['computer'];
                String check = item['check'];

                return Card(
                  color: computer.contains("0")
                      ? Colors.grey[200]
                      : const Color.fromARGB(255, 234, 228, 179),
                  child: ListTile(
                    onTap: () {
                      _ReservationProvider.computer(id, computer);
                    },
                    leading: Icon(Icons.shopping_cart),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            computer.contains("0")
                                ? Expanded(
                                    flex: 2,
                                    child: Text(
                                      Varieties,
                                      style: TextStyle_(fontSize: 18),
                                    ),
                                  )
                                : Expanded(
                                    flex: 2,
                                    child: Text(
                                      Varieties,
                                      style: TextStyle_(
                                          fontSize: 18,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                  ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        // Handle button press for each list item
                                      },
                                      child: Center(
                                        child: Text(
                                          check,
                                          style: TextStyle(fontSize: 9),
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .all<Color>(Color.fromARGB(
                                                255,
                                                59,
                                                14,
                                                143)), // يمكن استبدال "Colors.blue" باللون الذي تفضله

                                        minimumSize: MaterialStateProperty.all(
                                            Size(40,
                                                30)), // يمكنك ضبط الأبعاد هنا
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        VerticalDivider(
                          thickness: 1, // سمك الخط العمودي
                          color: Colors.black, // لون الخط العمودي
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money, color: Colors.black),
                            Text(price, style: TextStyle_(fontSize: 15)),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            _ReservationProvider.addres(
                                Varieties, seatx, context, false);
                          },
                        ),
                        Text(
                          Quantity,
                          style: TextStyle_(fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            _ReservationProvider.addres(
                                Varieties, seatx, context, true);
                          },
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                print(
                                    'Test point 1 ::=> ${computer.runtimeType}');
                                // print('Test point 1 ::=> $id');
                                _ReservationProvider.computer(id, computer);
                                //   setState(() {});
                              },
                              child: Container(
                                  color: computer.contains("0")
                                      ? Color.fromARGB(255, 255, 255, 255)
                                      : Color.fromARGB(255, 83, 219, 162),
                                  width: 150,
                                  height: 45,
                                  child: computer == "0"
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('COMPUTER'),
                                            IconButton(
                                              icon: Icon(Icons.computer),
                                              onPressed: () {
                                                print(computer);
                                                // Add functionality for the computer button
                                              },
                                            ),
                                          ],
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text('Registered',
                                                style: TextStyle_(
                                                    fontSize: 15,
                                                    color: const Color.fromARGB(
                                                        255, 241, 241, 241))),
                                            IconButton(
                                              icon: Icon(
                                                Icons.done,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {
                                                // Add functionality for the computer button
                                              },
                                            ),
                                          ],
                                        )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
