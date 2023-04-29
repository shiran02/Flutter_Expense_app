import 'package:expense/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../model/transaction.dart';
import 'new_transaction.dart';

class UerTransactions extends StatefulWidget {
  const UerTransactions({super.key});

  @override
  State<UerTransactions> createState() => _UerTransactionsState();
}

class _UerTransactionsState extends State<UerTransactions> {
  List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'New bottom',
      amount: 67.34,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Tshirt',
      amount: 47.34,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
