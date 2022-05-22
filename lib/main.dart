import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mycard/components/transaction_form.dart';
import 'components/transaction_form.dart';
import 'components/transaction_list.dart';
import 'models/transaction.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
    Transaction(
      id: 'J1',
      title: 'Fazer algo muito importante',
      anotacao: 'Hoje Necessito fazer algo muito importante',
      date: DateTime.now(),
    ),
    Transaction(
      id: 'J2',
      title: 'Pagar algo muito importante',
      anotacao: 'Tenho que pagar hoje algo muito importante',
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, String value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      anotacao: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();

  }

  _openTransactionFormModel(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransaction);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[100],
        title: Text('To-do List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add), onPressed: () => _openTransactionFormModel(context),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.red[50],
                child: Text('Tarefas'),
              ),
            ),
            TransactionList(_transactions),

          ],
        ),
      ),
     floatingActionButton: FloatingActionButton(
       onPressed: () => _openTransactionFormModel(context),
       child: Icon(Icons.add),
     ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
