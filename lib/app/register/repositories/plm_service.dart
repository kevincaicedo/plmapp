import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:plmapp/utils/http_client.dart';
import 'package:plmapp/app/register/models/user.dart';

abstract class PlmServiceAbstract {
  Future<Response> postUser(User params);
}

class PlmService implements PlmServiceAbstract {
  static const USER_POST = "/test/users";
  final HttpClient client;

  const PlmService({@required this.client});

  @override
  Future<Response> postUser(User params) async {
    return await client.post(USER_POST, params.toJson());
  }
}
