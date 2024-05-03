import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/custom_textform_field/custom_textform.dart';
import '../../main.dart';

class AddEducations extends ConsumerStatefulWidget {
  const AddEducations({super.key});

  @override
  ConsumerState createState() => _AddEducationsState();
}

class _AddEducationsState extends ConsumerState<AddEducations> {
  TextEditingController degree = TextEditingController();
  TextEditingController degree1 = TextEditingController();
  TextEditingController university = TextEditingController();
  TextEditingController university1 = TextEditingController();
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
        height: h * 0.6,
        child: SingleChildScrollView(
          child: Column(
            children: [
              spac(),
              CustomTextField(controller: degree, label: "School Level"),
              spac(),
              CustomTextField(controller: university, label: "School Name"),
              spac(),
              CustomTextField(controller: degree1, label: "Degree Level"),
              spac(),
              CustomTextField(controller: university1, label: "University"),
              spac(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(w * 0.1, h * 0.05)),
                  onPressed: () {
                    Education data =
                        Education(degree.text.trim(), university.text.trim());
                    Education dada1 =
                        Education(degree1.text.trim(), university1.text.trim());
                    List<Education> res = [];
                    res.add(data);
                    res.add(dada1);
                    ref.read(educationDetailsProvider).addAll(res);
                  },
                  child: Text(
                    "Add Education",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
