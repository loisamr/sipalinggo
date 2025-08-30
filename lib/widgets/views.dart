import 'package:flutter/material.dart';

textView(margin, text, posisi, warna, tebal, ukuran) {
  return Container(
    margin: margin,
    child: Text(
      text,
      textAlign: posisi,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: warna,
        fontWeight: tebal,
        fontSize: ukuran,
      ),
    ),
  );
}
