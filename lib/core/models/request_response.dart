
import '../enums/enums.dart';

class RequestResponse<T> {

  late Status status;
  late String msg;
  late T? data;

  RequestResponse({required this.status, required this.msg, this.data});

// RequestResponse.loading() : status = Status.loading ;
//
// RequestResponse.completed(this.data) : status = Status.success ;
//
// RequestResponse.error(this.msg) : status = Status.failed;
//
// @override
// String toString(){
//   return "Status : $status \n Message : $msg \n Data: $data" ;
// }

}