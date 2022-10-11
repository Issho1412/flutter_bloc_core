import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:src_core_bloc/core/base/base_event.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/features/extras/trim_video/trim_video_bloc.dart';
import 'package:video_trimmer/video_trimmer.dart';

class TrimVideoPage extends StatefulWidget {
  const TrimVideoPage({Key? key, required this.data}) : super(key: key);
  final dynamic data;

  @override
  State<TrimVideoPage> createState() => _TrimVideoPageState();
}

class _TrimVideoPageState extends State<TrimVideoPage> {
  final TrimVideoBloc _trimVideoBloc = TrimVideoBloc();

  @override
  void initState() {
    super.initState();
    _trimVideoBloc.add(FetchDataEvent(
      param: widget.data
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TrimVideoBloc, BaseState>(
          bloc: _trimVideoBloc,
          builder: (context, _) => Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Visibility(
                    visible: _trimVideoBloc.progressVisibility,
                    child: const LinearProgressIndicator(
                      backgroundColor: ColorConst.kTxtDanger,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _trimVideoBloc.progressVisibility
                    ? null
                    : () async {
                        _trimVideoBloc.saveVideo().then((outputPath) {
                          log('OUTPUT PATH: $outputPath');
                          // final snackBar = const SnackBar(
                          //   content: Text('Video Saved successfully')
                          // );
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   snackBar,
                          // );
                        });
                      },
                    child: const Text("SAVE"),
                  ),
                  Expanded(
                    child: VideoViewer(trimmer: _trimVideoBloc.trimmer),
                  ),
                  Center(
                    child: TrimEditor(
                      trimmer: _trimVideoBloc.trimmer,
                      viewerHeight: 50.0,
                      viewerWidth: MediaQuery.of(context).size.width,
                      maxVideoLength: const Duration(minutes: 4),
                      onChangeStart: (value) {
                          _trimVideoBloc.updateTime(value, 1);
                        },
                        onChangeEnd: (value) {
                          _trimVideoBloc.updateTime(value, 0);
                        },
                        onChangePlaybackState: (value) {
                          _trimVideoBloc.updatePlaying(value);
                        },
                      ),
                  ),
                  TextButton(
                    child: _trimVideoBloc.isPlaying
                      ? const Icon(
                          Icons.pause,
                          size: 80.0,
                          color: ColorConst.kTxtWhite,
                        )
                      : const Icon(
                          Icons.play_arrow,
                          size: 80.0,
                          color: ColorConst.kTxtWhite,
                        ),
                      onPressed: () {
                        _trimVideoBloc.play();
                      }
                  )
                ],
              )
            ),
          ),
        ),
      )
    );
  }
}
