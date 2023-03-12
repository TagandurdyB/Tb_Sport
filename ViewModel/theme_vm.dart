import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Providers/provider_theme.dart';

class MyTheme {
  static ThemeData theme(BuildContext context) {
    final providerTheme = DistributorTheme(context);
    return ThemeData(
      textTheme: const TextTheme(
        bodyMedium: TextStyle(),
      ).apply(
        bodyColor: providerTheme.colors.text,
        // displayColor: Colors.blue,
      ),
      primarySwatch: Colors.blue,
      canvasColor: providerTheme.colors.canvas,
      appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: providerTheme.brightness),
          color: providerTheme.colors.appBar,
          shadowColor: Colors.transparent,
          titleTextStyle: providerTheme.styles.appBar,
          iconTheme:  IconThemeData(
            color: DistributorTheme(context).colors.appBarIcon,
          )),
    );
  }
}
