import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:noviindus_machine_test/data/app_exceptions.dart';
import 'package:noviindus_machine_test/data/network/base_api_service.dart';

class NetworkApiServices extends BaseApiService {
  @override
  Future<dynamic> getApi(String url) async {
    try {
      // Check if the provided URL is valid
      if (!Uri.parse(url).isAbsolute) {
        throw InvalidUrlException('Invalid URL: $url');
      }

      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      return _handleResponse(response);
    } on SocketException catch (e) {
      throw InternetException('Failed to connect to the server: $e');
    } on TimeoutException catch (e) {
      throw RequestTimeoutException('Request timed out: $e');
    } on InvalidUrlException catch (e) {
      throw e; // Re-throw the InvalidUrlException
    } catch (e) {
      throw FetchDataException('Failed to fetch data: $e');
    }
  }

  dynamic _handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      case 404:
        throw InternetException('Not found: ${response.reasonPhrase}');
      case 500:
        throw ServerException(
            'Internal server error: ${response.reasonPhrase}');
      // Add more cases for other status codes as needed
      default:
        throw InternetException(
            'Failed to load data: ${response.statusCode} - ${response.reasonPhrase}');
    }
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    try {
      if (kDebugMode) {
        print('Debug mode is enabled. Posting data to: $url $data');
      }

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {
          'Content-Type': 'application/json',
          // Add other headers if needed
        },
      ).timeout(const Duration(seconds: 10));

      return _handleResponse(response);
    } on SocketException catch (e) {
      throw InternetException('Failed to connect to the server: $e');
    } on TimeoutException catch (e) {
      throw RequestTimeoutException('Request timed out: $e');
    } catch (e) {
      throw FetchDataException('Failed to post data: $e');
    }
  }
}
