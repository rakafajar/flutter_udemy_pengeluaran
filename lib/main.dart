import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:udemy_pengeluaran/transcation.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Transcation> transcation = [
    Transcation(
        id: 't1', title: 'Baju Baru', amount: 100.511, date: DateTime.now()),
    Transcation(
        id: 't2', title: 'Celana Baru', amount: 50.321, date: DateTime.now()),
  ];

  // String title;
  // String amount;

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pengeluaran Ku'),
        ),
        body: Column(
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
            // TextField
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleController,
                      // onChanged: (value) {
                      //   title = value;
                      // },
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      // onChanged: (value) {
                      //   amount = value;
                      // },
                    ),
                    FlatButton(
                      onPressed: () {
                        print(titleController.text);
                        print(amountController.text);
                      },
                      textColor: Colors.purple,
                      child: Text('Tambah Transaksi'),
                    )
                  ],
                ),
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
                            'Rp. ${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                              fontSize: 20,
                            ),
                          ),
                          padding: EdgeInsets.all(10),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              // Class untuk membuat format data
                              // menggunakan paket library
                              DateFormat('dd MMMM y').format(tx.date),
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            )
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
