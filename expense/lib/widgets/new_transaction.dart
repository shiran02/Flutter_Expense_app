
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class NewTransaction extends StatefulWidget {

   final Function tsAdd;

   NewTransaction(this.tsAdd);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {

    final titleController = TextEditingController();
    final amoutnController = TextEditingController();

    void submitData(){

      final enteredTitle = titleController.text;
      final enteredAmount = double.parse(amoutnController.text);

      if(enteredTitle.isEmpty || enteredAmount <= 0){
        return;
      }

      widget.tsAdd(
        enteredTitle , 
        enteredAmount,
      );

      Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {

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
              onSubmitted:(_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),

            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              controller: amoutnController,
              onSubmitted:(_) => submitData(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            
            TextButton(
              onPressed:submitData,
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
