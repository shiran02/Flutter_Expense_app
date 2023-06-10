import 'package:expense/model/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import '../model/transaction.dart';
import '../model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return  transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
          return Column(
            children: <Widget>[
              Text(
                'No Transactions add yet',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 8,
                margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text('\$${transactions[index].amount}')),
                    ),
                  ),
                  title: Text(transactions[index].title,
                      style: Theme.of(context).textTheme.bodyLarge),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    //   style: Theme.of(context).textTheme.bodyMedium
                  ),
                  trailing: MediaQuery.of(context).size.width> 300 ?  
                  TextButton.icon(
                    icon: Icon(Icons.delete , color: Colors.red), 
                    label: Text('Delete' ,style: TextStyle(color: Colors.red)),
                    onPressed: () => deleteTx(transactions[index].id),
                    )


                  : IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTx(transactions[index].id),
                    color: Colors.red,
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
