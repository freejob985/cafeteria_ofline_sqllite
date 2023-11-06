import 'package:cafeteria_ofline/Provider/BenchProvider.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class Varieties extends StatefulWidget {
  const Varieties({Key? key}) : super(key: key);

  @override
  _VarietiesState createState() => _VarietiesState();
}

class _VarietiesState extends State<Varieties> {
  Sqlhellper sqlhellper = Sqlhellper();
  late BenchProvider _BenchProvider;
  void initState() {
    super.initState();
    _BenchProvider =
        provider.Provider.of<BenchProvider>(context, listen: false);
    _BenchProvider.fetchData();
  }

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredItems = [];

  @override
  // void initState() {
  //   filteredItems = items;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final databaseProvider = provider.Provider.of<BenchProvider>(context);

    return Scaffold(body: Consumer<BenchProvider>(
      builder: (context, myType, child) {
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: 'بحث',
                  hintText: 'بحث الأصناف...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Colors.blue, // Color of the border
                      width: 0.0, // Width of the border
                    ),
                  ),
                ),
                onChanged: (value) {
                  // Add the functionality you need for onChanged event
                  _BenchProvider.serche(value);
                  // filterSearch(value);
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 3.0,
                  mainAxisSpacing: 3.0,
                ),
                itemCount: myType.data.length,
                itemBuilder: (context, index) {
                  final item = myType.data[index];

                  return Card(
                    elevation: 1,
                    child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.shopping_bag),
                          Text(
                            item['Category'],
                            style: TextStyle_(fontSize: 12),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Functionality for the price button
                            },
                            child: Text(
                              item['price'],
                              style:
                                  TextStyle_(fontSize: 11, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green, // Change color as needed
                              minimumSize: Size(15, 15), // Set button size
                            ),
                          ),
                        ],
                      ),
                      onTap: () async {
                        String? seat = await SessionManager.getSession('seat');
                        print('Test point 1 ::=> $seat');
                        _BenchProvider.addres(item['Category'], seat, context);
                        // Add functionality when the item is tapped
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton.icon(
                    onPressed: () {
                      _BenchProvider.sec("أساسي");
                    },
                    icon: Icon(Icons.add),
                    label: Text(
                      'أساسي',
                      style: TextStyle_(fontSize: 11, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _BenchProvider.sec(
                        "ساقع",
                      );
                      // Add functionality for the second button
                    },
                    icon: Icon(Icons.remove),
                    label: Text(
                      'ساقع',
                      style: TextStyle_(fontSize: 11, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _BenchProvider.sec("سخن");
                      // Add functionality for the third button
                    },
                    icon: Icon(Icons.edit),
                    label: Text(
                      'سخن',
                      style: TextStyle_(fontSize: 11, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      _BenchProvider.sec("عصائر");
                      // Add functionality for the fourth button
                    },
                    icon: Icon(Icons.search),
                    label: Text(
                      'عصائر',
                      style: TextStyle_(fontSize: 11, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ));
  }

  TextStyle TextStyle_(
      {int fontSize = 10,
      Color color = const Color.fromARGB(255, 70, 69, 69)}) {
    return TextStyle(
      fontSize: fontSize.toDouble(),
      fontFamily: 'Al-Jazeera',
      fontWeight: FontWeight.normal,
      color: color,
    );
  }
}
