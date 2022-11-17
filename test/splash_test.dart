import 'package:flutter_test/flutter_test.dart';
import 'package:src_core_bloc/features/splash/bloc/splash_bloc.dart';

void main() {
  SplashBloc _splashBloc = SplashBloc();

  test("Selected Index should be changed", () {
    int mindex = 1;
    _splashBloc.updatePageIndex(mindex);
    expect(_splashBloc.currentPage, mindex);
  });
}
