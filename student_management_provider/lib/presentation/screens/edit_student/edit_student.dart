import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_provider/core/constants.dart';
import 'package:student_management_provider/presentation/provider/student/edit_student_provider.dart';
import 'package:student_management_provider/presentation/provider/student/new_student_provider.dart';
import 'package:student_management_provider/presentation/screens/widgets/custom_textfield_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/small_button_widget.dart';
import 'package:student_management_provider/presentation/screens/widgets/student_imagepicker_widget.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final viewModel = Provider.of<EditStudentProvider>(context);
    return ChangeNotifierProvider(
      create: (context) => EditStudentProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Student'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: [
                Consumer<NewStudentProvider>(
                  builder: (context, provider, _) => StudentImagePickerWidget(
                      size: size,
                      
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: viewModel.formKey,
                    child: Column(
                      children: [
                        CustomTextFieldWidget(
                            size: size,
                            hint: 'Name',
                            keyboard: TextInputType.name,
                            textController: viewModel.studentName),
                        h20,
                        CustomTextFieldWidget(
                            size: size,
                            hint: 'Department',
                            keyboard: TextInputType.name,
                            textController: viewModel.studentDepartment),
                        h20,
                        CustomTextFieldWidget(
                            size: size,
                            hint: 'Phone No',
                            keyboard: TextInputType.name,
                            textController: viewModel.studentPhoneNo),
                        h20,
                        CustomTextFieldWidget(
                            size: size,
                            hint: 'Address',
                            keyboard: TextInputType.name,
                            textController: viewModel.studentAddress),
                        h30,
                        SmallButtonWidget(
                            size: size,
                            icon: Icons.save,
                            title: 'Save',
                            voidCallback: () => viewModel.submitEditStudent())
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
