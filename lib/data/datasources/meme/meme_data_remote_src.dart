import 'package:src_core_bloc/core/util/api_url.dart';
import 'package:src_core_bloc/core/util/helper.dart';
import 'package:src_core_bloc/core/util/request_handler.dart';
import 'package:src_core_bloc/data/models/dioParam.dart';
import 'package:src_core_bloc/data/models/meme/meme.dart';
import '../../../core/util/enum.dart';

abstract class IMemeRemoteDataSource {
  Future<List<MemeModel>> getMemes();
}

class MemeRemoteDataSource extends IMemeRemoteDataSource {
  @override
  Future<List<MemeModel>> getMemes() {
    return handleRemoteRequest(() async {
      final response = await Helper().call(DioParams(
          HttpMethod.GET, 
          endpoint: APIUrl.getMemes, 
          needAuthrorize: false
        )
      );
      return (response['data']['memes'] as List<dynamic>)
          .map((e) => MemeModel.fromJson(e as Map<String, dynamic>))
          .toList();
    });
  }
}
