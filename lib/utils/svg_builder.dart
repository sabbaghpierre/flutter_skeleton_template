import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgBuilder extends StatelessWidget {
  final Color? color;
  final String? assetName;
  final VoidCallback? onTap;
  final double? size;

  const SvgBuilder({
    Key? key,
    this.color,
    this.assetName,
    this.onTap,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/icons/$assetName',
        color: color,
        height: size,
      ),
    );
  }
}
