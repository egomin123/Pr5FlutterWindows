//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pr5/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  late SharedPreferences sharedPreferences;

  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    _counter = sharedPreferences.getInt('counter') ?? 0;
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('count', _counter);
  }

  _clearData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('count');
    setState(() {
      _counter = 0;
    });
  }

  final int qwe = 1;
  int eqw = 1;
  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((value) {
      setState(() {
        if (value.containsKey('count')) {
          _counter = value.getInt('count')!;
          if (qwe == eqw) {
            eqw++;
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => Screen(
                          count: _counter,
                        )));
          }
        }
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Screen(count: _counter),
                    ),
                  );
                },
                child: Text("На второй")),
            ElevatedButton(onPressed: _saveData, child: Text("Save")),
            ElevatedButton(onPressed: _clearData, child: Text("Clear")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
