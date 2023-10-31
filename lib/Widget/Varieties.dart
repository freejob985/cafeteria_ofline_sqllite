import 'package:flutter/material.dart';

class Varieties extends StatefulWidget {
  const Varieties({Key? key}) : super(key: key);

  @override
  _VarietiesState createState() => _VarietiesState();
}

class _VarietiesState extends State<Varieties> {
  List<Map<String, dynamic>> items = [
    {'name': 'منتج 1', 'icon': Icons.fastfood},
    {'name': 'منتج 2', 'icon': Icons.shopping_bag},
    {'name': 'منتج 3', 'icon': Icons.local_cafe},
    // يمكنك إضافة بيانات إضافية هنا
  ];

  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> filteredItems = [];

  @override
  void initState() {
    filteredItems = items;
    super.initState();
  }

  void filterSearch(String query) {
    List<Map<String, dynamic>> searchList = [];
    searchList.addAll(items);

    if (query.isNotEmpty) {
      List<Map<String, dynamic>> filteredList = [];
      searchList.forEach((item) {
        if (item['name']
            .toString()
            .toLowerCase()
            .contains(query.toLowerCase())) {
          filteredList.add(item);
        }
      });
      setState(() {
        filteredItems = filteredList;
      });
      return;
    } else {
      setState(() {
        filteredItems = items;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.blue, width: 0.0), // لون الحد وسمكه
                ),
              ),
              onChanged: (value) {
                filterSearch(value);
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
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 1,
                  child: ListTile(
                    title: Column(
                      children: <Widget>[
                        Icon(filteredItems[index]['icon'] as IconData),
                        Text(
                          filteredItems[index]['name'].toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                    onTap: () {
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
                    // Add functionality for the first button
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the second button
                  },
                  icon: Icon(Icons.remove),
                  label: Text('Remove'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the third button
                  },
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add functionality for the fourth button
                  },
                  icon: Icon(Icons.search),
                  label: Text('Search'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
