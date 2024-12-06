abstract class Failures {
  final String message;

  Failures({required this.message});
}

class ServerFailuer extends Failures {
  ServerFailuer({required super.message});
}
