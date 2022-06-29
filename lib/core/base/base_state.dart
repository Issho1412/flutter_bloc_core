import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState();

  @override
  List<dynamic> get props => [];
}

class InitialState extends BaseState {
  const InitialState();

  @override
  String toString() => "InitialState";
}

class DataLoadingState extends BaseState {
  @override
  String toString() => 'DataLoadingState';
}

class GettingDataState extends BaseState {}

class DataLoadedState extends BaseState {
  final dynamic data;
  const DataLoadedState({this.data});

  @override
  List<Object> get props => [data];

  @override
  String toString() => 'DataLoadedState: $data';
}

class ErrorState extends BaseState {
  final dynamic message;
  const ErrorState({this.message});

  @override
  List<Object> get props => [message, DateTime.now()];

  @override
  String toString() => "Error: $message";
}

enum StatusLoadMore { loading, loaded, err }
