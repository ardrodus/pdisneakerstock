
import 'package:flutter/foundation.dart';
import 'package:sneaker_stk/favorites/sneakerfavoritesstate.dart';
import 'package:sneaker_stk/locker/lockerstate.dart';
class AppState {
  final LockerState lockerState;
  final SneakerFavoritesState favSneakerState;
  AppState({
    @required this.lockerState,
    this.favSneakerState
    });


  factory AppState.initial() => AppState(
    lockerState: LockerState.initial(),
    favSneakerState: SneakerFavoritesState.initial(LockerState.initial().sneakers)
    );
}