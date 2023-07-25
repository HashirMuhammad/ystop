import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class ReceiveMediaRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  ReceiveMediaRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }

  Future<dynamic>  receiveMedia ( Map<String, dynamic> body){
   return _apiClient.apiClientRequest(endPoint: kReceiveMediaAPI, body: body,method: 'POST');
  }




 Future<dynamic>  getMediaLocations (){
   return _apiClient.apiClientRequest(endPoint: kVerifyMediaAPI,method: 'GET');
  }
  
Future<dynamic>  getMediaFile (){
   return _apiClient.apiClientRequest(endPoint: kGetMediaFileAPI,method: 'GET');
  }
}