
import 'package:flutter/cupertino.dart';

class Transaction{
  final String id;
  final String title;
  final String anotacao;
  final DateTime date;


  Transaction({
    required this.id,
    required this.title,
    required this.anotacao,
    required this.date,
  });
}