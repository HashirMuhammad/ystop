import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class ReceiveMediaRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  ReceiveMediaRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }

  Future<dynamic>  receiveMediaSubmit ( String body){
   return _apiClient.apiClientRequest2(endPoint: kReceiveMediaOnSubmitBtnAPI, body: body,method: 'POST');
  }




 Future<dynamic>  getMediaLocations (){
   return _apiClient.apiClientRequest(endPoint: kGetMediaLocationsAPI,method: 'GET');
  }
  
Future<dynamic>  getMediaFile (){
   return _apiClient.apiClientRequest(endPoint: kGetReceiveMediaFileAPI,method: 'GET');
  }
}