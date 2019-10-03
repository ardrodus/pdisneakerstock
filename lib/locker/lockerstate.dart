import 'package:sneaker_stk/locker/sneaker.dart';
import 'package:sneaker_stk/shared/appstrings.dart';

class LockerState {
  final List<Sneaker> sneakers;

  LockerState({this.sneakers});

  factory LockerState.initial() => LockerState(sneakers: List.unmodifiable([
        Sneaker(
          "images/whitecement3.jpg",
          "images/whitecementdetail.jpg",
          "images/aboutwhitecement.jpg",
          "White Cement 3",
          AppStrings.whiteCement3Des,
          "images/jordaninwhitecement3.jpg",
          false,
        ),
        Sneaker(
          "images/infrared6.jpg",
          "images/infrared6detail.jpg",
          "images/infrared6.jpg",
          "Infrared 6",
          AppStrings.infrared6Des,
          "images/jordanininfrared6.jpg",
          false,
        ),
        Sneaker(
            "images/concord.jpg",
            "images/concorddetail.jpg",
            "images/aboutconcord.jpg",
            "Concord 11",
            AppStrings.concord11Des,
            "images/jordaninconcord.jpg",
            false)
      ]));

  LockerState copyWith({
    List<Sneaker> sneakers,
  }) {
    return new LockerState(
        sneakers: sneakers ?? this.sneakers);
  }
}
