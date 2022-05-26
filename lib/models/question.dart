import 'package:flutter/material.dart';

class Question {
  final String question;
  final answers;

  const Question({required this.question, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(question: json['content'], answers: json['answers']);
  }
}
