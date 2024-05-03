import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/Core/custom_textform_field/custom_textform.dart';
import 'package:resume_builder/main.dart';

class CreateResume extends ConsumerStatefulWidget {
  const CreateResume({super.key});

  @override
  ConsumerState createState() => _CreateResumeState();
}

class _CreateResumeState extends ConsumerState<CreateResume> {
  TextEditingController name = TextEditingController();
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
                  controller: name,
                  maxLines: 7,
                  label: "Bio",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Designation",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Email",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Phone No",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Address",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Street",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  controller: name,
                  label: "Country",
                  width: w * 0.8,
                ),
                spac(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize: Size(w * 0.1, h * 0.05)),
                    onPressed: () {},
                    child: Text(
                      "Add Skills",
                      style: GoogleFonts.poppins(color: Colors.white),
                    ))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
