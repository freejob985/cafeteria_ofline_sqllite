import 'package:cafeteria_ofline/Custom_widget/MyDrawer.dart';
import 'package:flutter/material.dart';

class Aggregation extends StatefulWidget {
  const Aggregation({Key? key}) : super(key: key);

  @override
  _AggregationState createState() => _AggregationState();
}

class _AggregationState extends State<Aggregation> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Card(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: ListTile(
                  leading: Icon(Icons.computer),
                  title: Text('Computers'),
                  subtitle: Text('Quantity: 10'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Add your action when the button is pressed
                    },
                    child: Text('Button'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
