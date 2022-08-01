import 'package:calculator/modules/calculator/screens/calculator_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,

          title: const TabBar(indicatorWeight: 0.1, tabs: [
            Tab(
              child: Text('Calculator'),
            ),
            Tab(
              child: Text('Currency Converter'),
            )
          ]),
          // title: const Text('Calculator'),
        ),
        body: TabBarView(
          children: [
            Calculator(),
            Container(child: Text('Currency Converter')),
          ],
        ),
      ),
    );
  }
}
