import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Core/custom_textform_field/custom_textform.dart';

import '../../main.dart';

class AddSkills extends ConsumerStatefulWidget {
  const AddSkills({super.key});

  @override
  ConsumerState createState() => _AddSkillsState();
}

class _AddSkillsState extends ConsumerState<AddSkills> {
  TextEditingController skill = TextEditingController();
  TextEditingController star = TextEditingController();
  spac() {
    return SizedBox(
      height: h * 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: h * 0.4,
        child: Column(
          children: [
            spac(),
            CustomTextField(controller: skill, label: "Skills"),
            spac(),
            CustomTextField(
                keyboardType: TextInputType.number,
                controller: star,
                label: "Level"),
            spac(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(w * 0.1, h * 0.05)),
                onPressed: () {
                  Language data =
                      Language(skill.text.trim(), int.parse(star.text.trim()));
                  ref.read(skillDetailsProvider).add(data);
                },
                child: Text(
                  "Add Skills",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
