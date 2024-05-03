import 'package:flutter/material.dart';
import 'package:flutter_resume_template/flutter_resume_template.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:resume_builder/main.dart';

class ResumeScreen extends ConsumerStatefulWidget {
  final TemplateData templateData;
  const ResumeScreen({
    super.key,
    required this.templateData,
  });

  @override
  ConsumerState createState() => _ResumeScreenState();
}

class _ResumeScreenState extends ConsumerState<ResumeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white30,
      child: SafeArea(
          child: Scaffold(
        body: FlutterResumeTemplate(
          imageHeight: 100,
          imageWidth: 100,
          emailPlaceHolder: 'Email:',
          telPlaceHolder: 'Ph.No:',
          experiencePlaceHolder: 'Past',
          educationPlaceHolder: 'School',
          languagePlaceHolder: 'Skills',
          aboutMePlaceholder: 'Me',
          hobbiesPlaceholder: 'Past Times',
          mode: TemplateMode.onlyEditableMode,
          showButtons: true,
          imageBoxFit: BoxFit.fitHeight,
          enableDivider: false,
          data: widget.templateData,
          templateTheme: TemplateTheme.technical,
        ),
      )),
    );
  }
}
