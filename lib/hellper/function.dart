import 'dart:ui';

TextStyle? TextStyle_(
    {int fontSize = 10, Color color = const Color.fromARGB(255, 70, 69, 69)}) {
  return TextStyle(
    fontSize: fontSize.toDouble(),
    fontFamily: 'Al-Jazeera',
    fontWeight: FontWeight.normal,
    color: color,
  );
}
