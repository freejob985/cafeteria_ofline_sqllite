import 'package:flutter/material.dart';

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
          Container(
            padding: EdgeInsets.all(16),
            child: Container(
              padding: EdgeInsets.all(16),
              color: Colors.green, // لون الخلفية الخاصة بالمال
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'المجموع: ${1} جنيه',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Icon(
                    Icons.attach_money, // الأيقونة المرتبطة بالمال
                    color: Colors.white,
                  ),
                ],
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[200],
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.items[index]['name'],
                    style: TextStyle(color: Colors.black),
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
                      Text(
                        widget.items[index]['price'].toString(),
                        style: TextStyle(color: Colors.black),
                      ),
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
                      setState(() {
                        if (widget.items[index]['quantity'] > 0) {
                          widget.items[index]['quantity']--;
                        }
                      });
                    },
                  ),
                  Text(
                    '${widget.items[index]['quantity']}',
                    style: TextStyle(color: Colors.black),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        widget.items[index]['quantity']++;
                      });
                    },
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => print(1),
                        child: Container(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('COMPUTER'),
                              IconButton(
                                icon: Icon(Icons.computer),
                                onPressed: () {
                                  // Add functionality for the computer button
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
