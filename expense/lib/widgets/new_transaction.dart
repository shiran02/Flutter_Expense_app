import 'package:expense/widgets/user_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatelessWidget {

   final Function tsAdd;

   NewTransaction(this.tsAdd);

      final titleController = TextEditingController();
    final amoutnController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    UerTransactions tr;
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                labelText: "Title",
              ),
              controller: titleController,
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),

              controller: amoutnController,

              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            TextButton(
              onPressed: () {
                // print(titleController.text);
                // print(amoutnController.text);
                //print(amountInput);

                tsAdd(titleController.text , double.parse(amoutnController.text));
              },
              child: const Text(
                'Add Transaction',
              ),
              //textColor:Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
