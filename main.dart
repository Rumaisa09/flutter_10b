import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debugging Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DebuggingScreen(),
    );
  }
}

class DebuggingScreen extends StatefulWidget {
  @override
  _DebuggingScreenState createState() => _DebuggingScreenState();
}

class _DebuggingScreenState extends State<DebuggingScreen> {
  int _counter = 0;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    // Debugging with print statement
    print('DebuggingScreen initialized');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      // Debugging with print and debugPrint
      print('Counter incremented to $_counter');
      debugPrint('Counter incremented to $_counter');

      // Debugging with an artificial error
      if (_counter == 5) {
        _isError = true;
        // Trigger assertion to check if the error state is handled
        assert(!_isError, 'Counter should not reach 5');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Debugging with assert
    assert(_counter >= 0, 'Counter should not be negative');
    assert(!_isError, 'An error state has been triggered');

    return Scaffold(
      appBar: AppBar(
        title: Text('Debugging Tools Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            if (_isError)
              Text(
                'An error state is active!',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
