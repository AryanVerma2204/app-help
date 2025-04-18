import 'package:flutter/material.dart';
import 'package:mental_health_app/utils/colors.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalettes.whiteColor,
      body: SafeArea(child: Center(child: Text("Comming Soon"))),
    );
  }
}
