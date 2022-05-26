import 'package:flutter/material.dart';

// file nay khong lien quan den man tai ve

class Question {
  final String question;
  final answers;

  const Question({required this.question, required this.answers});

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(question: json['content'], answers: json['answers']);
  }
}
