import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<Map<String, dynamic>> dummyData = [
    {
      'color': const Color.fromARGB(255, 243, 33, 149),
      'text': 'حذف البيانات',
      'icon': Icons.restore_from_trash,
    },
    {
      'color': Colors.green,
      'text': 'اضافة اصناف',
      'icon': Icons.wifi,
    },
    // ... add more items here if needed
  ];

  late SeatProvider _seatProvider;

  @override
  void initState() {
    super.initState();
    _seatProvider = SeatProvider(); // Initialize your provider
// Fetch data from the provider
  }
 void dispose() {
    _seatProvider.dispose();
//  _ConsumptionsProvider.dispose(); // 
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pr,
          title: Text(
            'الإعدادات',
            style: TextStyle_(fontSize: 20, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dummyData.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (index == 0) {
                  _seatProvider.alldata();
                  showNotification(context,
                      title: "", message: "تم حذف جميع البيانات");
// Fetch data when index 1 is tapped
                } else if (index == 1) {
                  _seatProvider.allcat();
                  showNotification(context,
                      title: "", message: " تم اضافة جميع الأصناف  ");
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: dummyData[index]['color'],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        dummyData[index]['icon'],
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        dummyData[index]['text'],
                        style: TextStyle_(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
