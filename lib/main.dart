import 'package:flutter/material.dart';
import 'package:udemy_pengeluaran/transcation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transcation> transcation = [
    Transcation(
        id: 't1', title: 'Baju Baru', amount: 99.00, date: DateTime.now()),
    Transcation(
        id: 't2', title: 'Celana Baru', amount: 50.00, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengeluaran Ku'),
        ),
        body: Column(
          // SpaceAround digunakan untuk membuat jarak antara 2 card
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            Column(
              children: transcation.map((tx) {
                return Card(
                    elevation: 10,
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            tx.amount.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 20,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          children: <Widget>[
                            Text(tx.title),
                            Text(tx.date.toString())
                          ],
                        )
                      ],
                    ));
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
