import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class DestroyMediaRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  DestroyMediaRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }


  Future<dynamic>  getMediaLocations (){
   return _apiClient.apiClientRequest(endPoint: kGetMediaLocationsAPI,method: 'GET');
  }
  
  Future<dynamic>  destroyMediaOnConfirmation (String body){
   return _apiClient.apiClientRequest2(endPoint: kDestroyMediaOnConfirmation,body: body,method: 'POST');
  }
}