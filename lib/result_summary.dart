import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary(this.summary, {super.key});
  final Map<String, Object> summary;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(((summary['id'] as int) + 1).toString()),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (summary['question'] as String).toString(),
                  softWrap: true,
                  style: GoogleFonts.lato(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text((summary['correct-answer'] as String).toString()),
                Text((summary['user-answer'] as String).toString()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
