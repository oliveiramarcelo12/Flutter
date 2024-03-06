import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Layout Básico'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               Container(
                height: 100,
                color: Colors.blue,
                child: Center(
                  child: Image.asset(
                    'assets/romero.png'
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 150,
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Container 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: 200,
                color: Colors.orange,
                child: Center(
                  child: Text(
                    'Container 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
