// lib/models.dart
import 'package:flutter/material.dart';

class Stasiun {
  final String id;
  final String nama;
  final Offset uv; // normalized 0..1 coordinate
  const Stasiun({required this.id, required this.nama, required this.uv});
}

class Segmen {
  final String dari; // id stasiun awal
  final String ke;   // id stasiun tujuan
  final List<Offset> poly; // list of normalized points (0..1)
  const Segmen({required this.dari, required this.ke, required this.poly});
}

class PosKereta {
  final String id;
  final String dari;
  final String ke;
  final double t; // progress 0..1
  const PosKereta({required this.id, required this.dari, required this.ke, required this.t});
}
