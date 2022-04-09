import 'package:expenses_app/widgets/new_person.dart';
import 'package:expenses_app/widgets/new_transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';

import 'package:flutter/material.dart';

import 'models/person.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet<dynamic>(
        context: ctx,
        builder: (_) {
          return Wrap(children: [
            GestureDetector(
              child: NewTransaction(_addNewTransaction, _peopleGroup),
              onTap: () {},
              behavior: HitTestBehavior.opaque,
            )
          ]);
        });
  }

  void _startAddNewPerson(BuildContext ctx) {
    showModalBottomSheet<dynamic>(
        context: ctx,
        builder: (_) {
          return Wrap(children: [
            GestureDetector(
              child: NewPerson(_addNewPerson),
              onTap: () {},
              behavior: HitTestBehavior.opaque,
            )
          ]);
        });
  }

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1',
        title: 'New shoes',
        from: 'Fan',
        to: 'Sam',
        amount: 69.99,
        date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Groceries',
        from: 'Dat',
        to: 'Alex',
        amount: 39.99,
        date: DateTime.now())
  ];

  final List<Person> _peopleGroup = [
    Person(
      name: 'Renee',
      totalOwed: 0,
    ),
    Person(
      name: 'Sam',
      totalOwed: 0,
    )
  ];

  void _addNewTransaction(String title, double amount, String from, String to) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        from: from,
        to: to,
        date: DateTime.now(),
        id: "a");

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _addNewPerson(String name, double amount) {
    final newPs = Person(
      name: name,
      totalOwed: amount,
    );

    setState(() {
      _peopleGroup.add(newPs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () => _startAddNewPerson(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART'),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
