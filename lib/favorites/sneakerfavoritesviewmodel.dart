import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:redux/redux.dart';

class SneakerFavoritesViewModel {
  final String pageTitle;
  final List<Sneaker> sneakers;
  
  SneakerFavoritesViewModel({this.pageTitle, this.sneakers});

  static SneakerFavoritesViewModel fromStore(Store<AppState> store){
    return SneakerFavoritesViewModel(
      pageTitle: "Favorites",
      sneakers: store.state.favSneakerState.favSneakers
    );
  }
}