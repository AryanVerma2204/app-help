import 'dart:ui';

class FeelingModel {
  final String name;
  final String iconPath;
  final Color color;

  FeelingModel(
      {required this.name, required this.iconPath, required this.color});

  FeelingModel copyWith({bool? isSelected}) {
    return FeelingModel(
      name: name,
      iconPath: iconPath,
      color: color,
    );
  }
}
