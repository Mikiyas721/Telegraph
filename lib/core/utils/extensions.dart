import 'package:flutter/material.dart';

extension context_ext on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get cardColor => Theme.of(this).cardColor;

  Color get canvasColor => Theme.of(this).canvasColor;

  Color get accentColor => Theme.of(this).accentColor;

  Size get screenSize => MediaQuery.of(this).size;

  dynamic get arguments => ModalRoute.of(this).settings.arguments;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  bool get isPortrait {
    return MediaQuery.of(this).size.width < MediaQuery.of(this).size.height;
  }
}

extension int_ext on int {
  Duration get seconds => Duration(seconds: this);

  Duration get milliseconds => Duration(milliseconds: this);

  Widget get vSpace => SizedBox(height: this.toDouble());

  Widget get hSpace => SizedBox(width: this.toDouble());

  int min(int other) => this < other ? this : other;

  int max(int other) => this > other ? this : other;
}

extension num_ext on num {
  num trim(num min, num max) {
    return this < min ? min : this > max ? max : this;
  }
}

const colors = [
  Color(0xff39C7F7),
  Color(0xffF7BE42),
  Color(0xff39D79C),
  Color(0xffFF598C),
  Color(0xff30CC06),
  Color(0xffF7694A),
  Color(0xff00A6FF),
  Color(0xff94CB4A),
  Color(0xff31CBCE),
  Color(0xffba6aff),
  Color(0xffff6600),
];

extension string_ext on String {
  bool matchStart(String other) =>
      this.toLowerCase().startsWith(other.toString());

  Color colorize() {

    if (this == null) return colors[0];
    final sum =
        this.split('').map((c) => c.codeUnitAt(0)).reduce((a, b) => a + b);
    return colors[sum % colors.length];
  }

  String get strip {
    return this
        .replaceAll(" ", "")
        .replaceAll("-", "")
        .replaceAll("(", "")
        .replaceAll(")", "");
  }

  String get asStandardPhone {
    final s = this.strip;
    final regex = RegExp(r'^(\+2510?9|09|9)([0-9]{8})$');
    if (regex.hasMatch(s))
      return s.replaceFirstMapped(regex, (match) => '+2519${match.group(2)}');
    return s;
  }

  String get asLocalPhone {
    final s = this.strip;
    final regex = RegExp(r'^(\+2510?9|09|9)([0-9]{8})$');
    if (regex.hasMatch(s))
      return s.replaceFirstMapped(regex, (match) => '09${match.group(2)}');
    return s;
  }

  bool get isNumber {
    return double.tryParse(this) != null;
  }

  bool phoneMatches(String query) {
    return this.startsWith(query) ||
        this.asStandardPhone.startsWith(query) ||
        this.asLocalPhone.startsWith(query);
  }

  String get capitalize {
    if (this.isEmpty) return '';
    return '${this[0].toUpperCase()}${this.substring(1).toLowerCase()}';
  }

  String shorten(int max) {
    return this.length <= max ? this : '${this.substring(0, max)}...';
  }

  Text text(
      {TextStyle style,
      TextAlign textAlign,
      int maxLines,
      TextOverflow overflow}) {
    return Text(
      this,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  Widget title(double size) {
    return this.text(
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
    );
  }

  Widget get title1 => this.title(24);

  Widget get title2 => this.title(21);

  Widget get title3 => this.title(18);

  Widget get title4 => this.title(16);

  Widget image({BoxFit fit, double width, double height}) {

      return Image.asset(
        'assets/images/$this',
        fit: fit,
        width: width,
        height: height,
      );
  }


}

extension snap_ext on AsyncSnapshot {
  bool get isLoading => this.connectionState == ConnectionState.waiting;

  bool get isEmpty {
    if (!this.hasData) return true;
    if (this.data is List) return this.data.length == 0;
    return false;
  }
}

extension widget_ext on Widget {
  Widget size({double width, double height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget sizeSquare(double size) => this.size(height: size, width: size);

  Widget center() {
    return Center(
      child: this,
    );
  }

  Widget position({
    double left,
    double top,
    double right,
    double bottom,
  }) =>
      Positioned(
        child: this,
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  Widget expand({int flex = 1}) => Expanded(child: this, flex: flex);

  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  Widget contain({Color color, BoxDecoration decoration}) => Container(
        child: this,
        color: color,
        decoration: decoration,
      );

  Widget pad({EdgeInsets edgeInsets = const EdgeInsets.all(8)}) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }

  Widget padAll(double v) {
    return Padding(
      padding: EdgeInsets.all(v),
      child: this,
    );
  }

  Widget padH(double v) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: v),
      child: this,
    );
  }

  Widget padV(double v) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: v),
      child: this,
    );
  }

  Widget padSymmetric({double h = 0, double v = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
      child: this,
    );
  }

  Widget padOnly({double l = 0, double t = 0, double r = 0, double b = 0}) {
    return Padding(
      padding: EdgeInsets.only(left: l, top: t, right: r, bottom: b),
      child: this,
    );
  }

  Widget fade(double opacity) => Opacity(opacity: opacity, child: this);

  Widget get fade9 => this.fade(0.9);

  Widget get fade7 => this.fade(0.7);

  Widget get fade5 => this.fade(0.5);

  Widget get fade2 => this.fade(0.2);

  Widget get fade1 => this.fade(0.1);
}
