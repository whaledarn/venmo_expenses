import 'package:flutter/material.dart';

class NewPerson extends StatefulWidget {
  final Function addPs;

  NewPerson(this.addPs);

  @override
  State<NewPerson> createState() => _NewPersonState();
}

class _NewPersonState extends State<NewPerson> {
  final nameController = TextEditingController();

  void submitData() {
    final enteredName = nameController.text;
    final enteredValue = 0.0;

    if (enteredName.isEmpty) return;

    widget.addPs(enteredName, enteredValue);
    Navigator.of(context).pop();
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
                labelText: 'Name',
              ),
              controller: nameController,
            ),
            FlatButton(
              onPressed: () {
                submitData();
              },
              child: Text('Add person'),
            ),
          ],
        ),
      ),
    );
  }
}
