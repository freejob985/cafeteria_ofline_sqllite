import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria_ofline/Widget/Varieties.dart';
import 'package:cafeteria_ofline/Widget/reservation.dart';

class Bench extends StatefulWidget {
  const Bench({Key? key}) : super(key: key);

  @override
  _BenchState createState() => _BenchState();
}

class _BenchState extends State<Bench> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      print("تم تغيير التبويب إلى: ${_tabController.index}");
      // يمكنك إضافة الإجراءات التي تريدها عند تغيير التبويب هنا
    }
  }

  @override
  void dispose() {
    _tabController.dispose(); // يجب التخلص من الـ TabController عند الانتهاء
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: pr,
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Home");
                },
                child: Text('الرئسية',
                    style: TextStyle(fontFamily: 'Al-Jazeera', fontSize: 15)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(pr), // تغيير لون الخلفية
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // تغيير لون النص
                )

),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "Accounts");
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(pr), // تغيير لون الخلفية
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // تغيير لون النص
              ),
              child: Text('الحسابات',
                  style: TextStyle(fontFamily: 'Al-Jazeera', fontSize: 15)),
            )
          ],
          title: Text(
            'تطبيق التابات',
            style: TextStyle_(fontSize: 15, color: Colors.white),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                child: Text("الأصناف",
                    style: TextStyle_(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
              Tab(
                child: Text("الحجز",
                    style: TextStyle_(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 255, 255, 255))),
              ),
            ],
          ),
        ),
        drawer: MyDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            // محتوى التاب الأول (Reservation)
            Varieties(), // محتوى التاب الثاني (Varieties)
            Reservation(),
          ],
        ),
      ),
    );
  }
}
