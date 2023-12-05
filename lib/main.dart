import 'package:flutter/material.dart';

import 'homescreen.dart';
import 'invoice.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Homescreen(),
        'invoice' : (context) => InvoiceGenerator(),
      },
    ),
  );
}