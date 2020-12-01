part of services;

class MQTTService {
  const MQTTService();

  static MqttServerClient _client;

  void applyConfig(MQTTConfig config) {
    _client ??= MqttServerClient.withPort(
      config.host,
      config.clientIdentifier,
      config.port,
    );
  }

  Future<void> connect(MQTTConfig config) {
    return _client.connect(config.username, config.password);
  }

  void disconnect() => _client.disconnect();

  void publish({
    MQTTConfig config,
    MqttQos qos = MqttQos.exactlyOnce,
    String data,
  }) {
    final buff = Uint8Buffer(0)..addAll(data.codeUnits);
    _client.publishMessage(config.topic, qos, buff);
  }
}
