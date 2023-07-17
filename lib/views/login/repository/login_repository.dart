import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class LoginRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  LoginRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }

  Future<dynamic>  login ( Map<String, dynamic> body){
   return _apiClient.apiClientRequest(endPoint: kLoginAPI, body: body,method: 'POST');
  }
  
}