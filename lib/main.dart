import 'package:flutter/material.dart';
import './widget/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengeluaran Ku'),
        ),
        body: SingleChildScrollView(
          child: Column(
            // SpaceAround digunakan untuk membuat jarak antara 2 card
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                  child: Text("Chart"),
                  elevation: 10,
                ),
              ),
              UserTransaction(),
            ],
          ),
        ),
      ),
    );
  }
}
