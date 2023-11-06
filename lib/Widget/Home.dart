import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Models/Cat.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double font = 10;
  Sqlhellper sqlhellper = Sqlhellper();
  late SeatProvider _seatProvider; // تعريف الـ Provider
  void initState() {
    super.initState();
    _seatProvider = Provider.of<SeatProvider>(context, listen: false);
    _seatProvider.fetchData(); // جلب البيانات من الـ Provider
  }

  @override
  Widget build(BuildContext context) {
    final databaseProvider = Provider.of<SeatProvider>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: pr,
              title: Text(
                'حجز',
                style: TextStyle_(fontSize: 15, color: Colors.white),
              ),
              actions: <Widget>[
                IconButton(
                    onPressed: () async {
                      var x = await databaseProvider.fetchData();
                      print("$x");
                    },
                    icon: Icon(Icons.abc_sharp)),
                IconButton(
                  icon: Icon(
                      Icons.add), // يمكن استبدال Icon بالأيقونة التي تفضلها
                  onPressed: () {
                    // سلسلة لتخزين اسم الحجز الجديد

                    addbook(context, databaseProvider);
                  },
                ),
              ]),
          drawer: MyDrawer(),
          body: Consumer<SeatProvider>(
            builder: (context, itemProvider, child) {
              if (itemProvider.data.isEmpty) {
                return Center();
              } else {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width * 0.4,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                          ),
                          itemCount: itemProvider.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            final item = itemProvider.data[index];
                            // print(item);
                            return GridTile(
                              child: Card(
                                child: InkWell(
                                  onTap: () {
                                    SessionManager.setSession(
                                        'seat', item['seatx']);

                                    Navigator.pushNamed(context, "Bench");
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.book),
                                      const SizedBox(height: 8),
                                      Text(
                                        item['seatx'].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle_(fontSize: 13),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        color: Colors.grey[300],
                        child: TextButton.icon(
                          onPressed: () async {
                            addbook(context, databaseProvider);
                          },
                          icon: Icon(Icons
                              .add), // يمكن تغيير الرمز إلى الأيقونة المطلوبة
                          label:
                              Text('حجز جديد', style: TextStyle_(fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          )),
    );
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
