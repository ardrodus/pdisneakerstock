import 'package:sneaker_stk/locker/sneaker.dart';

class SneakerFavoritesState {
  final List<Sneaker> favSneakers;

  SneakerFavoritesState({this.favSneakers});

  factory SneakerFavoritesState.initial( List<Sneaker> snkrs) => SneakerFavoritesState(
    favSneakers: snkrs.where(( snk ) => snk.isFav == true).toList());

  SneakerFavoritesState copyWith({
    List<Sneaker> favSneakers,
  }) {
    return new SneakerFavoritesState(
        favSneakers: favSneakers ?? this.favSneakers);
  }
}
