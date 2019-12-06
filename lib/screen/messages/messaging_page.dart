import 'package:flutter/material.dart';
import 'package:inkapharma/widget/messaging_widget.dart';

class MessagingPage extends StatelessWidget {

  static const String id = 'messaging_page';
  @override
  Widget build(BuildContext context) => Scaffold(
    body: MessagingWidget(),
  );
}