part of pages;

class AccelerometerConfigPage extends HookWidget {
  const AccelerometerConfigPage();

  static const routeName = '${AccelerometerPage.routeName}/config';

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(accelerometerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('MQTT Config')),
      body: Container(
        padding: EdgeInsets.all(Get.width * 0.025),
        alignment: Alignment.center,
        child: ReactiveFormBuilder(
          form: controller.buildMqttConfigForm,
          builder: (context, form, child) => ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 6,
                    child: ReactiveTextField(
                      formControlName:
                          EnumToString.convertToString(MQTTConfigForm.host),
                      validationMessages: (control) => {
                        'number': 'The port number must be number',
                        'max': 'The port number must be in 0 to 65535',
                        'min': 'The port number must be in 0 to 65535',
                      },
                      decoration: const InputDecoration(
                        labelText: 'Host',
                        prefixIcon: Icon(Icons.cloud_outlined),
                        hintText: 'test.mosquitto.org',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: ReactiveTextField(
                      formControlName:
                          EnumToString.convertToString(MQTTConfigForm.port),
                      validationMessages: (control) => {
                        'number': 'The port number must be number',
                        'max': 'The port number must be in 0 to 65535',
                        'min': 'The port number must be in 0 to 65535',
                      },
                      decoration: const InputDecoration(
                        labelText: 'Port',
                        prefixIcon: Icon(Icons.sensor_door_outlined),
                        hintText: '1883',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              ReactiveTextField(
                formControlName:
                    EnumToString.convertToString(MQTTConfigForm.username),
                validationMessages: (control) => {},
                decoration: const InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              ReactiveTextField(
                formControlName:
                    EnumToString.convertToString(MQTTConfigForm.password),
                validationMessages: (control) => {},
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.vpn_key_outlined),
                  border: OutlineInputBorder(),
                ),
              ),
              ReactiveTextField(
                formControlName:
                    EnumToString.convertToString(MQTTConfigForm.topic),
                validationMessages: (control) => {},
                decoration: const InputDecoration(
                  labelText: 'Topic',
                  prefixIcon: Icon(Icons.topic_outlined),
                  hintText: 'test',
                  border: OutlineInputBorder(),
                ),
              ),
              ReactiveTextField(
                formControlName: EnumToString.convertToString(
                    MQTTConfigForm.clientIdentifier),
                validationMessages: (control) => {},
                decoration: const InputDecoration(
                  labelText: 'Client Identifier',
                  prefixIcon: Icon(Icons.tablet_android_rounded),
                  hintText: 'sensor_data_visualizer',
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: Get.height * 0.05),
                child: RaisedButton(
                  child: const Text('Save'),
                  onPressed: () async {
                    if (form.valid) {
                      controller.updateMqttConfig(form.value);
                      await controller.saveMqttConfigInLocal();
                      Get.back();
                    } else {
                      form.markAllAsTouched();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
