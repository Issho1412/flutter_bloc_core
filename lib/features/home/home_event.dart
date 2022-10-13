import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnSetTabIndex extends HomeEvent {
  OnSetTabIndex({this.index = 1});
  final int index;

  @override
  String toString() => 'OnSetTabIndex';
}
