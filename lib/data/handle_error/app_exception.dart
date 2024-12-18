class AppException implements Exception{

  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return 'AppException{_message: $_message, _prefix: $_prefix}';
  }
}
class BadRequestException extends AppException{
  BadRequestException(String message)
      : super('Your request model is not right.', message);
}
class FetchDataException extends AppException {

  FetchDataException([String? message]) : super(message,'Error During Communication');
}

class UnauthorisedException extends AppException {

  UnauthorisedException([String? message]) : super(message,'Unauthorised request');
}


class InvalidInputException extends AppException {

  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}


class NoInternetException extends AppException {

  NoInternetException([String? message]) : super(message,'No Internet Connection');
}