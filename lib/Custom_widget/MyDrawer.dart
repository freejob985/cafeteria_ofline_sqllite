import 'package:cafeteria_ofline/hellper/Constants.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: pr,
              ),
              child: Text(
                ' القائمة',
                style: TextStyle_(fontSize: 15, color: Colors.white),
              ),
            ),
            ListTile(
              title: Text(
                'الرئسية',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.home), // Icon for home
              onTap: () {
                Navigator.pushNamed(context, "Home");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),
            ListTile(
              title: Text(
                'الحسابات',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.account_box), // Icon for accounts
              onTap: () {
                Navigator.pushNamed(context, "AccountsMang");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),
            ListTile(
              title: Text(
                'كمبيوتر',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.computer), // Icon for computer
              onTap: () {
                Navigator.pushNamed(context, "NewRegistration");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),
            ListTile(
              title: Text(
                'بنود',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.description), // Icon for terms
              onTap: () {
                Navigator.pushNamed(context, "Terms");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),
            ListTile(
              title: Text(
                'عمال',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.work), // Icon for workers
              onTap: () {
                Navigator.pushNamed(context, "Workers");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),
            ListTile(
              title: Text(
                'استهلاكات',
                style: TextStyle_(fontSize: 15),
              ),
              leading: Icon(Icons.local_cafe), // Icon for consumptions
              onTap: () {
                Navigator.pushNamed(context, "Consumptions");
              },
            ),
            Divider(
              color: Color.fromARGB(255, 226, 225, 225),
              thickness: 1, // تغيير السمك حسب الحاجة
            ),    ListTile(
              title: Text(
                'درج',
                style: TextStyle_(fontSize: 15),
              ),

              leading: Icon(Icons.motion_photos_on_outlined), // Icon for consumptions
              onTap: () {
                Navigator.pushNamed(context, "Casher");
              },
            ),
            ListTile(
              title: Text(
                'اعدادت',
                style: TextStyle_(fontSize: 15),
              ),

              leading: Icon(Icons.settings), // Icon for consumptions
              onTap: () {
                Navigator.pushNamed(context, "Settings");
              },
            ),
          ],
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
