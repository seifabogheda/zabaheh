part of 'ForgetPasswordWidgetsImports.dart';

class BuildFormInputs extends StatelessWidget {
  final ForgerPasswordData forgerPasswordData;

  const BuildFormInputs({required this.forgerPasswordData});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgerPasswordData.formKey,
      child: GenericTextField(
        fieldTypes: FieldTypes.normal,
        label: tr(context,"phone"),
        controller: forgerPasswordData.phone,
        action: TextInputAction.done,
        type: TextInputType.number,
        validate: (value) => value!.validatePhone(context),
        onSubmit: ()=> forgerPasswordData.onForgetPassword(context),
      ),
    );
  }
}
