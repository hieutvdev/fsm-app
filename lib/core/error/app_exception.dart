class AppException implements Exception {
  final String message;
  final String? prefix;
  final dynamic error;

  AppException([this.message = '', this.error, this.prefix]);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message, dynamic error])
      : super(message ?? 'Error During Communication', 'Fetch Data Error: ',
            error);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, dynamic error])
      : super(message ?? 'Invalid Request', 'Bad Request: ', error);
}

class UnauthorizedException extends AppException {
  UnauthorizedException([String? message, dynamic error])
      : super(message ?? 'Unauthorized', 'Unauthorized: ', error);
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message, dynamic error])
      : super(message ?? 'Invalid Input', 'Invalid Input: ', error);
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message, dynamic error])
      : super(message ?? 'Forbidden', 'Forbidden: ', error);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, dynamic error])
      : super(message ?? 'Not Found', 'Not Found: ', error);
}

class ConflictException extends AppException {
  ConflictException([String? message, dynamic error])
      : super(message ?? 'Conflict', 'Conflict: ', error);
}

class InternalServerException extends AppException {
  InternalServerException([String? message, dynamic error])
      : super(message ?? 'Internal Server Error', 'Internal Server Error: ',
            error);
}

