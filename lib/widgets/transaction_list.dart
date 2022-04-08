import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              color: Color.fromRGBO(64, 75, 96, .9),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(2, 16, 8, 16),
                child: Row(
                  children: [
                    Container(
                        // Dollar Amount
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Text(
                          "\$ ${transactions[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white70,
                          ),
                        )),
                    Column(
                      // Title and Date
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(transactions[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              )),
                        ),
                        Container(
                          child: Text(
                            DateFormat('yyyy/MM/dd')
                                .format(transactions[index].date),
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      // People
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Person Paying: ${transactions[index].from}",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            )),
                        Text("People: ${transactions[index].to}",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white54,
                            )),
                      ],
                    )
                  ],
                ),
              ));
        },
        itemCount: transactions.length,
      ),
    );
  }
}
