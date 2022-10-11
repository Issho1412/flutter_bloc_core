import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:src_core_bloc/core/base/base_state.dart';
import 'package:src_core_bloc/core/util/style/colors.dart';
import 'package:src_core_bloc/features/meme/bloc/meme_bloc.dart';
import 'package:src_core_bloc/widgets/custom_text.dart';
import 'package:src_core_bloc/widgets/meme/meme_item.dart';

import '../../core/util/style/others.dart';

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
        return Scaffold(
          body: Container(
            padding: const EdgeInsets.all(StyleOthersConst.kPaddingDefault),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Welcome',
                  weight: StyleOthersConst.kBold,
                  color: ColorConst.kTxtDefault,
                  size: StyleOthersConst.kSize + 4,
                ),
            const SizedBox(height: StyleOthersConst.kHeightDefault /2,),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async{
                },
                child: ListView.builder(
                controller: _memeBloc.controller,
                itemCount: _memeBloc.lstMeme.length,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                  itemBuilder: (BuildContext context, index){
                    return MemeItem(
                      meme: _memeBloc.lstMeme[index]
                    );
                  }
                ),
              ) 
            ),
          ],
        ),
      ),
        );
      },
    );
  }
}
