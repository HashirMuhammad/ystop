import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ystop_mystop/core/app/colors.dart';
import 'package:ystop_mystop/core/app/styles.dart';
import 'package:ystop_mystop/core/app/texts.dart';
import 'package:ystop_mystop/core/widgets/custom_appbar.dart';

import '../controller/posting_media_controller.dart';
import 'job_list_id_page.dart';

class PostingMediaListingPage extends GetView<PostingMediaController> {
  const PostingMediaListingPage({super.key});

  @override
  Widget build(BuildContext context) {

  Widget verticalSpace = SizedBox(height: 13,);

    return Scaffold(
      appBar: CustomAppBar(context: context, title: AppTexts.postingMedia),
      body: LayoutBuilder(
        builder: (context,constraints){
          return Padding(
          padding: const EdgeInsets.symmetric(horizontal : 20),
          child: Column(
            children: [
                            SizedBox(height: constraints.maxHeight * 0.02,),
               Expanded(child: _postingMediaListing(size: Size(constraints.maxWidth, constraints.maxHeight),verticalSpace: verticalSpace))
            ],
          ) ,
        );
        },
  
      ),
    ); 
  }


  Widget horizontalRow({required String title , required String descripion}){
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(title,style: AppStyles.jobListTextStyle,),
            const SizedBox(width: 20,),
            Expanded(child: Align(
              alignment: Alignment.topRight,
              child: Text(descripion,style: AppStyles.jobListTextStyle,))),

                ],
              );
  }

  Widget _postingMediaListing({required Size size ,required Widget verticalSpace}){
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context,index){
       return Padding(
         padding: const EdgeInsets.symmetric(vertical: 16),
         child: InkWell(
          onTap: (){
            Get.to(JoblistIDPage());
          },
           child: Container(
              color: AppColors.blueColor.withOpacity(0.01),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      horizontalRow(title: "Van Registration No",descripion: "STL-2023"),
                      verticalSpace,
                      horizontalRow(title: "Posting Date",descripion: "28-Dec-2022"),
                      verticalSpace,
                      Text("Job List Details",style: AppStyles.textStyleCustom,),
                      verticalSpace,
                      horizontalRow(title: "Joblist ID",descripion: "012 235 789"),
                      verticalSpace,
                      horizontalRow(title: "Council",descripion: "abc def ghi"),
                      verticalSpace,
                      horizontalRow(title: "Total Posting",descripion: "15"),
                   //   SizedBox(height: 30,),
                    ],
                  ),
             ),
           ),
         ),
       );
    });
  }
}