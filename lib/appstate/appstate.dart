
import 'package:flutter/foundation.dart';
import 'package:sneaker_stk/locker/lockerstate.dart';
class AppState {
  final LockerState lockerState;
  AppState({
    @required this.lockerState
    });
  factory AppState.initial() => AppState(lockerState: LockerState.initial());
}