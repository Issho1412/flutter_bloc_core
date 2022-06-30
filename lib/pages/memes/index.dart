import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/features/meme/bloc/meme_bloc.dart';

class MemePage extends StatefulWidget {
  const MemePage({Key? key}) : super(key: key);

  @override
  State<MemePage> createState() => _MemesPageState();
}

class _MemesPageState extends State<MemePage> {
  final MemeBloc _memeBloc = MemeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MemeBloc, BaseState>(
      bloc:  _memeBloc,
      builder: (context, state) {
        return const Scaffold(
          body: Text('MEME pages'),
        );
      },
    );
  }
}
