import 'package:flutter/material.dart';

// colors
class DefeeColors {
  static const blue = Color(0xff002686);
  static const white = Color(0xffffffff);
  static const black = Color(0xff000000);
  static const lightBlue = Color(0xff8B8FA8);
  static const grey = Color(0xffBABABA);
  static const surfaceContainerGrey = Color(0xffeeedf5);
  static const red = Color(0xffba1a1a);
}

// sizes
class DefeeThemeSizes {
  // Border radius constants
  static const double borderRadiusValue = 20.0;
  static BorderRadiusGeometry get borderRadius =>
      BorderRadius.circular(borderRadiusValue);
  static BorderRadiusGeometry get primaryBorderRadius =>
      BorderRadius.circular(borderRadiusValue / 2);
  static BorderRadiusGeometry get chipBorderRadius =>
      BorderRadius.circular(borderRadiusValue * 2);

  static Radius get radius => Radius.circular(borderRadiusValue);

  // Padding constants
  static const double padding = 8.0;
  static EdgeInsets get thinPadding => EdgeInsets.all(padding);
  static EdgeInsets get thickPadding => EdgeInsets.all(padding * 2);

  // Margin constants
  static const double margin = 8.0;
  static EdgeInsets get marginInsets => EdgeInsets.all(margin);
}

// text styles
class DefeeTextStyles {
  static const TextStyle bodyTiny = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 10,
    color: DefeeColors.black,
  );
  static const TextStyle bodySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.black,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeColors.black,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: DefeeColors.black,
  );

  static const TextStyle onPrimarySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.white,
  );

  static const TextStyle onPrimaryMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    color: DefeeColors.white,
  );

  static const TextStyle onPrimaryLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: DefeeColors.white,
  );

  static const TextStyle onSurfaceSmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: Color(0xff1a1b21),
  );

  static const TextStyle onSurfaceMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    color: Color(0xff1a1b21),
  );

  static const TextStyle onSurfaceLarge = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 22,
    color: Color(0xff1a1b21),
  );

  static const TextStyle onSecondarySmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.white,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: DefeeColors.blue,
  );

  static const TextStyle menuMedium = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 20,
    color: DefeeColors.black,
  );

  static const TextStyle hint = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 18,
    color: DefeeColors.grey,
  );

  static const TextStyle hintSmall = TextStyle(
    fontFamily: "Pretendard",
    fontSize: 14,
    color: DefeeColors.surfaceContainerGrey,
  );
}

// themes
class AppTheme {
  static ThemeData lightTheme = themeData(lightColorScheme);

  static ThemeData themeData(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: TextTheme(
        bodySmall: DefeeTextStyles.bodySmall,
        bodyMedium: DefeeTextStyles.bodyMedium,
        bodyLarge: DefeeTextStyles.bodyLarge,
        titleMedium: DefeeTextStyles.titleMedium,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surfaceContainer,
        titleTextStyle: DefeeTextStyles.titleMedium,
      ),
      scaffoldBackgroundColor: colorScheme.surface,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        splashColor: colorScheme.primary,
        hoverColor: colorScheme.primary,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: DefeeThemeSizes.radius,
          ),
        ),
        modalBackgroundColor: colorScheme.surface,
        modalBarrierColor: colorScheme.surfaceDim,
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: DefeeThemeSizes.borderRadius,
        ),
        barrierColor: colorScheme.surfaceDim,
        backgroundColor: colorScheme.surface,
        titleTextStyle: DefeeTextStyles.bodyMedium,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          overlayColor: colorScheme.secondary,
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }

  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    textTheme: TextTheme(
      bodySmall: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 14,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 18,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontFamily: "Pretendard",
        fontSize: 22,
        color: Colors.white,
      ),
    ),
  );

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: DefeeColors.blue,
    onPrimary: DefeeColors.white,
    secondary: DefeeColors.lightBlue,
    onSecondary: DefeeColors.white,
    secondaryContainer: Color(0xffd1d8ff),
    onSecondaryContainer: Color(0xff384165),
    surface: Color(0xfffbf8ff),
    surfaceContainer: Color(0xffeeedf5),
    onSurface: Color(0xff1a1b21),
    error: DefeeColors.red,
    onError: DefeeColors.white,
    surfaceDim: Color(0x44121319),
    outline: Color(0xff757683),
    outlineVariant: Color(0xffc5c5d4),
    brightness: Brightness.light,
  );
}
