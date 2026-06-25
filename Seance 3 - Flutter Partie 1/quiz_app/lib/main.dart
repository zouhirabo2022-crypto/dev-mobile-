import 'package:flutter/material.dart';
import 'quiz.dart';
import 'weather.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
              ),
              Tab(
                icon: Icon(Icons.transit_enterexit),
              ),
            ]),
            title: Text('Tab Demo'),
          ),
          body: TabBarView(children: [Quiz(), Weather()]),
        ),
      ),
    );
  }
}
