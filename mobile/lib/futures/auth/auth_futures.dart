import 'package:dio/dio.dart';
import 'package:new_one_v1/constants/urls.dart';
import 'package:new_one_v1/models/user_model.dart';

class AuthFutures {
  final dio = Dio();
  Future singUp(UserModel user) async {
    final user = {
      // 'username': 'luxx_',
      'first_name': 'Rowsen',
      'last_name': 'Meredow',
      'password': '11111111',
      'password2': '11111111',
    };

    final data = await dio.post(
      '$mainUrl$singUpUrl',
      data: user,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
  }
}
