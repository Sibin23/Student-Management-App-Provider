import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';
import 'package:student_management_provider/presentation/screens/widgets/custom_textfield_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/student_imagepicker_widget.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewStudentProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add Student',
          style: GoogleFonts.roboto(fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              h20,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      FadeInDown(
                        child: StudentImagePickerWidget(
                          size: size,
                          
                          
                        ),
                      ),
                      h20,
                      FadeInLeft(
                        child: CustomTextFieldWidget(
                            size: size,
                            hint: 'Name',
                            keyboard: TextInputType.name,
                            textController: viewModel.nameController),
                      ),
                      h20,
                      FadeInRight(
                        child: CustomTextFieldWidget(
                            size: size,
                            hint: 'Department',
                            keyboard: TextInputType.name,
                            textController: viewModel.stdController),
                      ),
                      h20,
                      FadeInLeft(
                        child: CustomTextFieldWidget(
                            size: size,
                            hint: 'Phone No',
                            keyboard: TextInputType.name,
                            textController: viewModel.phonNumController),
                      ),
                      h20,
                      FadeInRight(
                        child: CustomTextFieldWidget(
                            maxLines: 5,
                            size: size,
                            hint: 'Address',
                            keyboard: TextInputType.name,
                            textController: viewModel.addressController),
                      ),
                      h30,
                      FadeInUp(
                        child: SmallButtonWidget(
                            size: size,
                            icon: Icons.save,
                            title: 'Save',
                            voidCallback: () => viewModel.addStudent()),
                      ),
                      h30,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
