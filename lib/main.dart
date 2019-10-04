import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:redux/redux.dart';
import 'package:sneaker_stk/home/homewidget.dart';
import 'package:sneaker_stk/locker/sneakerlockerwidget.dart';
import 'appstate/appreducer.dart';

void main() async{
  var store = Store<AppState>(
      appReducer,
      initialState: AppState.initial(),
    );
  runApp(new App(store));
}

class App extends StatefulWidget {
  final Store<AppState> store;

  App(this.store);
  @override
  _AppState createState() => _AppState();
}


class _AppState extends State<App> {
    @override

    //https://proandroiddev.com/implementing-redux-architecture-with-flutter-dd28640dd945
    Widget build(BuildContext context) {
    return new  StoreProvider<AppState>(
      store: widget.store,
      child: new MaterialApp(
        theme: ThemeData(primarySwatch: Colors.red),
        home: HomeWidget(),    
      ),
    );
  }
}
