import 'package:cafeteria_ofline/Provider/ReservationProvider.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  late ReservationProvider _ReservationProvider;
  late SeatProvider _SeatProvider;

  void initState() {
    super.initState();
    _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: false);

    _SeatProvider = provider.Provider.of<SeatProvider>(context, listen: false);
    // print('Test point 1 ::=> $_ReservationProvider');
    _ReservationProvider.Accounts_();
    _SeatProvider.fetchData();
  }

//  void dispose() {
//     _ReservationProvider.dispose();
//  _SeatProvider.dispose(); // 
// //  _ConsumptionsProvider.dispose(); // 
//     super.dispose();
//   }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<SeatProvider>(builder: (context, itemProvider, child) {
          if (itemProvider.sum1.isEmpty) {
            return Center();
          } else {
            return Column(
              children: [
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "عمال \n  ${itemProvider.sum3}  جنيه ",
                        buttonColor: Color(0xFF8AFF33),
                        icon: Icon(Icons.monitor_rounded),
                        h: 0.40,
                        func: () {
                          Navigator.pushNamed(context, "Workers");
                        }),
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "بنود \n  ${itemProvider.sum2}  جنيه ",
                        h: 0.40,
                        buttonColor: Color(0xFF33FF42),
                        icon: Icon(Icons.moving),
                        func: () {
                          Navigator.pushNamed(context, "Terms");
                        }),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "استهلاكات \n  ${itemProvider.sum4}  جنيه ",
                        h: 0.40,
                        buttonColor: Color(0xFF338AFF),
                        icon: Icon(Icons.edit_notifications_sharp),
                        func: () {
                          Navigator.pushNamed(context, "Consumptions");
                        }),
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "صافي \n  ${itemProvider.sum6}  جنيه ",
                        h: 0.40,
                        buttonColor: Color(0xFF33F0FF),
                        icon: Icon(Icons.monetization_on),
                        func: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "أجمالي \n  ${itemProvider.sum1}  جنيه ",
                        h: 0.40,
                        buttonColor: Color.fromARGB(255, 17, 101, 211),
                        icon: Icon(Icons.ac_unit_outlined),
                        func: () {}),
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "أرضية \n  ${itemProvider.sum5}  جنيه ",
                        h: 0.40,
                        buttonColor: Color.fromARGB(255, 17, 209, 223),
                        icon: Icon(Icons.access_alarm_outlined),
                        func: () {}),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "تم حساب \n  ${itemProvider.sum7}  جنيه ",
                        h: 0.40,
                        buttonColor: Color.fromARGB(255, 6, 53, 114),
                        icon: Icon(Icons.ac_unit_outlined),
                        func: () {}),
                    elvbtn(
                        fontSize: 12,
                        context: context,
                        label: "عجز \n  ${itemProvider.sum5}  جنيه ",
                        h: 0.40,
                        buttonColor: Color.fromARGB(255, 9, 126, 134),
                        icon: Icon(Icons.access_alarm_outlined),
                        func: () {}),
                  ],
                ),
              ],
            );
          }
        }),
      ),
    );
  }
}
