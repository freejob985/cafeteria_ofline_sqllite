import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:cafeteria_ofline/hellper/SessionManager.dart';
import 'package:cafeteria_ofline/hellper/function.dart';
import 'package:flutter/material.dart';
import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:cafeteria_ofline/hellper/kit.dart';

class Casher extends StatefulWidget {
  const Casher({Key? key}) : super(key: key);
  @override
  State<Casher> createState() => _CasherState();
}

class _CasherState extends State<Casher> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();

  int number1 = 0;
  int number2 = 0;
  int number3 = 0;
  int number4 = 0;
  int number5 = 0;
  int number6 = 0;
  int number7 = 0;
  int all = 0;
  int intall = 0;

  void dispose() {
    controller1.dispose();
    controller2.dispose(); //
    controller3.dispose(); //
    controller4.dispose(); //
    controller5.dispose(); //
    controller6.dispose(); //
    controller7.dispose(); //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        drawer: MyDrawer(),
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
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                // Add a decorative container with text and icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue, // Change the color as needed
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '  درج   $all      ',
                        style: TextStyle_(fontSize: 18, color: Colors.white),
                      ),
                      Icon(
                        Icons.local_atm,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Add some spacing
                // Your existing rows with buttons and text fields
                buildRowWithButtonAndTextField("جنيه", controller1, (val) {
                  int value1 = int.tryParse(val) ?? 0 * 1;
                  number1 = value1;
                  intall += number1;
                  all = number1;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("خمسة جنيه", controller2, (val) {
                  int value1 = int.tryParse(val) ?? 0 * 5;
                  number2 = value1 * 5;
                  intall += number2;
                  all = number2;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("عشرة جنيه", controller3, (val) {
                  int value1 = int.tryParse(val) ?? 0 * 10;
                  number3 = value1 * 10;
                  intall += number3;
                  all = number3;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("عشرين جنيه", controller4,
                    (val) {
                  int value1 = int.tryParse(val) ?? 0 * 20;
                  number4 = value1 * 20;
                  all = number4;
                  intall += number4;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("خمسين جنيه", controller5,
                    (val) {
                  int value1 = int.tryParse(val) ?? 0 * 50;
                  number5 = value1 * 50;
                  all = number5;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("مائة جنيه", controller6, (val) {
                  int value1 = int.tryParse(val) ?? 0 * 100;
                  number6 = value1 * 100;
                  all = number6;
                  setState(() {});
                }),
                SizedBox(height: 16),
                buildRowWithButtonAndTextField("مائتين جنيه", controller7,
                    (val) {
                  int value = int.tryParse(val) ?? 0 * 200;
                  number7 = value * 200;
                  all = number7;
                  setState(() {});
                }),
                SizedBox(height: 16),

                // Button with icon and text
                ElevatedButton.icon(
                  onPressed: () {
               int a=     number1 +
                        number2 +
                        number3 +
                        number4 +
                        number5 +
                        number6 +
                        number7;

           SessionManager.setSession('Casher', a.toString());

        showNotification(context,
                        title: "", message: " تم حفظ قيمة الكاشير");

                  },
                  icon: Icon(Icons.attach_money), // Icon
                  label: Text(
                    '${number1 + number2 + number3 + number4 + number5 + number6 + number7}',
                    style: TextStyle_(fontSize: 20, color: Colors.white),
                  ), // Text indicating the meaning of the icon
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        pr), // تغيير لون الخلفية
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // تغيير لون النص
                    fixedSize: MaterialStateProperty.all<Size>(
                      Size.fromWidth(MediaQuery.of(context).size.width),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRowWithButtonAndTextField(String text,
      TextEditingController _itemController, void Function(String) func) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: Colors.white,
                fontFamily: 'Al-Jazeera',
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(pr),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              fixedSize: MaterialStateProperty.all<Size>(
                Size.fromHeight(50),
              ),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: _itemController,
            onChanged: func,
            style: TextStyle(color: Colors.black),
            cursorColor: pr,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'أدخل عدد الفئات ',
              labelStyle:
                  TextStyle(fontSize: 12, color: pr, fontFamily: 'Al-Jazeera'),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: pr, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.edit, color: pr),
              suffixIcon: Icon(Icons.check, color: pr),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}
