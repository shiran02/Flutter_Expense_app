// ignore_for_file: deprecated_member_use

import 'package:expense/model/transaction.dart';
import 'package:expense/widgets/chart.dart';
import 'package:expense/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/transaction_list.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personale Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // accentColor: Colors.amber,
        fontFamily: 'QuickSand',

        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

        appBarTheme: AppBarTheme(
          toolbarTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                titleLarge: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
              .bodyText2,
          titleTextStyle: ThemeData.light()
              .textTheme
              .copyWith(
                titleLarge: const TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              )
              .headline6,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

//const MyHomePage({super.key);
// final String title;

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late String titleInput;
  late String title;

  final List<Transaction> _userTransaction = [
    // Transaction(
    //   id: 't1',
    //   title: 'New bottom',
    //   amount: 67.34,
    //   date: DateTime.now(),
    // ),

    // Transaction(
    //   id: 't2',
    //   title: 'New Tshirt',
    //   amount: 47.34,
    //   date: DateTime.now(),
    // ),
  ];

  bool _showchart = false;

  List<Transaction> get _recentTransactions {
    //get is key word its used to dart get
    //return _userTransaction.where((tx){
    //return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);}).toList();
    return _userTransaction
        .where((tx) => DateTime.now().difference(tx.date).inDays <= 7)
        .toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
    );

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(_addNewTransaction),
        );
      },
    );

    ///this method give by flutter
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final appBar = AppBar(
      title: const Text("Personal  Expenses"),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        )
      ],
    );

    final txtListWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.6,
        child: TransactionList(_userTransaction, _deleteTransaction));


    return Scaffold(
        appBar: appBar,
        body: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (isLandscape)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Show Chart'),
                    Switch(
                      value: _showchart,
                      onChanged: (bool value) {
                        setState(() {
                          _showchart = value;
                        });
                      },
                    ),
                  ],
                ),
              if(!isLandscape)
                  Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.3,
                      child: Chart(_recentTransactions)),
              if(!isLandscape) txtListWidget,
              if(isLandscape)_showchart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_recentTransactions))
                  : txtListWidget
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => _startAddNewTransaction(context),
        ));
  }
}
