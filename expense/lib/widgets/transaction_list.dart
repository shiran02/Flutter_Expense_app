import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../model/transaction.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx,index){
            return Card(
              elevation: 6,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).primaryColor,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '\$${transactions[index].amount.toStringAsFixed(2)}', // another way -->  '\$${tx.amount}'
                      style:  TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                         color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        transactions[index].title,
                        style: Theme.of(context).textTheme.titleLarge,
                        // style: const TextStyle(
                        //   fontSize: 18,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      Text(
                        transactions[index].date.toString(),
                      //   style: Theme.of(context).textTheme.titleLarge,
                 
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        );
    
  }
}
