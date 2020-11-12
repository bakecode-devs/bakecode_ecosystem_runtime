import 'package:bakecode/bakecode.dart';
import 'package:meta/meta.dart';

@immutable
class ServiceMessage {
  /// The source service of the message.
  final ServiceReference source;

  /// Recipient services of the message.
  final List<ServiceReference> destinations;

  /// The message as string.
  final String message;

  const ServiceMessage({
    @required this.source,
    @required this.destinations,
    @required this.message,
  })  : assert(source != null),
        assert(destinations != null),
        assert(message != null);

  factory ServiceMessage.broadcast({
    @required ServiceReference source,
    @required String message,
  }) =>
      ServiceMessage(
        source: source,
        destinations: [BroadcastService().reference],
        message: message,
      );

  @override
  String toString() => """
  {
    "source": "$source",
    "destinations": $destinations,
    "message": "$message",
  }
  """;
}