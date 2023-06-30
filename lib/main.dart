import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomme, Poire et Ananas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ),
      ),
      home: const MyHomePage(title: 'Pomme, Poire et Ananas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i <= number / 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text('${_counter.toString()} (${getCounterType()})'),
      ),
      body: ListView.builder(
        itemCount: _counter,
        itemBuilder: (BuildContext context, int index) {
          final value = index + 1;
          final backgroundColor = value % 2 == 0 ? Colors.cyan : Colors.indigo;
          final textColor = Colors.white;

          Widget imageWidget;

          if (isPrime(value)) {
            imageWidget = Image.asset('images/ananas.png');
          } else {
            imageWidget = value % 2 == 0
                ? Image.asset('images/poire.png')
                : Image.asset('images/pomme.png');
          }

          return ListTile(
            title: Text(
              'Item $value',
              style: TextStyle(color: textColor),
            ),
            tileColor: backgroundColor,
            leading: imageWidget,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ),
    );
  }

  String getCounterType() {
    if (isPrime(_counter)) {
      return 'nombre premier';
    } else if (_counter % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }
}
