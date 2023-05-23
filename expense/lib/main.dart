// ignore_for_file: deprecated_member_use

import 'package:expense/model/transaction.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Personale Expenses',
      theme:ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'QuickSand',


          textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge:const TextStyle(
              fontFamily:'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold,
          ),
          ),

          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
            titleLarge:const TextStyle(
              fontFamily:'Quicksand',
              fontSize: 18,
              fontWeight: FontWeight.bold,
          ),
            ),
          ),
          
        ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
//const MyHomePage({super.key, required this.title});
// final String title;

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    // late String titleInput;
    late String title;

    final List<Transaction> _userTransaction = [
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

    void _startAddNewTransaction(BuildContext ctx){
      showModalBottomSheet(context: ctx , builder: (_){
        return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      });   ///this method give by flutter

    }

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal  Expenses"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
          onPressed:()=> _startAddNewTransaction(context),
          )
        ],
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
      
            TransactionList(_userTransaction),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:()=> _startAddNewTransaction(context),
        )
    );
  }
}
