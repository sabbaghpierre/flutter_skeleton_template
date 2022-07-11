class NetworkException implements Exception {
  String? message;
  String? prefix;
  NetworkException([this.message, this.prefix]);

  @override
  String toString() {
    return '$prefix $message';
  }
}

class FetchDataException extends NetworkException {
  FetchDataException([String? message]) : super(message, 'Error during communication');
}

class BadRequestException extends NetworkException {
  BadRequestException([String? message]) : super(message, 'Bad Request');
}

class UnauthorizedException extends NetworkException {
  UnauthorizedException([String? message]) : super(message, 'Unauthorized');
}

class InternalServerError extends NetworkException {
  InternalServerError([String? message]) : super(message, 'The server seems down');
}

class AccountAlreadyExists extends NetworkException {
  AccountAlreadyExists([String? message]) : super(message, 'Account already found.');
}

class UnverifiedAccount extends NetworkException {
  UnverifiedAccount([String? message]) : super(message, 'Unverified account');
}

class NoContentException extends NetworkException {
  NoContentException([String? message]) : super(message, 'No Content');
}

class NoInternetException extends NetworkException {
  NoInternetException([String? message]) : super(message, 'No Internet Connection');
}

class NotFoundException extends NetworkException {
  NotFoundException([String? message]) : super(message, 'Not Found');
}

class NoUsersFound extends NetworkException {
  NoUsersFound([String? message]) : super(message, 'No users found.');
}
