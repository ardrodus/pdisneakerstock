import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sneaker_stk/appstate/appstate.dart';

import 'package:sneaker_stk/locker/sneaker/sneakerwidget.dart';
import 'package:redux/redux.dart';
import 'sneakerlockerviewmodel.dart';

class SneakerLockerWidget extends StatefulWidget {
  @override
  createState() => _SneakerLockerState();
}

class _SneakerLockerState extends State<SneakerLockerWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) =>
      StoreConnector<AppState, SneakerLockerViewModel>(
        converter: (Store<AppState> store) =>
            SneakerLockerViewModel.fromStore(store),
        builder: (BuildContext context, SneakerLockerViewModel viewModel) =>
            Scaffold(
          appBar: AppBar(
            title: Text(viewModel.pageTitle),
          ),
          body: ListView.builder(
              itemCount: viewModel.sneakers.length * 2,
              itemBuilder: (BuildContext context, int position) {
                if (position.isOdd) return Divider();
                final index = position ~/ 2;
                return _buildRow(index, viewModel);
              }),
        ),
      );

  Widget _buildRow(int i, SneakerLockerViewModel viewModel) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title:
              Text("${viewModel.sneakers[i].sneakerName}", style: _biggerFont),
          leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              backgroundImage: AssetImage(viewModel.sneakers[i].avatarUri)),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SneakerWidget(viewModel.sneakers[i])));
          },
        ));
  }
}
