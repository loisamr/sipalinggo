// lib/data_lrt.dart
import 'package:flutter/material.dart';
import 'models.dart';

const List<Stasiun> stasiunLRT = [
  Stasiun(id: 'bandara', nama: 'Bandara SMD II', uv: Offset(0.07, 0.07)),
  Stasiun(id: 'asrama',  nama: 'Asrama Haji',    uv: Offset(0.18, 0.16)),
  Stasiun(id: 'punti',   nama: 'Punti Kayu',     uv: Offset(0.25, 0.25)),
  Stasiun(id: 'rsud',    nama: 'RSUD',           uv: Offset(0.33, 0.31)),
  Stasiun(id: 'garuda',  nama: 'Garuda Dempo',   uv: Offset(0.40, 0.37)),
  Stasiun(id: 'demang',  nama: 'Demang',         uv: Offset(0.28, 0.45)),
  Stasiun(id: 'bumi',    nama: 'Bumi Sriwijaya', uv: Offset(0.22, 0.52)),
  Stasiun(id: 'dishub',  nama: 'Dishub',         uv: Offset(0.34, 0.60)),
  Stasiun(id: 'cinde',   nama: 'Cinde',          uv: Offset(0.46, 0.66)),
  Stasiun(id: 'ampera',  nama: 'Ampera',         uv: Offset(0.56, 0.72)),
  Stasiun(id: 'porlest', nama: 'Porlestabes',    uv: Offset(0.68, 0.78)),
  Stasiun(id: 'jakab',   nama: 'Jakabaring',     uv: Offset(0.72, 0.86)),
  Stasiun(id: 'djka',    nama: 'DJKA',           uv: Offset(0.72, 0.94)),
];

const List<Segmen> segmenLRT = [
  Segmen(dari: 'bandara', ke: 'asrama', poly: [
    Offset(0.07, 0.07),
    Offset(0.12, 0.11),
    Offset(0.18, 0.16),
  ]),
  Segmen(dari: 'asrama', ke: 'punti', poly: [
    Offset(0.18, 0.16),
    Offset(0.21, 0.20),
    Offset(0.25, 0.25),
  ]),
  Segmen(dari: 'punti', ke: 'rsud', poly: [
    Offset(0.25, 0.25),
    Offset(0.30, 0.28),
    Offset(0.33, 0.31),
  ]),
  Segmen(dari: 'rsud', ke: 'garuda', poly: [
    Offset(0.33, 0.31),
    Offset(0.36, 0.34),
    Offset(0.40, 0.37),
  ]),
  Segmen(dari: 'garuda', ke: 'demang', poly: [
    Offset(0.40, 0.37),
    Offset(0.34, 0.43),
    Offset(0.28, 0.45),
  ]),
  Segmen(dari: 'demang', ke: 'bumi', poly: [
    Offset(0.28, 0.45),
    Offset(0.25, 0.48),
    Offset(0.22, 0.52),
  ]),
  Segmen(dari: 'bumi', ke: 'dishub', poly: [
    Offset(0.22, 0.52),
    Offset(0.28, 0.57),
    Offset(0.34, 0.60),
  ]),
  Segmen(dari: 'dishub', ke: 'cinde', poly: [
    Offset(0.34, 0.60),
    Offset(0.40, 0.63),
    Offset(0.46, 0.66),
  ]),
  Segmen(dari: 'cinde', ke: 'ampera', poly: [
    Offset(0.46, 0.66),
    Offset(0.52, 0.69),
    Offset(0.56, 0.72),
  ]),
  Segmen(dari: 'ampera', ke: 'porlest', poly: [
    Offset(0.56, 0.72),
    Offset(0.64, 0.75),
    Offset(0.68, 0.78),
  ]),
  Segmen(dari: 'porlest', ke: 'jakab', poly: [
    Offset(0.68, 0.78),
    Offset(0.70, 0.82),
    Offset(0.72, 0.86),
  ]),
  Segmen(dari: 'jakab', ke: 'djka', poly: [
    Offset(0.72, 0.86),
    Offset(0.72, 0.90),
    Offset(0.72, 0.94),
  ]),
];
