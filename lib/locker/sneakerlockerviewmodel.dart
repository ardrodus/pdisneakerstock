
import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:redux/redux.dart';

class SneakerLockerViewModel {
  final String pageTitle;
  final List<Sneaker> sneakers;
  
  SneakerLockerViewModel({this.pageTitle, this.sneakers});

  static SneakerLockerViewModel fromStore(Store<AppState> store){
    return SneakerLockerViewModel(
      pageTitle: "SNKR STOCK",
      sneakers: store.state.lockerState.sneakers
    );
  }
}