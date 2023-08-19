import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/views/job_list/repository/job_list_repository.dart';
import '../../../core/app/snackbar.dart';
import '../../../core/app/texts.dart';
import '../model/get_all_current_job_list_model.dart';
import '../model/get_job_list_by_status_model.dart';
import '../model/get_single_job_list.dart';



enum JobListLoadingType { parent, hide }

class JobListController extends GetxController with CurrentJobListInitializer, CompletedJobListInitializer,SelectedJobList,JobDetail,SelectPigeonHoleSheet , SelectedMediaSheet{


  @override
  void onInit() {
    Map<String, dynamic> environment = {
      //'environment': 'dev',
      'base_url': 'https://assets-dev.ystop.com.au',
    };

    _jobListRepository = JobListRepository(environment);
    initAPI();
    super.onInit();
  }


  void initAPI() async{

  await getAllJobList();
  await getJobListByStatus();

  }

  @override
  Future<void> getAllJobList() async{
      isLoading.value = JobListLoadingType.parent;
    try {
      dynamic response = await _jobListRepository.getAllCurrentJobList();
      if(response !=null){
        getAllCurrentJobListModel = GetAllCurrentJobList.fromJson(response);
        print(getAllCurrentJobListModel.toJson());
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = JobListLoadingType.hide;
   }

 return Future<void>.value(null);
  }

  @override
  Future<void> getJobListByStatus() async{
      isLoading.value = JobListLoadingType.parent;
    try {
      dynamic response = await _jobListRepository.getAllJobListByStatus();
      if(response !=null){
        getJobListByStatusModel = GetJobListByStatus.fromJson(response);
        print(getJobListByStatusModel.toJson());
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = JobListLoadingType.hide;
   }

 return Future<void>.value(null);
  }
  
  @override
  Future<void> getSingleJobList(int id) async{
       isLoading.value = JobListLoadingType.parent;
    try { 
      dynamic response = await _jobListRepository.getSingleJobList(id);
      if(response !=null){
        getSingleJobListModel = GetSingleJobList.fromJson(response);
        print(getSingleJobListModel.toJson());
      } 
      else{
        CustomSnackbar.showError(AppTexts.someThingWentWrong);
      }
    } catch (e) {
      CustomSnackbar.showError(e.toString());

      e.toString();
    }
   finally{
    isLoading.value = JobListLoadingType.hide;
   }

 return Future<void>.value();
  }
  
  @override
  Future<void> getMediaLocaions(int id) {
    return Future<void>.value();
  }


}


mixin CurrentJobListInitializer{


 final Rx<JobListLoadingType> isLoading =
      JobListLoadingType.hide.obs;


TextEditingController curentJobListSearchEditingController = TextEditingController();

/// get job list
 Future<void> getAllJobList();





GetAllCurrentJobList getAllCurrentJobListModel = GetAllCurrentJobList();

 late JobListRepository _jobListRepository;
}

mixin CompletedJobListInitializer{

TextEditingController completedJobListSearchEditingController = TextEditingController();


/// get job list by status

 Future<void> getJobListByStatus();


 /// model
 GetJobListByStatus getJobListByStatusModel = GetJobListByStatus();

}


mixin SelectedJobList{
TextEditingController selectedJobTitleSearchEditingController = TextEditingController();



/// get single job list
 Future<void> getSingleJobList(int id);

/// model

GetSingleJobList getSingleJobListModel = GetSingleJobList();

}

mixin JobDetail{
  
RxBool onTapJobDetail = false.obs;
RxInt selectedIndex = RxInt(-1);

/// get single job list
 Future<void> getMediaLocaions(int id);
}


mixin SelectPigeonHoleSheet{

}
  
mixin SelectedMediaSheet{
 
 RxInt radioBtnValue = 2.obs; 

}