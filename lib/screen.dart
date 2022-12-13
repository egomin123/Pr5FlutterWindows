import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main.dart';

class Screen extends StatelessWidget {
  const Screen({super.key, required this.count});
  final int count;

  _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('count');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(count.toString()),
          Text(
            '',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: '$count'),
                  ),
                );
              },
              child: Text("На первый экран")),
          ElevatedButton(onPressed: _clearData, child: Text("Clear")),
        ],
      ),
    ));
  }
}
