import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الاعدادت'),
        ),
        drawer: MyDrawer(),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  if (index.isEven) {
                    // Even index icon tapped (Settings)
                    print('Settings Icon Tapped');
                  } else {
                    // Odd index icon tapped (WiFi)
                    print('WiFi Icon Tapped');
                  }
                },
                child: Container(
                  color: index.isEven ? Colors.blue : Colors.green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        index.isEven ? Icons.settings : Icons.wifi,
                        size: 40,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        index.isEven ? 'Settings' : 'WiFi',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
