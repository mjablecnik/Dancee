import 'package:dancee_design/dancee_design.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PageLayout extends StatelessWidget {
  const PageLayout({super.key, required this.title, required this.child, this.style});

  final String title;
  final Widget child;
  final PageLayoutStyle? style;

  Widget backButton(BuildContext context) {
    if (!Navigator.canPop(context)) return SizedBox.shrink();

    return GestureDetector(onTap: Navigator.of(context).pop, child: Icon(CupertinoIcons.chevron_left, size: 22));
  }

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        shadowColor: DesignColors.grey500,
        toolbarHeight: currentStyle.toolbarHeight,
        backgroundColor: currentStyle.headerColor,
        leading: backButton(context),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontFamily: AppFonts.inter,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: Container(color: currentStyle.backgroundColor, child: child),
    );
  }
}
