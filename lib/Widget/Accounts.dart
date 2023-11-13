import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/ReservationProvider.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class Accounts extends StatefulWidget {
  const Accounts({Key? key}) : super(key: key);

  @override
  _AccountsState createState() => _AccountsState();
}

class _AccountsState extends State<Accounts> {
  late ReservationProvider _ReservationProvider;
  void initState() {
    super.initState();
    _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: false);
    print('Test point 1 ::=> $_ReservationProvider');
    _ReservationProvider.Accounts_();
  }



  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
     
        drawer: MyDrawer(),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Consumer<ReservationProvider>(
                builder: (context, myType, child) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: myType.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = myType.data[index];
                        // String Rows = item['Rows'];
                        // String check = item['check'];
                        String reservation = item['reservation'].toString();
                        String check = item['check'].toString();
                        String seatx = item['seatx'].toString();

                        String Rows = item['Rows'].toString();
                        return Align(
                          alignment: Alignment.centerRight,
                          child: Card(
                            color: Color.fromARGB(255, 54, 11, 110),
                            child: GestureDetector(
                              onTap: () {
// I/flutter ( 2669): Test point fetchedData ::=> [{Rows: 115, check: check:5592162143, reservation: 2}]
                                Navigator.pushNamed(context, "Home");
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.all(8.0),
                                leading: Icon(Icons.attach_money,
                                    color: Colors.white),
                                title: seatx.contains('Done')? Text(
                                  "مقعد : $reservation",
                                  style: TextStyle_(
                                      fontSize: 20, color: Colors.white,
decoration: TextDecoration.lineThrough),

                                ):Text(
                                  "مقعد : $reservation",
                                  style: TextStyle_(
                                      fontSize: 20, color: Colors.white,
),

                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Text(
                                      "شيك : $check",
                                      style: TextStyle_(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color: const Color.fromARGB(255, 252, 252,
                                          252), // يمكنك تغيير اللون هنا
                                    ),
                                    Text(
                                      "أجمالي: $Rows",
                                      style: TextStyle_(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  SessionManager.setSession(
                                      'seat', reservation);

                                  Navigator.pushNamed(context, "Bench");

                                  // أي تفاعل إضافي هنا
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
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
class SecondTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('الصفحة الثانية'),
    );
  }
}
