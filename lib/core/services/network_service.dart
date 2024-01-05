import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'app_exceptions.dart';

abstract class NetworkBase {
  Future getGetApiResponse(String url);

  Future getPostApiResponse(String url, dynamic data);
}

class NetworkService extends NetworkBase {
  @override
  Future<http.Response> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url)).timeout(
        const Duration(seconds: 10),
        onTimeout: () => http.Response("Error", 408),
      );
      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future<http.Response> getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(Uri.parse(url),
          encoding: Encoding.getByName('utf-8'),
          body: data,
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/x-www-form-urlencoded"
          })
          .timeout(
        const Duration(seconds: 20),
        onTimeout: () => http.Response("Error", 408),
      );

      responseJson = response;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }

// dynamic returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//       dynamic responseJson = jsonDecode(response.body);
//       return responseJson;
//
//     case 201:
//       dynamic responseJson = jsonDecode(response.body);
//       return responseJson;
//
//     case 400:
//       throw BadRequestException(response.body.toString());
//
//     case 500:
//     case 404:
//       throw UnauthorisedException(response.body.toString());
//     default:
//       throw FetchDataException(
//           'Error occured while communicating with server' +
//               'with status code' +
//               response.statusCode.toString());
//   }
// }
}
