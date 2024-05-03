import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/custom_textform_field/custom_textform.dart';
import '../../main.dart';

class AddHobbies extends ConsumerStatefulWidget {
  const AddHobbies({super.key});

  @override
  ConsumerState createState() => _AddHobbiesState();
}

class _AddHobbiesState extends ConsumerState<AddHobbies> {
  TextEditingController hobbies = TextEditingController();
  spac() {
    return SizedBox(
      height: h * 0.05,
    );
  }

  TemplateData? data;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: h * 0.25,
        child: Column(
          children: [
            spac(),
            CustomTextField(controller: hobbies, label: "Hobby"),
            spac(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(w * 0.1, h * 0.05)),
                onPressed: () {
                  ref.read(hobbiesDetailsProvider).add(hobbies.text.trim());
                },
                child: Text(
                  "Add Hobbies",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
