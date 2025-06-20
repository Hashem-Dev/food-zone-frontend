import 'package:food_zone/exports.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({super.key, required this.body, this.appBarTitle = ''});

  final Widget body;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: GradientAppbarTitle(title: appBarTitle)),
      body: body,
    );
  }
}
