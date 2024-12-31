class AppExceptions implements Exception {
  final  _message;
  final  _prefix;

  AppExceptions([this._message,this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

class InternetException extends AppExceptions {
  InternetException([String? msg]):super(msg,"No Internet Connection");
}
class RequestTimeOut extends AppExceptions {
  RequestTimeOut([String? message]) : super(message, "Request Time Out");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super(message, "Internal Server Error");
}

class InvalidUrlException extends AppExceptions {
  InvalidUrlException([String? message]) : super(message, "Wrong Url");
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]): super(message, "Unable to Communicate");
}

class UnauthorizedException extends AppExceptions {
  UnauthorizedException([String? message]): super(message, "You don't have access to this");
}