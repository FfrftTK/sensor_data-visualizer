part of services;

class MQTTService {
  const MQTTService({
    @required this.serverUrl,
    this.clientIdentifier = '',
    this.port = 1883,
  });

  static MqttServerClient _client;

  final String serverUrl;
  final String clientIdentifier;
  final int port;

  void init() {
    _client ??= MqttServerClient.withPort(serverUrl, clientIdentifier, port);
  }

  Future<void> connect([String username, String password]) {
    return _client.connect(username, password);
  }

  void disconnect() => _client.disconnect();

  void publish({
    String topic = '',
    MqttQos qos = MqttQos.exactlyOnce,
    String data,
  }) {
    final buff = Uint8Buffer(0)..addAll(data.codeUnits);
    _client.publishMessage(topic, qos, buff);
  }
}
