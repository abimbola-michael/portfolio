// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:portfolio/extensions.dart';
import 'package:portfolio/utils/colors.dart';

import '../models/models.dart';

class SkillsCard extends StatelessWidget {
  final Skill skill;
  const SkillsCard({
    Key? key,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          skill.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          children: List.generate(skill.names.length, (index) {
            return Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                  color: accentColor, borderRadius: BorderRadius.circular(15)),
              child: Text(skill.names[index]),
            );
          }),
        )
      ],
    );
  }
}
