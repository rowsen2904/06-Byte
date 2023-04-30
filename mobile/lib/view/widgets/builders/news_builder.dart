import 'package:flutter/material.dart';
import 'package:new_one_v1/view/widgets/news_widget.dart';

class NewsBuilder extends StatelessWidget {
  const NewsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsWidget();
      },
    );
  }
}
