import 'package:cafeteria_ofline/Widget/Accounts.dart';
import 'package:cafeteria_ofline/Widget/Aggregation.dart';
import 'package:cafeteria_ofline/Widget/Bench.dart';
import 'package:cafeteria_ofline/Widget/Consumptions.dart';
import 'package:cafeteria_ofline/Widget/Home.dart';
import 'package:cafeteria_ofline/Widget/Settings.dart';
import 'package:cafeteria_ofline/Widget/Terms.dart';
import 'package:cafeteria_ofline/Widget/Varieties.dart';
import 'package:cafeteria_ofline/Widget/Workers.dart';
import 'package:cafeteria_ofline/Widget/new_registration.dart';
import 'package:cafeteria_ofline/Widget/reservation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const start());
}

class start extends StatelessWidget {
  const start({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'Home': (context) => const Home(),
        'Bench': (context) => const Bench(),
        'Consumptions': (context) => const Consumptions(),
        'Terms': (context) => const Terms(),
        'Varieties': (context) => const Varieties(),
        'Workers': (context) => const Workers(),
        'NewRegistration': (context) => const NewRegistration(),
        'Accounts': (context) => const Accounts(),
        'Reservation': (context) => Reservation(),
        'Settings': (context) => Settings(),
        'Aggregation': (context) => Aggregation(),
      },
      initialRoute: 'Home',
      debugShowCheckedModeBanner: false,
    );
  }
}
