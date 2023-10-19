abstract class Failure {
  final int code;
  final String message;

  Failure({required this.code, this.message = ''});

  String getLocalizedString();
}
