import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  List<Map<String, dynamic>> checkData = [
    {
      "name": "شيك 1",
      "seat": "مقعد 1",
      "total": 150.0,
      "icon": Icons.attach_money,
      "color": Colors.blue,
    },
    {
      "name": "شيك 2",
      "seat": "مقعد 2",
      "total": 200.0,
      "icon": Icons.attach_money,
      "color": Colors.green,
    },
    // ... إضافة المزيد من البيانات حسب الحاجة
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الحسابات'),
        ),
        drawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: checkData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment: Alignment.centerRight,
                      child: Card(
                        color: checkData[index]["color"],
                        child: ListTile(
                          contentPadding: EdgeInsets.all(8.0),
                          leading: Icon(checkData[index]["icon"]),
                          title: Text(
                            checkData[index]["name"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'المقعد: ${checkData[index]["seat"]}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                'الإجمالي: ${checkData[index]["total"]}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            // أي تفاعل إضافي هنا
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(Icons.add, "إضافة", Colors.orange),
                  CustomButton(Icons.delete, "حذف", Colors.red),
                  CustomButton(Icons.edit, "تعديل", Colors.blue),
                  CustomButton(Icons.search, "بحث", Colors.green),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const CustomButton(this.icon, this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // إضافة أي فعالية للأزرار هنا
      },
      icon: Icon(icon),
      label: Column(
        children: [
          Text(label),
          Text(label),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: color,
      ),
    );
  }
}
