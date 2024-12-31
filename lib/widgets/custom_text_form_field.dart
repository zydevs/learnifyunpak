import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension TextFormFieldStyleHelper on CustomTextFormField {
  static UnderlineInputBorder get underLineOnPrimary => UnderlineInputBorder(
        borderSide: BorderSide(
          color: thehe,
          colorScheme.onPrimary.withOpacity(1),
        ),
      );
}
