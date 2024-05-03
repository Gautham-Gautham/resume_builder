import 'package:flutter/material.dart';
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
  TextEditingController university = TextEditingController();
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
            CustomTextField(controller: degree, label: "Degree"),
            spac(),
            CustomTextField(controller: university, label: "University"),
            spac(),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: Size(w * 0.1, h * 0.05)),
                onPressed: () {},
                child: Text(
                  "Add Education",
                  style: GoogleFonts.poppins(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
