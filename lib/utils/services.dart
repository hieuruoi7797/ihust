import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:ihust/config.dart';

Map<String, String> userHeader = {
  "Content-type": "application/json",
  "Accept": "application/json"
};
enum ErrorType { serverError, unknowError }

class AppServices {
  String action;
  Map<String, dynamic> body;
  bool superAPI;
  AppServices({@required this.action, @required this.body, this.superAPI})
      : super();
  var client = http.Client();
  Future<APIResult> post() async {
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    String url =
        "http://set-hust.appspot/api?username=xxx&password=yyy&sessionid=zzz";
    // if(superAPI != null && superAPI) {
    //   url = baseURL2;
    // }
    print('$url$action');
    return client
        .post(
          url + action,
          body: json.encode(body),
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        )
        .timeout((const Duration(seconds: 30)))
        .then((response) {
          final int statusCode = response.statusCode;
          var endTime = new DateTime.now().millisecondsSinceEpoch;
          print("hoan thanh $action trong: " +
              (endTime - startTime).toString() +
              "ms");
          if (statusCode == 200) {
            // print("Server tra ve: ${json.decode(response.body)}");
            return APISuccess(data: json.decode(response.body));
          } else {
            print("statusCode $statusCode");
            return APIError(type: ErrorType.serverError, statusCode: -1);
          }
        })
        .catchError((err) {
          print("services error: " + err.toString());
          return APIError(type: ErrorType.unknowError, statusCode: -1);
        });
  }

  Future<APIResult> get() async {
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    print(Config.BASE_URL + action);
    return client
        .get(
          Config.BASE_URL + action,
          headers: {HttpHeaders.contentTypeHeader: "application/json"},
        )
        .timeout((const Duration(seconds: 10)))
        .then((response) {
          final int statusCode = response.statusCode;
          var endTime = new DateTime.now().millisecondsSinceEpoch;
          print("hoan thanh $action trong: " +
              (endTime - startTime).toString() +
              "ms");
          if (statusCode == 200) {
            // print(json.decode(response.body));
            Map<String, dynamic> body = json.decode(response.body);
            if (body['status'] == -1) {
              return APIError(
                  type: ErrorType.serverError,
                  statusCode: -1,
                  description: body['data']);
            } else if (body['status'] == 0) {
              return APIError(
                  type: ErrorType.serverError,
                  statusCode: body['status'],
                  description: body['data']);
            }
            return APISuccess(data: json.decode(response.body));
          } else {
            print("statusCode $statusCode");
            return APIError(type: ErrorType.serverError, statusCode: -1);
          }
        })
        .catchError((err) {
          print("services error" + err.toString());
          return APIError(type: ErrorType.unknowError, statusCode: -1);
        });
  }
}

class APIResult extends Equatable {
  APIResult([List props = const []]) : super();
  @override
  List<Object> get props => [];
  @override
  String toString() {
    return 'AppServiceResult';
  }
}

class APISuccess extends APIResult {
  final Map<String, dynamic> data;
  APISuccess({this.data}) : super([data]);
  @override
  String toString() {
    return 'APISuccess + $data';
  }
}

class APIError extends APIResult {
  final ErrorType type;
  final int statusCode;
  final String description;
  APIError({this.type, this.statusCode, this.description})
      : super([type, statusCode, description]);
  @override
  String toString() {
    return 'APIError: ' +
        this.statusCode.toString() +
        " type: " +
        this.type.toString();
  }
}
