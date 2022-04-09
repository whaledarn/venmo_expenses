import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:expenses_app/main.dart';

import '../models/person.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  final _peopleGroup;

  NewTransaction(this.addTx, this._peopleGroup);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  final fromController = TextEditingController();

  final toController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredFrom = fromController.text;
    final enteredTo = toController.text;

    if (enteredTitle.isEmpty ||
        enteredFrom.isEmpty ||
        enteredTo.isEmpty ||
        enteredAmount <= 0) return;

    widget.addTx(enteredTitle, enteredAmount, enteredFrom, enteredTo);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var _peopleGroup = widget._peopleGroup;
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            DropdownButton(
              items: _peopleGroup.map<DropdownMenuItem<Person>>((Person p) {
                return DropdownMenuItem<Person>(
                  value: p,
                  child: Text(p.name),
                );
              }).toList(),
              onChanged: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Person Paying',
              ),
              controller: fromController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'People',
              ),
              controller: toController,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: () {
                submitData();
              },
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
