import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function tsAdd;

  const NewTransaction(this.tsAdd);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amoutnController = TextEditingController();
    //DateTime _selectedDate = DateTime.now();
     DateTime? _selectedDate;

  void _submitData() {

    if(_amoutnController.text.isEmpty){
        return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amoutnController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate ==null) {
      return;
    }

    widget.tsAdd(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker(){
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2023), 
      lastDate: DateTime.now(),
      ).then((pickedDate) {   
          if(pickedDate == null){
            return;
          }

          setState(() {
             _selectedDate = pickedDate;
             print(pickedDate);
          });
      });
      print('...');
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              controller: _amoutnController,
              onSubmitted: (_) => _submitData(),
              // onChanged: (val) {
              //   amountInput = val;
              // },
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                   Expanded(
                     child: Text(
                      _selectedDate == null
                      ? 'No date Choosen !' 
                      : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal
                      ),),
                   ),

                  TextButton(
                    onPressed: (){
                      _presentDatePicker();
                    },
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: _submitData,
              child: const Text(
                'Add Transaction',
               // textColor:Colors.white,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                 // backgroundColor: Colors.purple,
                ),
              ),
              //textColor:Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
