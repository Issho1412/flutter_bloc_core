import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnChangeCount extends CounterEvent {
  OnChangeCount();
  @override
  String toString() => 'OnChangeCount';
}