import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:resume_builder/Core/custom_snackbar.dart';
import 'package:resume_builder/Core/custom_textform_field/custom_textform.dart';
import 'package:resume_builder/Features/resume_screen.dart';
import 'package:resume_builder/Resume/Screens/add_educations.dart';
import 'package:resume_builder/Resume/Screens/add_experience.dart';
import 'package:resume_builder/Resume/Screens/add_hobbies.dart';
import 'package:resume_builder/Resume/Screens/add_skills.dart';
import 'package:resume_builder/main.dart';

import '../../Core/simple_snackbar.dart';

class CreateResume extends ConsumerStatefulWidget {
  const CreateResume({super.key});

  @override
  ConsumerState createState() => _CreateResumeState();
}

final imageProvider = StateProvider<File?>((ref) => null);

class _CreateResumeState extends ConsumerState<CreateResume> {
  TextEditingController name = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController ph = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController country = TextEditingController();
  final picker = ImagePicker();
  spac() {
    return SizedBox(
      height: h * 0.05,
    );
  }

  String downloadImageUrl = '';
  Future<void> _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      ref
          .watch(imageProvider.notifier)
          .update((state) => File(pickedFile.path));
      showSnackBarDialogue(context, 'Uploading File.......');
      var uploadTask = FirebaseStorage.instance
          .ref('images/image-${DateTime.now()}')
          .putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      downloadImageUrl = await snapshot.ref.getDownloadURL();

      showSnackBarDialogue(context, 'Uploaded Successfully...');

