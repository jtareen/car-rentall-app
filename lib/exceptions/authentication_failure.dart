
class AuthenticationFailure {
  final String message;

  const AuthenticationFailure([this.message = "An unknown error occurred"]);

  factory AuthenticationFailure.code(String code) {
    switch (code){
      case 'network-request-failed':
        return const AuthenticationFailure('Make sure you are connected to network');
      case 'email-already-in-use':
        return const AuthenticationFailure("The account already exists for that email.");
      case 'invalid-email':
        return const AuthenticationFailure("The email address is not valid.");
      case 'weak-password':
        return const AuthenticationFailure("The password provided is too weak.");
      case 'invalid-credential':
        return const AuthenticationFailure('Provided Email and Password do not match. Please provide valid credentials.');
      case 'user-disabled':
        return const AuthenticationFailure("This user has been disabled");
      case 'operation-not-allowed':
        return const AuthenticationFailure("Operation is not allowed");
      default:
        return const AuthenticationFailure();
    }
  }
}