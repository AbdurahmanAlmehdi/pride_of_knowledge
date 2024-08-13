// Registration Exceptions

class EmailAlreadyInUseAuthException implements Exception {}

class WeakPasswordAuthException implements Exception {}

class InvalidEmailAuthException implements Exception {}

// Login Exceptions

class UserNotFoundAuthException implements Exception {}

class WrongPasswordAuthException implements Exception {}

//Generic Exceptions

class GenericAuthException implements Exception {}

class UserNotLoggedInException implements Exception {}
