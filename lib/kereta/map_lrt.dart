// lib/widgets/lrt_map.dart
import 'package:flutter/material.dart';
import 'package:sipalinggo/kereta/lrt_pointer.dart';
import 'package:sipalinggo/kereta/models.dart';

class LrtMap extends StatelessWidget {
  final List<Stasiun> stasiun;
  final List<Segmen> segmen;
  final List<PosKereta> kereta;

  const LrtMap({
    super.key,
    required this.stasiun,
    required this.segmen,
    this.kereta = const [],
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // gunakan aspect ratio sesuai desain peta (misal 9:16)
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        // kita pakai ukuran penuh, painter menggunakan normalized coords
        return RepaintBoundary(
          child: CustomPaint(
            size: Size(width, height),
            painter: LrtPainter(
              stasiun: stasiun,
              segmen: segmen,
              kereta: kereta,
            ),
          ),
        );
      },
    );
  }
}
