import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:sneaker_stk/locker/sneaker/sneakerstatwidget.dart';
import 'package:sneaker_stk/locker/sneaker/sneakerviewmodel.dart';
import 'package:sneaker_stk/shared/appstrings.dart';
import 'package:redux/redux.dart';

class SneakerWidget extends StatefulWidget {
  final Sneaker sneaker;
  SneakerWidget(this.sneaker);
  @override
  createState() => SneakerState();
}

class SneakerState extends State<SneakerWidget> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SneakerViewModel>(
        converter: (Store<AppState> store) =>
            SneakerViewModel.fromStore(store, widget.sneaker),
        builder: (BuildContext context, SneakerViewModel viewModel) => Scaffold(
            appBar: AppBar(
              title: Text(AppStrings.appTitle),
            ),
            body: detailSliver(viewModel)));
  }

  Widget detailSliver( SneakerViewModel viewModel) {
    final sneaker = viewModel.sneaker;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: Container(),
          title: Text(sneaker.sneakerName),
          backgroundColor: Colors.orange,
          expandedHeight: 500.0,
          flexibleSpace:
              FlexibleSpaceBar(background: sneakerHeader(viewModel)),
        ),
        SliverFixedExtentList(
          itemExtent: 300.0,
          delegate: SliverChildListDelegate(
            [
              aboutTheShoeWidget(sneaker),
              Image.asset(sneaker.jordanInImage,
                  width: 600, height: 500, fit: BoxFit.cover),
              sneakerDescWidget(sneaker),
              Image.asset(sneaker.aboutUri,
                  width: 600, height: 500, fit: BoxFit.cover),
              Container(
                color: Colors.white70,
                child: SneakerStatWidget.withSampleData(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget aboutTheShoeWidget(Sneaker snk) {
    return Container(
      color: Colors.white,
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(Icons.arrow_upward, color: Colors.black54, size: 100.0),
              Center(
                child: Text("About The Shoe",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.display3),
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget sneakerDescWidget(Sneaker sneaker) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Row(children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Center(
                child: Text(
                  sneaker.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle
                      .merge(TextStyle(color: Colors.black54)),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

    Widget sneakerHeader(SneakerViewModel viewModel) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Image.asset(widget.sneaker.detailImageHeaderUri, fit: BoxFit.cover),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.all(0),
          child: IconButton(
            iconSize: 30,
            icon: (viewModel.sneaker.isFav
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border)),
            color: Colors.red,
            onPressed: (){viewModel.toggleSneakerLike(viewModel.sneaker);} ,
          ),
        ),
      ],
    );
  }


}
