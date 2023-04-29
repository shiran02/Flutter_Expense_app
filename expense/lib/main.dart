import 'package:expense/model/transaction.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'model/transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/user_transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
    // late String titleInput;
    // late String amountInput;



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                color: Colors.blue,
                elevation: 6,
                child: Text('CHART !'),
              ),
            ),
      
            UerTransactions(),
          ],
        ),
      ),
    );
  }
}
