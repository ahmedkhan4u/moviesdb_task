

abstract class AuthBase {
  Future loginUser(String email, String password);

}

// abstract class AuthService extends AuthBase {
//
//   Future<RequestResponse> loginUser(String email, String password) async {
//     try {
//       Map<String, dynamic> formData = {"email": email, "password": password};
//       Response response = await NetworkService()
//           .getPostApiResponse(AppConfigs.loginUserUrl, formData);
//
//       final body = jsonDecode(response.body);
//
//       debugPrint(
//           "@Auth Service, Login User Response => ${response.body.toString()}");
//
//       if (response.statusCode == 200 && body["status"] == true) {
//         UserDataModel userData = userDataModelFromJson(response.body);
//         debugPrint(
//             "@Auth Service, Login User Response Status => ${userData.status}");
//         return RequestResponse(
//             status: Status.success, msg: "Login Successful", data: userData);
//       } else if (response.statusCode == 200 && body["status"] == false) {
//         return RequestResponse(
//             status: Status.failed, msg: body["message"], data: null);
//       } else {
//         return RequestResponse(
//             status: Status.failed,
//             msg: AppStrings.somethingWentWrong,
//             data: null);
//       }
//     } catch (ex) {
//       debugPrint("@Auth Service, Login User Error => ${ex.toString()}");
//       return RequestResponse(
//           status: Status.failed,
//           msg: AppStrings.somethingWentWrong,
//           data: null);
//     }
//
//     // throw UnimplementedError();
//   }
// }