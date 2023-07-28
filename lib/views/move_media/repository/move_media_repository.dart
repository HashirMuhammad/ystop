import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class MoveMediaRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  MoveMediaRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }

  Future<dynamic>  moveMediaScanQRCode (){
   return _apiClient.apiClientRequest(endPoint: kMoveMediaScanQrCodeAPI,method: 'GET');
  }

  Future<dynamic>  getMediaLocations (){
   return _apiClient.apiClientRequest(endPoint: kGetMediaLocationsAPI,method: 'GET');
  }
  
  Future<dynamic>  moveMediaSubmitBtnApi (String body){
   return _apiClient.apiClientRequest2(endPoint: kMoveMediaOnSubmitBtnAPI,body: body,method: 'POST');
  }
  
  
}