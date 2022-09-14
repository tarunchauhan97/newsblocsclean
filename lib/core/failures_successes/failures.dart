abstract class Failure {
  final String message;

  const Failure({required this.message});
}

class FetchFailure extends Failure {
  const FetchFailure({required String message}) : super(message: message);
}
