// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';

import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CreatorDetailView extends StatelessWidget {
  final Creator creator;

  const CreatorDetailView({
    super.key,
    required this.creator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AColors.white,
        title: Text(
          creator.name,
          style: ATextTheme.appBarTitle,
        ),
      ),
    );
  }
}
