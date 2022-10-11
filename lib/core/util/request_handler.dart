import 'dart:developer';

import 'package:src_core_bloc/core/const.dart';
import 'package:src_core_bloc/core/util/enum.dart';
import '../../features/error/server_exception.dart';
import '../../features/error/server_failture.dart';
import '../connection/networkInfo.dart';
import 'package:dartz/dartz.dart';

import 'snackbar.dart';

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
    int index = sErrorNeedLogOut.indexOf(l.message);
    handleError(l.message, shouldUseDefaultError: shouldUseDefaultError ?? true, index: index);
    if (sErrorNeedLogOut.contains(l.message)) {
      // Get.offAllNamed(OptionScreen.router);
    }
    log(l.message, name: 'EITHER ERROR');
    if (onError != null) {
      onError(l.message);
    }
  }, onResult);
}

handleEitherReturn<B, T extends Failure, S>(Either<T, S> either, B Function(S r) onResult, {Function()? onError}) {
  return either.fold((l) {
    int index = sErrorNeedLogOut.indexOf(l.message);
    handleError(l.message, shouldUseDefaultError: true, index: index);

    if (sErrorNeedLogOut.contains(l.message)) {
      // Helper().navigateTo(otpRoute);
    }
    log(l.message, name: 'EITHER ERROR');
    if (onError != null) {
      onError();
    }
  }, onResult);
}

Future handleError(String message, {bool shouldUseDefaultError = true, int index = -1}) async {
  // throw message;
  String msg = message;
  if (message.split('DioError').length > 1 || message.split('Timeout').length > 1) {
    msg = 'timeout';
  }
  showSnackBar(
    msg, SnackType.fail
  );
}


