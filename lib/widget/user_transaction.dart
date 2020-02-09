import 'package:flutter/material.dart';
import '../models/transcation.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transcation> _userTranscations = [
    Transcation(
      id: 't1',
      title: 'Baju Baru',
      amount: 100.511,
      date: DateTime.now(),
    ),
    Transcation(
      id: 't2',
      title: 'Celana Baru',
      amount: 50.321,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTittle, double txAmount) {
    final newTtransaction = Transcation(
      // DateTime pada id digunakan
      //untuk kode unik sementara
      id: DateTime.now().toString(),
      title: txTittle,
      amount: txAmount,
      date: DateTime.now(),
    );
    setState(() {
      _userTranscations.add(newTtransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // TextField
        NewTransaction(),
        // List Transaction
        TransactionList(_userTranscations),
      ],
    );
  }
}
