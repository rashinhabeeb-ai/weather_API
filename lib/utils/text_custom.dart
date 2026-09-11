import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppText extends StatelessWidget {
  String? data;
  double? size;
  Color? color;
  FontWeight? fw;
  TextAlign? align;
   AppText({Key? key, required this.data,
     this.size, this.align=TextAlign.left,
     this.color, this.fw});

  @override
  Widget build(BuildContext context) {
    return Text(
      data.toString(),
      textAlign: align,
      style: TextStyle(fontSize: size,color: color,fontWeight: fw),
    );
  }
}
