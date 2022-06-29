import 'package:bloc/bloc.dart';
import 'base_event.dart';
import 'base_state.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(const DataLoadedState());
    });
    on<ErrorEvent>((event, emit) {
      emit(ErrorState(message: event.error));
    });
  }
}