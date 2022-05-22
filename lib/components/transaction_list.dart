import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget{

  final titleController = TextEditingController();

  final valueController = TextEditingController();
  
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: transactions.map((tr){
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                    ),
                    padding: EdgeInsets.all(10) ,

                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tr.anotacao.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        tr.title,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateFormat('d MMM y').format(tr.date),
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                      FlatButton(
                        child: Text('Editar'),
                        onPressed: () {
                          final title = titleController.text;
                          final value = valueController.text;
                          onSubmit(title, value);
                        },
                      )
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void onSubmit(String title, String value) {}
}