import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/Provider/ReservationProvider.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as provider;
import 'package:provider/provider.dart';

class NewRegistration extends StatefulWidget {
  const NewRegistration({Key? key}) : super(key: key);

  @override
  _NewRegistrationState createState() => _NewRegistrationState();
}

class _NewRegistrationState extends State<NewRegistration> {
  late ReservationProvider _ReservationProvider;

  void initState() {
    super.initState();
    _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: false);
    _ReservationProvider.new_computer();
  }

  @override
  Widget build(BuildContext context) {
    var _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: true);

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
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(pr), // تغيير لون الخلفية
                foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // تغيير لون النص
              ),
              child: Text('الرئسية',
                  style: TextStyle(fontFamily: 'Al-Jazeera', fontSize: 15)),
            ),
          ],
          title: const Text(' التسجيلات الجديدة',
              style: TextStyle(fontFamily: 'Al-Jazeera', fontSize: 15)),
        ),
        drawer: MyDrawer(),
        body: Selector<ReservationProvider, List<Map<String, dynamic>>>(
          selector: (context, myType) => myType.data_SQL,
          builder: (context, myType, child) {
            return ListView.builder(
              itemCount: myType.length,
              itemBuilder: (context, index) {
                final item = myType[index];
                int id = item['id'];
                String seatx = item['seatx'];
                String Varieties = item['Varieties'];
                String Quantity = item['Quantity'];
                String price = item['price'];
                String computer = item['computer'];
                String check = item['check'];
                return computer.contains("0")
                    ? Card(
                        margin: const EdgeInsets.all(8.0),
                        child: ListTile(
                          onTap: () {
                            _ReservationProvider.computer(id, computer);
                            _ReservationProvider.new_computer();

                            ///    setState(() {});
                          },
                          title: Text(Varieties,
                              style: TextStyle_(
                                fontSize: 18,
                              )),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(Quantity,
                                  style: TextStyle_(
                                    fontSize: 18,
                                  )),
                              Divider(
                                thickness: 1,
                              ),
                              Text("$price جنيه",
                                  style: TextStyle_(
                                    fontSize: 18,
                                  )),
                              Divider(
                                thickness: 1,
                              ),
                              Text("المقعد: ${seatx}",
                                  style: TextStyle_(
                                    fontSize: 18,
                                  )),
                              Divider(
                                thickness: 1,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    // Handle button press for each list item
                                  },
                                  child: Text(
                                    check,
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
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 59, 14, 143))),
                            child: Text('computer'),
                          ),
                        ),
                      )
                    : otherstatae(
                        Varieties: Varieties,
                        Quantity: Quantity,
                        price: price,
                        seatx: seatx,
                        check: check,
                        id: id,
                        computer: computer);
              },
            );
          },
        ),
      ),
    );
  }
}

class otherstatae extends StatefulWidget {
  const otherstatae({
    super.key,
    required this.Varieties,
    required this.Quantity,
    required this.price,
    required this.seatx,
    required this.check,
    required this.id,
    required this.computer,
  });

  final String Quantity;
  final String Varieties;
  final String check;
  final String computer;
  final int id;
  final String price;
  final String seatx;

  @override
  State<otherstatae> createState() => _otherstataeState();
}

class _otherstataeState extends State<otherstatae> {
  @override
  Widget build(BuildContext context) {
    var _ReservationProvider =
        provider.Provider.of<ReservationProvider>(context, listen: true);
    return Card(
      color: Color.fromARGB(255, 242, 243, 243), // يمكنك تغيير اللون هنا

      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        onTap: () {
          _ReservationProvider.computer(widget.id, widget.computer);
          _ReservationProvider.new_computer();

          ///    setState(() {});
        },
        title: Text(widget.Varieties,
            style: TextStyle_(
              fontSize: 10,
            )),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.Quantity,
                style: TextStyle_(
                  fontSize: 10,
                )),
            Text(widget.price,
                style: TextStyle_(
                  fontSize: 10,
                )),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            // Handle button press for each list item
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 38, 235, 159))),
          child: Text('registration',
              style: TextStyle_(fontSize: 10, color: Colors.white)),
        ),
      ),
    );
  }
}
