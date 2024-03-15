import 'package:noviindus_machine_test/data/network/network_api_services.dart';
import 'package:noviindus_machine_test/data/response/api_response.dart';

import '../../res/app_url/app_url.dart';

class LoginRepository {
  final _apiservice = NetworkApiServices();
  Future<dynamic> loginApi(var data) async {
    dynamic response = _apiservice.postApi(data, AppUrl.loginApi);
    return response;
  }
}
