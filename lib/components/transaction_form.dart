import 'package:flutter/material.dart';


class TransactionForm extends StatefulWidget {

  final void Function(String, String) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Titulo',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            FlatButton(
              child: Text('Add to-do'),
              onPressed: () {
                final title = titleController.text;
                final value = valueController.text;
                widget.onSubmit(title, value);
              },
            )
          ],
        ),
      ),
    );
  }
}
