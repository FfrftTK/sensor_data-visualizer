part of services;

class MQTTService {
  const MQTTService({
    @required this.serverUrl,
    this.clientIdentifier = '',
    this.port = 1883,
  });

  static MqttBrowserClient _client;

  final String serverUrl;
  final String clientIdentifier;
  final int port;

  void init() {
//    _client ??= MqttBrowserClient(serverUrl, clientIdentifier)..port = port;
  }

  Future<void> connect([String username, String password]) {
//    _client.connect(username, password);
  }
}
