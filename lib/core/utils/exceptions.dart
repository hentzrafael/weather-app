abstract class CustomExceptions implements Exception {
  String message;

  CustomExceptions(this.message);

  @override
  String toString() {
    return message;
  }
}

//403 - Login
class CredentialsException extends CustomExceptions {
  CredentialsException(super.message);
}

//400
class BadRequestException extends CustomExceptions {
  BadRequestException(super.message);
}

//404
class NotFoundException extends CustomExceptions {
  NotFoundException(super.message);
}

//403
class ForbiddenException extends CustomExceptions {
  ForbiddenException(super.message);
}

//409
class ConflictException extends CustomExceptions {
  ConflictException(super.message);
}

//500
class ServerException extends CustomExceptions {
  ServerException(super.message);
}

class GenericException extends CustomExceptions {
  GenericException(super.message);
}

class UnknownException extends CustomExceptions {
  UnknownException(super.message);
}