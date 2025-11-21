part of "home_bloc.dart";

class HomeEvent {}

class LoadHomeProducts extends HomeEvent {
  final Completer? completer;

  LoadHomeProducts({this.completer});
}
