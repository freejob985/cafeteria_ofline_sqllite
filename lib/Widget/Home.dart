import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Models/Cat.dart';
import 'package:cafeteria_ofline/hellper/sqlhellper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double font = 10;
  Sqlhellper sqlhellper = Sqlhellper();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'حجز',
            style: TextStyle_(fontSize: 15, color: Colors.white),
          ),
        ),
        drawer: MyDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.4,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "Bench");
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.book),
                              const SizedBox(height: 8),
                              Text(
                                'حجز ${index + 1}',
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
                  onPressed: () async {},
                  icon:
                      Icon(Icons.add), // يمكن تغيير الرمز إلى الأيقونة المطلوبة
                  label: Text('حجز جديد', style: TextStyle_(fontSize: 15)),
                ),
              ),
            ],
          ),
        ),
      ),
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
