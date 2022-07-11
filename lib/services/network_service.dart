import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'network_exception.dart';

class NetworkService {
  static Future<dynamic> httpGetRequest(String url, Map<String, String> headers) async {
    final request = http.MultipartRequest('GET', Uri.parse(url));
    request.headers.addAll(headers);
    final http.StreamedResponse response = await request.send();
    dynamic responseJson;
    debugPrint('response status code is ${response.statusCode}');
    try {
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    }
  }

  static Future<dynamic> httpPostRequest(String url, Map<String, String> headers, Map<String, String> body,
      {List<http.MultipartFile>? files}) async {
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields.addAll(body);
    request.files.addAll(files ?? []);
    request.headers.addAll(headers);
    final http.StreamedResponse response = await request.send();
    dynamic responseJson;
    debugPrint('response status code is ${response.statusCode}');
    try {
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    }
  }

  static Future<dynamic> httpPutRequest(String url, Map<String,String> headers, Map<String,String> body,
      {List<http.MultipartFile>? files}) async{
      final request = http.MultipartRequest('PUT', Uri.parse(url));
    request.fields.addAll(body);
    request.files.addAll(files ?? []);
    request.headers.addAll(headers);
    final http.StreamedResponse response = await request.send();
    dynamic responseJson;
    debugPrint('response status code is ${response.statusCode}');
    try {
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    }
  }

    static Future<dynamic> httpDeleteRequest(String url, Map<String,String> headers, Map<String,String> body,
      {List<http.MultipartFile>? files}) async{
      final request = http.MultipartRequest('DELETE', Uri.parse(url));
    request.fields.addAll(body);
    request.files.addAll(files ?? []);
    request.headers.addAll(headers);
    final http.StreamedResponse response = await request.send();
    dynamic responseJson;
    debugPrint('response status code is ${response.statusCode}');
    try {
      responseJson = _returnResponse(response);
      return responseJson;
    } on SocketException {
      throw NoInternetException();
    }
  }

  static dynamic _returnResponse(http.StreamedResponse response) async {
    switch (response.statusCode) {
      case 200:
        final data = await response.stream.bytesToString();
        final decodedData = jsonDecode(data);
        return decodedData;
      case 201:
        final data = await response.stream.bytesToString();
        final decodedData = jsonDecode(data);
        return decodedData;
      case 400:
        throw BadRequestException();
              case 403:
        throw UnauthorizedException('Forbidden');
      case 404:
        throw NotFoundException('Not Found');

      case 500:
        throw InternalServerError('Internal Server Error');
      default:
        throw FetchDataException('An unknown error has occured');
    }
  }
}
