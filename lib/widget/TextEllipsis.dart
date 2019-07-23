import 'package:flutter/material.dart';

class TextEllipsis extends Text {
  TextEllipsis( String data,{Key key,int maxLines, TextStyle style})
      : super(data,
            key: key,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            style: style);
}
