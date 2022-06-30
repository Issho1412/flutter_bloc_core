import 'package:dartz/dartz.dart';
import 'package:src_core_bloc/core/util/request_handler.dart';
import 'package:src_core_bloc/data/datasources/meme/meme_data_remote_src.dart';
import '../../../core/connection/networkInfo.dart';
import '../../features/error/server_failture.dart';

abstract class IMemeRepository {
  Future<Either<Failure, dynamic>> getMemes();
}

class MemeRepository extends IMemeRepository {
  final NetworkInfo _networkInfo = NetworkInfo();
  final IMemeRemoteDataSource _remoteDataSource = MemeRemoteDataSource();

  @override
  Future<Either<Failure, dynamic>> getMemes() {
    return handleRepositoryCall(_networkInfo, onRemote: () async {
      return Right(await _remoteDataSource.getMemes());
    }, onLocal: () async {
      return const Left(ServerFailure('network_error'));
    });
  }
}
