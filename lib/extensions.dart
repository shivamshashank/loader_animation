import 'dart:ui';

extension CustomPath on double {
  Path _generatePath(int x, int y) {
    Size size = Size(this, this);

    final double sw = size.width;
    final double sh = size.height;

    final int mirrorX = x == 1 ? 3 : 1;
    final int mirrorY = y == 1 ? 3 : 1;

    Path path = Path();

    path.moveTo(sw / 2, sh / 2);
    path.lineTo(x * sw / 4, y * sh / 4);

    for (int i = 0; i < 2; i++) {
      path.arcToPoint(
        Offset(mirrorX * sw / 4, mirrorY * sh / 4),
        radius: Radius.circular(this / 4),
      );
      path.arcToPoint(
        Offset(x * sw / 4, y * sh / 4),
        radius: Radius.circular(this / 4),
      );
    }

    path.lineTo(sw / 2, sh / 2);

    return path;
  }

  List<Path> pathsList() {
    final List<(int, int)> pathCoordinates = [(1, 1), (3, 1), (3, 3), (1, 3)];

    final List<Path> list = [];

    for ((int, int) element in pathCoordinates) {
      list.add(
        _generatePath(element.$1, element.$2),
      );
    }

    return list;
  }
}
