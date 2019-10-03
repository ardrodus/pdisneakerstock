
import 'package:sneaker_stk/appstate/appstate.dart';
import 'package:sneaker_stk/locker/lockerreducers.dart';

AppState appReducer(AppState state, dynamic action) =>
    new AppState(
        lockerState: lockerReducer(state.lockerState, action),
    );


