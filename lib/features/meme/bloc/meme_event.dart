import 'package:equatable/equatable.dart';

abstract class MemeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnFetchData extends MemeEvent {
  OnFetchData();
  @override
  String toString() => 'OnFetchData';
}