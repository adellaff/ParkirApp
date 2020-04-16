import 'package:dio/dio.dart';
import 'package:parkir_app/models/user.dart';
// import 'package:parkir_app/screens/admin_bottom_tab.dart';
// import 'package:parkir_app/screens/petugas_bottom_tab.dart';

class AuthService {
  final String url = "http://192.168.43.122:3000/login";
  final Dio dio = Dio();
  var id;

  loginUser(User user) async {
    try {
      Response response = await dio.post(url, data: {
        'username': user.username,
        'password': user.password,
      });
      if (response.statusCode != 200) {
        throw 'Error';
      } else {
        dio.interceptors
            .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
          var customHeaders = {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${response.data['token']}',
          };
          options.headers.addAll(customHeaders);
          return options;
        }));
        
        id = response.data['user']['id_user'];
        
        return response.data;
      }
    } catch (error) {
      print(error);
    }
  }

  // getRole(User user) async {
  //   try {
  //     Response response = await dio.get("http://192.168.43.122:3000/role/$id");
  //     print(response);
  //     print(response.data);
  //     print(response.statusCode);
  //     // print(json.decode(jsonEncode(response.data)));

  //     return response;
  //   } catch (e) {
  //     return e;
  //   }
  // }
}
