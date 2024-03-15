class AppException implements Exception {
  final String message;
  final String prefix;

  AppException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class InternetException extends AppException {
  InternetException([String? message]) : super(message!, 'No internet: ');
}

class ServerException extends AppException {
  ServerException([String? message]) : super(message!, 'Server error: ');
}

class RequestTimeoutException extends AppException {
  RequestTimeoutException([String? message])
      : super(message!, 'Request timeout: ');
}
class InvalidUrlException extends AppException {
  InvalidUrlException([String? message]) : super(message!, 'Invalid URL: ');
}
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message!, 'Fetch data error: ');
}

