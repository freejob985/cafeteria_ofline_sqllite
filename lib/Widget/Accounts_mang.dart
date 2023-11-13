import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Widget/Accounts.dart';
import 'package:cafeteria_ofline/Widget/details.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';

class AccountsMang extends StatefulWidget {
  const AccountsMang({Key? key}) : super(key: key);

  @override
  _AccountsMangState createState() => _AccountsMangState();
}

class _AccountsMangState extends State<AccountsMang> {
  int _currentIndex = 0;

  // قائمة بالصفحات المختلفة التي سيتم التبديل بينها
  final List<Widget> _children = [
    Accounts(),
    Details(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
                child: Text(
                  'الرئسية',
                  style: TextStyle_(fontSize: 15, color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(pr), // تغيير لون الخلفية
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Colors.white), // تغيير لون النص
                )),
          ],
          title: const Text(''),
        ),
        drawer: MyDrawer(),
        body: Directionality(
            textDirection: TextDirection.rtl, child: _children[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped, // دالة يتم استدعاؤها عند النقر على التبويب
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 40,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_add_sharp,
                size: 40,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
