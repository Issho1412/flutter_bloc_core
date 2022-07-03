import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/data/models/meme/meme.dart';
import 'package:src_core_bloc/data/repositories/meme_repository.dart';
import '../../../core/base/base_state.dart';
import '../../../core/util/request_handler.dart';
import 'meme_event.dart';

class MemeBloc extends Bloc<MemeEvent, BaseState> {
  int value = 0;
  ScrollController controller = ScrollController();
  List<MemeModel> lstMeme = []; 

  final MemeRepository _memeRepo = MemeRepository();
  MemeBloc() : super(const InitialState()) {
    on<OnFetchData>((event, emit) {
      emit(DataLoadingState());
      increaseValue();
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('MemeBloc init');
    _fetchMemes();
  }

  void increaseValue() {
    value++;
    log('value $value');
  }

  Future<void> _fetchMemes() async {
    var fetchMemes = await _memeRepo.getMemes();
    handleEither(fetchMemes, (res) async {
      if(res is List<MemeModel>){
        lstMeme.addAll(res);
        add(OnFetchData());
      }
      log('RES $res');
    });
  }
}
