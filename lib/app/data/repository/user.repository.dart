import 'package:dio/dio.dart';
import 'package:sib_torsh_task/app/data/model/user.dart';
import 'package:sib_torsh_task/app/data/source/api.dart';
import 'package:sib_torsh_task/app/data/string.dart';

class UserRepository {
  static Future<Response> getUsers() async {
    var uri = "$baseUrl/users?page=1";
    Response response = await API.get(uri);
    return response;
  }

  static Future<Response> createUser(User user) async {
    var uri = "$baseUrl/users";

    Map<String, dynamic> body = user.toJson();

    Response response = await API.post(uri, body);
    return response;
  }
}
