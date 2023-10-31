import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class NewRegistration extends StatefulWidget {
  const NewRegistration({Key? key}) : super(key: key);

  @override
  _NewRegistrationState createState() => _NewRegistrationState();
}

class _NewRegistrationState extends State<NewRegistration> {
  List<Map<String, dynamic>> registrationData = [
    {
      "الصنف": "سلعة 1",
      "الكمية": 5,
      "السعر": 20.0,
      "المقعد": "A1",
    },
    {
      "الصنف": "سلعة 2",
      "الكمية": 3,
      "السعر": 30.0,
      "المقعد": "B5",
    },
    // Add more sample data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل جديد'),
        ),
        drawer: MyDrawer(),
        body: ListView.builder(
          itemCount: registrationData.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("الصنف: ${registrationData[index]["الصنف"]}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("الكمية: ${registrationData[index]["الكمية"]}"),
                    Text("السعر: ${registrationData[index]["السعر"]}"),
                    Text("المقعد: ${registrationData[index]["المقعد"]}"),
                    ElevatedButton(
                        onPressed: () {
                          // Handle button press for each list item
                        },
                        child: Text(
                          'كمبيوتر',
                          style: TextStyle(fontSize: 10),
                        ),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                              Size(100, 20)), // يمكنك ضبط الأبعاد هنا
                        ))
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Handle button press for each list item
                  },
                  child: Text('كمبيوتر'),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
