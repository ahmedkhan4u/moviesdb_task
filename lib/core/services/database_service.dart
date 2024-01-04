import 'package:flutter/material.dart';

abstract class DBBase {
  // Future<RequestResponse> getTimeTableData(BuildContext context);

}

abstract class DatabaseService extends DBBase {

  // @override
  // Future<RequestResponse> getTimeTableData(BuildContext context) async {
  //   try {
  //     UserDataList user =
  //     Provider.of<UserDataProvider>(context, listen: false).userData[0];
  //
  //     Map<String, dynamic> formData = {
  //       "user_id": user.userId,
  //       "token": user.token,
  //       "session_id": user.sessionId
  //     };
  //
  //     debugPrint("Form Data => $formData");
  //
  //     Response response = await NetworkService()
  //         .getPostApiResponse(AppConfigs.getTimeTableUrl, formData);
  //
  //     final body = jsonDecode(response.body);
  //
  //     debugPrint(
  //         "@Database Service, Get Time Table Data Response => ${response.body.toString()}");
  //
  //     if (response.statusCode == 200 && response.body.isNotEmpty) {
  //
  //       if (body is Map) {
  //         if (body.containsKey("message") && body["message"] == "Unauthorized") {
  //           return RequestResponse(
  //               status: Status.failed,
  //               msg: "Unauthorized",
  //               data: []);
  //         }
  //       }
  //
  //       List<TimeTableModel> timeTableData =
  //       timeTableModelFromJson(response.body);
  //       debugPrint(
  //           "@Database Service, Get Time Table Data Response Length => ${timeTableData.length}");
  //
  //       return RequestResponse(
  //           status: Status.success,
  //           msg: "Time table data fetched successfully",
  //           data: timeTableData);
  //     } else if (response.statusCode == 200 && body["status"] == false) {
  //       return RequestResponse(
  //           status: Status.failed, msg: body["message"], data: []);
  //     } else {
  //       return RequestResponse(
  //           status: Status.failed,
  //           msg: AppStrings.somethingWentWrong,
  //           data: []);
  //     }
  //   } catch (ex) {
  //     debugPrint(
  //         "@Database Service, Get Time Table Data Error => ${ex.toString()}");
  //     return RequestResponse(
  //         status: Status.failed, msg: AppStrings.somethingWentWrong, data: []);
  //   }
  // }
}