      setState(() {});
    }
    Navigator.of(context).pop();
  }

  Future<void> _showImagePickerDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Choose an option"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: getImageFromGallery,
                  child: const Text("Gallery"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: _getImageFromCamera,
                  child: const Text("Camera"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ref
          .watch(imageProvider.notifier)
          .update((state) => File(pickedFile.path));
      showSnackBarDialogue(context, 'Uploading File.......');
      var uploadTask = FirebaseStorage.instance
          .ref('images/image-${DateTime.now()}')
          .putFile(File(pickedFile.path));
      final snapshot = await uploadTask.whenComplete(() {});
      downloadImageUrl = await snapshot.ref.getDownloadURL();

      showSnackBarDialogue(context, 'Uploaded Successfully...');

      setState(() {});
    }
    Navigator.of(context).pop();
  }

  String noUserImage =
      "https://static.vecteezy.com/system/resources/previews/018/765/757/original/user-profile-icon-in-flat-style-member-avatar-illustration-on-isolated-background-human-permission-sign-business-concept-vector.jpg";
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
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage: downloadImageUrl == ""
                          ? NetworkImage(noUserImage)
                          : NetworkImage(downloadImageUrl),
                      radius: w * 0.2,
                    ),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: _showImagePickerDialog,
                          child: Icon(
                            Icons.camera_alt_outlined,
                            size: w * 0.1,
                          ),
                        ))
                  ],
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
                  keyboardType: TextInputType.emailAddress,
                  controller: email,
                  label: "Email",
                  width: w * 0.8,
                ),
                spac(),
                CustomTextField(
                  keyboardType: TextInputType.phone,
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
                ref.watch(skillDetailsProvider).isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.8,
                            height: h * 0.1,
                            child: Center(
                              child: ListView.builder(
                                itemCount:
                                    ref.watch(skillDetailsProvider).length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      // right: w * 0.2,
                                      left: w * 0.1,
                                      bottom: w * 0.04),
                                  child: Text(
                                    ref
                                        .watch(skillDetailsProvider)[index]
                                        .language,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                              ))
                        ],
                      )
                    : ElevatedButton(
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
                ref.watch(educationDetailsProvider).isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.8,
                            height: h * 0.1,
                            child: Center(
                              child: ListView.builder(
                                itemCount:
                                    ref.watch(educationDetailsProvider).length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.1, bottom: w * 0.04),
                                  child: Text(
                                    ref
                                        .watch(educationDetailsProvider)[index]
                                        .schoolName,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.01,
                          ),
                          Container(
                            width: w * 0.4,
                            height: h * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.orange.shade100,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                                child: Text(
                              "Add Education",
                              style: GoogleFonts.poppins(color: Colors.white),
                            )),
                          )
                        ],
                      )
                    : ElevatedButton(
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
                ref.watch(experienceDetailsProvider).isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.8,
                            height: h * 0.1,
                            child: Center(
                              child: ListView.builder(
                                itemCount:
                                    ref.watch(experienceDetailsProvider).length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.1, bottom: w * 0.04),
                                  child: Text(
                                    ref
                                        .watch(experienceDetailsProvider)[index]
                                        .experienceTitle,
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                              ))
                        ],
                      )
                    : ElevatedButton(
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
                ref.watch(hobbiesDetailsProvider).isNotEmpty
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black54),
                                borderRadius: BorderRadius.circular(12)),
                            width: w * 0.8,
                            height: h * 0.1,
                            child: Center(
                              child: ListView.builder(
                                itemCount:
                                    ref.watch(hobbiesDetailsProvider).length,
                                itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                      left: w * 0.1, bottom: w * 0.04),
                                  child: Text(
                                    ref.watch(hobbiesDetailsProvider)[index],
                                    style: GoogleFonts.poppins(),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
                                "Add Hobbies",
                                style: GoogleFonts.poppins(color: Colors.white),
                              ))
                        ],
                      )
                    : ElevatedButton(
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
                    onPressed: () {
                      print(downloadImageUrl);
                      if (name.text.isNotEmpty &&
                          bio.text.isNotEmpty &&
                          email.text.isNotEmpty &&
                          designation.text.isNotEmpty &&
                          ph.text.isNotEmpty &&
                          address.text.isNotEmpty &&
                          street.text.isNotEmpty &&
                          country.text.isNotEmpty &&
                          ref.watch(hobbiesDetailsProvider).isNotEmpty &&
                          ref.watch(educationDetailsProvider).isNotEmpty &&
                          ref.watch(skillDetailsProvider).isNotEmpty &&
                          ref.watch(experienceDetailsProvider).isNotEmpty) {
                        final templateData = TemplateData(
                          fullName: name.text.trim(),
                          image: downloadImageUrl,
                          email: email.text.trim(),
                          country: country.text.trim(),
                          address: address.text.trim(),
                          backgroundImage:
                              "https://st2.depositphotos.com/2124221/46809/i/450/depositphotos_468095768-stock-photo-abstract-multicolored-background-poly-pattern.jpg",
                          bio: bio.text.trim(),
                          currentPosition: designation.text.trim(),
                          phoneNumber: ph.text.trim(),
                          street: street.text.trim(),
                          educationDetails: ref.watch(educationDetailsProvider),
                          experience: ref.watch(experienceDetailsProvider),
                          hobbies: ref.watch(hobbiesDetailsProvider),
                          languages: ref.watch(skillDetailsProvider),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ResumeScreen(templateData: templateData),
                            ));
                      } else {
                        name.text.isEmpty
                            ? customSnackbar(context, "Name Empty")
                            : country.text.isEmpty
                                ? customSnackbar(context, "Enter Country")
                                : street.text.isEmpty
                                    ? customSnackbar(context, "Enter Street")
                                    : address.text.isEmpty
                                        ? customSnackbar(
                                            context, "Enter Address")
                                        : ph.text.isEmpty
                                            ? customSnackbar(
                                                context, "Enter Ph.No")
                                            : email.text.isEmpty
                                                ? customSnackbar(
                                                    context, "Enter Email")
                                                : designation.text.isEmpty
                                                    ? customSnackbar(context,
                                                        "Enter Designation")
                                                    : customSnackbar(
                                                        context, "Enter Bio");
                      }
                    },
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
