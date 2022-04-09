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

  String? fromController = "";

  String? toController = "";

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    final enteredFrom = fromController;
    final enteredTo = toController;

    if (enteredTitle.isEmpty ||
        enteredFrom == "" ||
        enteredTo == "" ||
        enteredAmount <= 0) return;

    widget.addTx(enteredTitle, enteredAmount, enteredFrom, enteredTo);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var _peopleGroup = widget._peopleGroup;
    var hint = "Person paying";
    var hint2 = "Peope who owe money";

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
                hint: Text(hint),
                isExpanded: true,
                items: _peopleGroup.map<DropdownMenuItem<Person>>((Person p) {
                  return DropdownMenuItem<Person>(
                    value: p,
                    child: Text(p.name),
                  );
                }).toList(),
                onChanged: (Person? p) {
                  fromController = p!.name;
                  submitData();
                }),
            DropdownButton(
                hint: Text(hint2),
                isExpanded: true,
                items: _peopleGroup.map<DropdownMenuItem<Person>>((Person p) {
                  return DropdownMenuItem<Person>(
                    value: p,
                    child: Text(p.name),
                  );
                }).toList(),
                onChanged: (Person? p) {
                  toController = p!.name;
                  submitData();
                }),
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
