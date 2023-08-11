// // ignore_for_file: prefer_const_constructors, prefer_single_quotes
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:ystop_mystop/core/app/colors.dart';
// import 'package:ystop_mystop/views/fragments/selected_job_list.dart';

// import '../../core/app/styles.dart';
// import '../../core/app/svg.dart';
// import '../../core/app/texts.dart';
// import '../../core/providers/job_list_provider.dart';

// class JobListFragment extends ConsumerStatefulWidget {
//   const JobListFragment({super.key});

//   @override
//   ConsumerState<JobListFragment> createState() => _JobListFragmentState();
// }

// class _JobListFragmentState extends ConsumerState<JobListFragment> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   @override
//   Widget build(BuildContext context) {
//  //   final Size size = MediaQuery.of(context).size;
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         key: _scaffoldKey,
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           backgroundColor: AppColors.primaryWhite,
//           leading: InkWell(
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//             child: Icon(
//               Icons.arrow_back_ios,
//               size: 22,
//               color: AppColors.primaryBlackColor,
//             ),
//           ),
//           elevation: 0,
//           title: Text(
//             AppTexts.jobList,
//             style: AppStyles.jobListHeadingStyle,
//           ),
//           centerTitle: true,
//           bottom: TabBar(
//             indicatorColor: AppColors.mainThemeColor,
//             labelStyle: AppStyles.jobListTextStyle,
//             labelColor: AppColors.primaryBlackColor,
//             indicatorWeight: 3.0,
//             tabs: [
//               Tab(
//                 text: "Current(3)",
//               ),
//               Tab(
//                 text: "Completed(5)",
//               ),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             _buildCurrentTab(),
//             _buildCompletedTab(),
//           ],
//         ),
//       ),
//     );
//   }

//   _buildCurrentTab() {
//     final Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         _buildSearchFieldCurrent(context),
//         _buildCurrentBuilder(size),
//       ],
//     );
//   }

//   _buildCompletedTab() {
//     final Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         _buildSearchFieldCompleted(context),
//         _buildCompletedBuilder(size),
//       ],
//     );
//   }

//   _buildCurrentBuilder(Size size) {
//     return Flexible(
//       fit: FlexFit.loose,
//       flex: 1,
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: 3,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.of(context).push<void>(
//                       CupertinoPageRoute<void>(
//                           builder: (BuildContext context) =>
//                               const SelectedJobList()),
//                     );
//                   },
//                   child: SizedBox(
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               "Main Job title",
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                             Spacer(),
//                             Row(
//                               children: [
//                                 SvgPicture.asset(
//                                   AppSvg.jobListInProgressSvg,
//                                   width: 12.5,
//                                   height: 12.5,
//                                 ),
//                                 SizedBox(
//                                   width: size.width * 0.007,
//                                 ),
//                                 Text(
//                                   "In progress",
//                                   style: AppStyles.jobListTextStyleGreen,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: size.height * 0.015,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               AppTexts.jobListCouncilName,
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                             Text(
//                               "Abc def",
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               AppTexts.jobListCampaignDate,
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                             Text(
//                               "20-Dec-2022 to 29-dec-2022",
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: size.height * 0.01,
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               AppTexts.jobListJobStatus,
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                             Text(
//                               "23 / 80",
//                               style: AppStyles.jobListTextStyle,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   _buildCompletedBuilder(Size size) {
//     return Flexible(
//       fit: FlexFit.loose,
//       flex: 1,
//       child: ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: 3,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: size.height * 0.05,
//                 ),
//                 SizedBox(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Text(
//                             "Main Job title",
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                           Spacer(),
//                           SvgPicture.asset(
//                             AppSvg.jobListCompletedSvg,
//                             width: 12.5,
//                             height: 12.5,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: size.height * 0.015,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppTexts.jobListCouncilName,
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                           Text(
//                             "Abc def",
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: size.height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppTexts.jobListCampaignDate,
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                           Text(
//                             "20-Dec-2022 to 29-dec-2022",
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: size.height * 0.01,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             AppTexts.jobListJobStatus,
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                           Text(
//                             "23 / 80",
//                             style: AppStyles.jobListTextStyle,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

//   _buildSearchFieldCurrent(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width * 0.08,
//             top: MediaQuery.of(context).size.height * 0.02,
//             right: MediaQuery.of(context).size.width * 0.08,
//           ),
//           child: TextFormField(
//             controller: ref.watch(jobListProvider).currentSearchController,
//             decoration: InputDecoration(
//               label: const Text(AppTexts.jobListSearch),
//               labelStyle: AppStyles.jobListTextStyleGrey,
//               floatingLabelStyle: AppStyles.jobListTextStyleGrey,
//               border: InputBorder.none,
//               suffixIcon: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: SvgPicture.asset(
//                   AppSvg.homeSearchSvg,
//                   height: 20,
//                   width: 20,
//                 ),
//               ),
//               isDense: true,
//             ),
//             cursorColor: AppColors.mainThemeColor,
//           ),
//         );
//       },
//     );
//   }

//   _buildSearchFieldCompleted(BuildContext context) {
//     return Consumer(
//       builder: (BuildContext context, WidgetRef ref, Widget? child) {
//         return Padding(
//           padding: EdgeInsets.only(
//             left: MediaQuery.of(context).size.width * 0.08,
//             top: MediaQuery.of(context).size.height * 0.02,
//             right: MediaQuery.of(context).size.width * 0.08,
//           ),
//           child: TextFormField(
//             controller: ref.watch(jobListProvider).completedSearchController,
//             decoration: InputDecoration(
//               label: const Text(AppTexts.jobListSearch),
//               labelStyle: AppStyles.jobListTextStyleGrey,
//               floatingLabelStyle: AppStyles.jobListTextStyleGrey,
//               border: InputBorder.none,
//               suffixIcon: Padding(
//                 padding: const EdgeInsets.all(14.0),
//                 child: SvgPicture.asset(
//                   AppSvg.homeSearchSvg,
//                   height: 20,
//                   width: 20,
//                 ),
//               ),
//               isDense: true,
//             ),
//             cursorColor: AppColors.mainThemeColor,
//           ),
//         );
//       },
//     );
//   }
// }
