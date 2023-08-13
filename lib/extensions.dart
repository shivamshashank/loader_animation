import 'dart:ui';

extension CustomPath on double {
  List<Path> pathsList() {
    Size size = Size(this, this);

    /// Path1
    Path path1 = Path();
    path1.moveTo(size.width / 2, size.height / 2);
    path1.lineTo(size.width / 4, size.height / 4);
    path1.arcToPoint(
      Offset(3 * size.width / 4, 3 * size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path1.arcToPoint(
      Offset(size.width / 4, size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path1.lineTo(size.width / 2, size.height / 2);

    /// Path2
    Path path2 = Path();
    path2.moveTo(size.width / 2, size.height / 2);
    path2.lineTo(3 * size.width / 4, size.height / 4);
    path2.arcToPoint(
      Offset(size.width / 4, 3 * size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path2.arcToPoint(
      Offset(3 * size.width / 4, size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path2.lineTo(size.width / 2, size.height / 2);

    /// Path3
    Path path3 = Path();
    path3.moveTo(size.width / 2, size.height / 2);
    path3.lineTo(3 * size.width / 4, 3 * size.height / 4);
    path3.arcToPoint(
      Offset(size.width / 4, size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path3.arcToPoint(
      Offset(3 * size.width / 4, 3 * size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path3.lineTo(size.width / 2, size.height / 2);

    /// Path4
    Path path4 = Path();
    path4.moveTo(size.width / 2, size.height / 2);
    path4.lineTo(size.width / 4, 3 * size.height / 4);
    path4.arcToPoint(
      Offset(3 * size.width / 4, size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path4.arcToPoint(
      Offset(size.width / 4, 3 * size.height / 4),
      radius: Radius.circular(this / 4),
    );
    path4.lineTo(size.width / 2, size.height / 2);

    return [path1, path2, path3, path4];
  }
}
