import 'package:sneaker_stk/locker/lockerstate.dart';
import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:redux/redux.dart';
import 'package:sneaker_stk/locker/sneaker/sneakeractions.dart';


final lockerReducer = combineReducers<LockerState>([
  TypedReducer<LockerState, ToggleSneakerLike>(_toggleItemState),
]);

LockerState _toggleItemState(LockerState locker, ToggleSneakerLike action) {
 List<Sneaker> sneakersNew = locker.sneakers
      .map((sneaker) => sneaker.sneakerName == action.sneaker.sneakerName
          ? action.sneaker
          : sneaker)
      .toList();
  return locker.copyWith(sneakers: sneakersNew);
}
