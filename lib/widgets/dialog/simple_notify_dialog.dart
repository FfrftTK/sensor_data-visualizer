part of widgets;

// Simple Text form with no validation
class SimpleNotifyDialog extends StatelessWidget {
  const SimpleNotifyDialog({
    this.titleText = '',
    this.contentText = '',
    this.submitText = 'OK',
  });
  final String titleText;
  final String contentText;
  final String submitText;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(titleText),
      content: Column(
        children: <Widget>[
          Text(
            contentText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(submitText),
          onPressed: Get.back,
        ),
      ],
    );
  }
}
