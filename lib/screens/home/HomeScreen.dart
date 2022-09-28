import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCouter() {
    setState(() => {_counter = 0});
  }

  @override
  Widget build(BuildContext context) {
    String _showMessage() {
      return (_counter <= 1)
          ? "You have pushed the button this $_counter time"
          : "You have pushed the button this $_counter times";
    }

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the HomeScreen object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _showMessage(),
              ),
              Text(
                'vukm',
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ),
        floatingActionButton: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () {
              _resetCouter();
            },
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              _incrementCounter();
            },
            child: const Icon(Icons.add),
          )
        ]));
  }
}
