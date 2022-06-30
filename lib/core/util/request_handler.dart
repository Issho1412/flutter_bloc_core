import 'dart:developer';

import '../../features/error/server_exception.dart';
import '../../features/error/server_failture.dart';
import '../connection/networkInfo.dart';
import 'package:dartz/dartz.dart';

Future<T> handleRemoteRequest<T>(Future<T> Function() onRequest) async {
  try {
    T value = await onRequest();
    return value;
  } catch (e) {
    throw ServerException(e.toString());
  }
}

Future<Either<Failure, T>> handleRepositoryCall<T>(NetworkInfo networkInfo,
    {required Future<Either<Failure, T>> Function() onRemote,
    required Future<Either<Failure, T>> Function() onLocal}) async {
  if (await networkInfo.isConnected) {
    try {
      Either<Failure, T> value = await onRemote();
      return value;
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  } else {
    try {
      Either<Failure, T> value = await onLocal();
      return value;
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}

handleEither<B, T extends Failure, S>(Either<T, S> either, B Function(S r) onResult,
    {Function(String message)? onError, bool? shouldUseDefaultError, String? defaultError}) {
  either.fold((l) {
    log(l.message, name: 'EITHER ERROR');
    // if (EviConst.error.contains(l.message)) {
    //   int index = EviConst.error.indexOf(l.message);
    //   if (index == 0) {
    //     Get.offAllNamed(OptionScreen.router);
    //   }

    //   showToast(EviConst.errorText[index], ToastType.fail);
    // }
    if (onError != null) {
      onError(l.message);
    }
  }, onResult);
}

Future handleError(String message, {bool shouldUseDefaultError = true, index}) async {
  // throw message;
}

