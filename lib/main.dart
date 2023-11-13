import 'package:cafeteria_ofline/Provider/BenchProvider.dart';
import 'package:cafeteria_ofline/Provider/ConsumptionsProvider.dart';
import 'package:cafeteria_ofline/Provider/ReservationProvider.dart';
import 'package:cafeteria_ofline/Provider/WorkersProvider.dart';
import 'package:cafeteria_ofline/Provider/itemProvider.dart';
import 'package:cafeteria_ofline/Provider/seatProvider.dart';
import 'package:cafeteria_ofline/Widget/Accounts.dart';
import 'package:cafeteria_ofline/Widget/Accounts_mang.dart';
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
import 'package:provider/provider.dart';

void main() {
  runApp(const start());
}
class start extends StatelessWidget {
  const start({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SeatProvider()),
        ChangeNotifierProvider(create: (_) => BenchProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => WorkersProvider()),
        ChangeNotifierProvider(create: (_) => ConsumptionsProvider()),
        ChangeNotifierProvider(create: (_) => ReservationProvider()),
      ],
      child: MaterialApp(
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
          'AccountsMang': (context) => AccountsMang(),

        },
        initialRoute: 'Home',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
