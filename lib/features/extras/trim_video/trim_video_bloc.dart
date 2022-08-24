import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:video_trimmer/video_trimmer.dart';
import '../../../core/base/base_state.dart';

class TrimVideoBloc extends Bloc<BaseEvent, BaseState> {
  int value = 0;
  final Trimmer _trimmer = Trimmer();
  double _startCutTime = 0, _endCutTime = 0;
  bool isPlaying = false, _progress = false;

  TrimVideoBloc() : super(const InitialState()) {
    on<FetchDataEvent>((event, emit) {
      emit(DataLoadingState());
      loadVideo(event.param);
      emit(const DataLoadedState());
    });
    init();
  }

  void init() {
    log('TrimVideoBloc init');
  }

  get progressVisibility => _progress;

  get trimmer => _trimmer;

  void loadVideo(data) {
    _trimmer.loadVideo(videoFile: data);
  }

  void updateTime(value, int type) {
    if (type == 1) {
      _startCutTime = value;
    }
    if (type == 0) {
      _endCutTime = value;
    }
  }

  void updatePlaying(bool value) {
    isPlaying = value;
  }

  void play() async {
    bool playbackState = await _trimmer.videPlaybackControl(
      startValue: _startCutTime,
      endValue: _endCutTime,
    );
    log('playBack: $playbackState');
    isPlaying = playbackState;
  }

  Future<String> saveVideo() async {
    _progress = true;
    String _value = '';

    await _trimmer
        .saveTrimmedVideo(startValue: _startCutTime, endValue: _endCutTime)
        .then((value) {
      GallerySaver.saveVideo(value);
      _progress = false;
      _value = value;
    });

    return _value;
  }
}
