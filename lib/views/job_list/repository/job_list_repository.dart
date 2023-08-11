import '../../../api/api_client.dart';
import '../../../api/api_endpoints.dart';

class JobListRepository{

  late ApiClient _apiClient;
  Map<String, dynamic> environment;

  JobListRepository(this.environment){
   _apiClient = ApiClient(environment: environment);
  }

/// current job list
  Future<dynamic>  getAllCurrentJobList (){
   return _apiClient.apiClientRequest(endPoint: kGetAllCurrentJobList,method: 'GET');
  }

  /// get job list by status

 Future<dynamic>  getAllJobListByStatus (){
   return _apiClient.apiClientRequest(endPoint: kGetAllJobListByStatus,method: 'GET');
  }


  /// get Single job list

 Future<dynamic>  getSingleJobList (int id){
   return _apiClient.apiClientRequest(endPoint: '/api/jobLists/$id$kGetSingleJobListById',method: 'GET');
  }
}