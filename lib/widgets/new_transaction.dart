import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

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
  }

  @override
  Widget build(BuildContext context) {
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
