import 'package:flutter/material.dart';

class Field extends TextField {
  Field({
    Key? key,
    required void Function(String) onChanged,
    required String hintText,
  }) : super(
          key: key,
          onChanged: onChanged,
          decoration: InputDecoration(hintText: hintText),
        );
}
