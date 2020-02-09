import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTransaction);

  void submitTransaction() {
    final enterTittle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTittle.isEmpty || enterAmount <= 0) {
      return;
    }

    addTransaction(
      titleController.text,
      double.parse(amountController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitTransaction,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              controller: amountController,
              // _ suatu fungsi anonim, digunakan hanya untuk memnuhi persaratan pada onSubmitted
              onSubmitted: (_) => submitTransaction,
            ),
            FlatButton(
              onPressed: submitTransaction,
              textColor: Colors.purple,
              child: Text('Tambah Transaksi'),
            )
          ],
        ),
      ),
    );
  }
}
