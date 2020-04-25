import 'package:flutter/foundation.dart';
import 'package:plmapp/app/register/models/user.dart';
import 'package:plmapp/app/register/repositories/plm_service.dart';

abstract class RegisterRepository {
  Future<bool> saveUser(User params);
}

class RegisterRepositoryImpl implements RegisterRepository {
  final PlmService plmService;

  const RegisterRepositoryImpl({@required this.plmService});

  @override
  Future<bool> saveUser(User params) async {
    final resp = await plmService.postUser(params);
    return (resp != null && resp.statusCode == 200);
  }
}
