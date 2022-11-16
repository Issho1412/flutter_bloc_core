import 'package:equatable/equatable.dart';

abstract class NetworkClient<T, Params> {
  Future<T> call(Params params);
}

class NoParameters extends Equatable {
  @override
  List<Object> get props => [];
}
