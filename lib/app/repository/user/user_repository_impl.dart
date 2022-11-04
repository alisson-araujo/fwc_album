import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fwc_album/app/core/exceptions/repository_exception.dart';
import 'package:fwc_album/app/core/rest/custom_dio.dart';
import 'package:fwc_album/app/models/user_model.dart';
import 'package:fwc_album/app/repository/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final CustomDio dio;
  UserRepositoryImpl({required this.dio});

  @override
  Future<UserModel> getMe() async {
    try {
      final result = await dio.auth().get('api/me');
      return UserModel.fromMap(result.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar dados do usuário', error: e, stackTrace: s);
      throw RepositoryExceptions(message: 'Erro ao buscar dados do usuário');
    }
  }
}
