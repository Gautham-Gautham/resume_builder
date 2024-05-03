import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Core/custom_textform_field/custom_textform.dart';
import 'package:resume_builder/Resume/Screens/add_educations.dart';
import 'package:resume_builder/Resume/Screens/add_experience.dart';
import 'package:resume_builder/Resume/Screens/add_hobbies.dart';
import 'package:resume_builder/Resume/Screens/add_skills.dart';
import 'package:resume_builder/main.dart';

class CreateResume extends ConsumerStatefulWidget {
  const CreateResume({super.key});

  @override
  ConsumerState createState() => _CreateResumeState();
}

class _CreateResumeState extends ConsumerState<CreateResume> {
  TextEditingController name = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController country = TextEditingController();
  spac() {
    return SizedBox(
      height: h * 0.05,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: SafeArea(
          child: Scaffold(
        body: SizedBox(
          height: h,
          width: w,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                spac(),
                CircleAvatar(
                  radius: w * 0.2,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Name",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: bio,
                  maxLines: 7,
                  label: "Bio",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: designation,
                  label: "Designation",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: email,
                  label: "Email",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: ph,
                  label: "Phone No",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: address,
                  label: "Address",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: street,
                  label: "Street",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: country,
                  label: "Country",
                  width: w * 0.8,
                ),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddSkills(),
                      );
                    },
                    child: Text(
                      "Add Skills",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddEducations(),
                      );
                    },
                    child: Text(
                      "Add Education",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddExperience(),
                      );
                    },
                    child: Text(
                      "Add Experience",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AddHobbies(),
                      );
                    },
                    child: Text(
                      "Add Hobby",
                      style: GoogleFonts.poppins(color: Colors.white),
                    )),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {},
                    child: Text(
                      "Create Resume",
                      style: GoogleFonts.poppins(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                spac(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
