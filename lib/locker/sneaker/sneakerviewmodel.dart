import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:redux/redux.dart';
import 'package:sneaker_stk/locker/sneaker/sneakeractions.dart';

class SneakerViewModel {
  final String pageTitle;
  final Sneaker sneaker;
  final Function(Sneaker sneaker) toggleSneakerLike;

  SneakerViewModel(
      {this.pageTitle, this.sneaker, this.toggleSneakerLike});

  static SneakerViewModel fromStore(Store<AppState> store, Sneaker sneaker) {
    return SneakerViewModel(
        pageTitle: "SNKR STOCK",
        sneaker: store.state.lockerState.sneakers
            .firstWhere((s) => s.sneakerName == sneaker.sneakerName),
        toggleSneakerLike: (sneaker) {
          sneaker.isFav = !sneaker.isFav;
          store.dispatch(ToggleSneakerLike(sneaker));
        });
  }
}
