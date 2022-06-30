import 'package:src_core_bloc/core/util/api_url.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/util/request_handler.dart';
import 'package:src_core_bloc/data/models/dioParam.dart';
import 'package:src_core_bloc/data/models/meme/meme.dart';
import '../../../core/util/enum.dart';

abstract class IMemeRemoteDataSource {
  Future<MemeModel> getMemes();
}

class MemeRemoteDataSource extends IMemeRemoteDataSource {
  @override
  Future<MemeModel> getMemes() {
    return handleRemoteRequest(() async {
      final response = await Helper().call(DioParams(
          HttpMethod.GET, 
          endpoint: APIUrl.getMemes, 
          needAuthrorize: false
        )
      );
      return MemeModel.fromJson(response['data']);
    });
  }
}
