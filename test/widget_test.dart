import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // قائمة بالصفحات المختلفة التي سيتم التبديل بينها
  final List<Widget> _children = [
    FirstTab(),
    SecondTab(),
    ThirdTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Tab Bar Example'),
      ),
      body: _children[_currentIndex], // عرض المحتوى الخاص بالتبويب الحالي
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped, // دالة يتم استدعاؤها عند النقر على التبويب
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'الثاني',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'الثالث',
          ),
        ],
      ),
    );
  }

  // دالة لتبديل التبويب عند النقر على أحدها
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class FirstTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('الصفحة الأولى'),
    );
  }
}

class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('الصفحة الثانية'),
    );
  }
}

class ThirdTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('الصفحة الثالثة'),
    );
  }
}

