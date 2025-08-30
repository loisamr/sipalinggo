// lib/widgets/lrt_painter.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sipalinggo/kereta/models.dart';

class LrtPainter extends CustomPainter {
  final List<Stasiun> stasiun;
  final List<Segmen> segmen;
  final List<PosKereta> kereta;

  LrtPainter({required this.stasiun, required this.segmen, this.kereta = const []});

  Offset _toPx(Offset uv, Size size) => Offset(uv.dx * size.width, uv.dy * size.height);

  @override
  void paint(Canvas canvas, Size size) {
    // background optional
    final bg = Paint()..color = const Color(0xFFE6F3FA);
    canvas.drawRect(Offset.zero & size, bg);

    // draw thick route (dark blue)
    final routePaint = Paint()
      ..color = const Color(0xFF0B4A87)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.05
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // draw route segments
    for (final s in segmen) {
      final pts = s.poly.map((u) => _toPx(u, size)).toList();
      if (pts.length < 2) continue;
      final path = Path()..moveTo(pts.first.dx, pts.first.dy);
      for (int i = 1; i < pts.length; i++) path.lineTo(pts[i].dx, pts[i].dy);
      canvas.drawPath(path, routePaint);
    }

    // draw thinner highlight (optional) to emulate inner lighter edge
    final innerPaint = Paint()
      ..color = const Color(0xFF1C6FB3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.shortestSide * 0.028
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    for (final s in segmen) {
      final pts = s.poly.map((u) => _toPx(u, size)).toList();
      if (pts.length < 2) continue;
      final path = Path()..moveTo(pts.first.dx, pts.first.dy);
      for (int i = 1; i < pts.length; i++) path.lineTo(pts[i].dx, pts[i].dy);
      canvas.drawPath(path, innerPaint);
    }

    // draw station nodes
    final nodeFill = Paint()..color = Colors.white;
    final nodeStroke = Paint()..color = const Color(0xFF0B4A87)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final r = size.shortestSide * 0.018;
    for (final s in stasiun) {
      final p = _toPx(s.uv, size);
      canvas.drawCircle(p, r, nodeFill);
      canvas.drawCircle(p, r, nodeStroke);
    }

    // draw labels (using TextPainter)
    for (final s in stasiun) {
      final p = _toPx(s.uv, size);
      final tp = TextPainter(
        text: TextSpan(
          text: s.nama,
          style: TextStyle(
            fontSize: size.shortestSide * 0.032,
            color: const Color(0xFF86B3D0),
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout(maxWidth: size.width * 0.45);
      // paint label a bit to the right and centered vertically
      tp.paint(canvas, p + Offset(r + 8, -tp.height / 2));
    }

    // draw trains
    final trainPaint = Paint()..color = const Color(0xFF298DCC);
    for (final k in kereta) {
      final seg = segmen.firstWhere((s) => s.dari == k.dari && s.ke == k.ke,
          orElse: () => segmen.first);
      final pos = _pointOnPolylinePx(seg.poly, k.t.clamp(0.0, 1.0), size);
      canvas.drawCircle(pos, r * 0.9, trainPaint);
    }
  }

  // helper to find position on polyline (pixel coords)
  Offset _pointOnPolylinePx(List<Offset> uvPoly, double t, Size size) {
    final pts = uvPoly.map((u) => _toPx(u, size)).toList();
    if (pts.length == 1) return pts.first;
    // total length
    final lengths = <double>[];
    double total = 0;
    for (int i = 0; i < pts.length - 1; i++) {
      final l = (pts[i + 1] - pts[i]).distance;
      lengths.add(l);
      total += l;
    }
    if (total <= 0) return pts.first;
    double target = t * total, acc = 0;
    for (int i = 0; i < lengths.length; i++) {
      if (acc + lengths[i] >= target) {
        final localT = (target - acc) / lengths[i];
        return Offset.lerp(pts[i], pts[i + 1], localT)!;
      }
      acc += lengths[i];
    }
    return pts.last;
  }

  @override
  bool shouldRepaint(covariant LrtPainter oldDelegate) {
    // repaint when kereta list changes OR if geometry changes.
    return oldDelegate.kereta != kereta || oldDelegate.stasiun != stasiun || oldDelegate.segmen != segmen;
  }
}
