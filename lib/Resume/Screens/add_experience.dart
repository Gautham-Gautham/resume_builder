import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Core/custom_textform_field/custom_textform.dart';
import '../../main.dart';

class AddExperience extends ConsumerStatefulWidget {
  const AddExperience({super.key});

  @override
  ConsumerState createState() => _AddExperienceState();
}

class _AddExperienceState extends ConsumerState<AddExperience> {
  TextEditingController description = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController period = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController place = TextEditingController();

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
        height: h * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              spac(),
              CustomTextField(controller: title, label: "Title"),
              spac(),
              CustomTextField(controller: location, label: "Location"),
              spac(),
              CustomTextField(controller: period, label: "Period"),
              spac(),
              CustomTextField(controller: place, label: "Place"),
              spac(),
              CustomTextField(controller: description, label: "Description"),
              spac(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      minimumSize: Size(w * 0.1, h * 0.05)),
                  onPressed: () {
                    ExperienceData data = ExperienceData(
                        experienceTitle: title.text.trim(),
                        experiencePlace: place.text.trim(),
                        experiencePeriod: period.text.trim(),
                        experienceLocation: location.text.trim(),
                        experienceDescription: description.text.trim());
                    ref.read(experienceDetailsProvider).add(data);
                  },
                  child: Text(
                    "Add Experiance",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
