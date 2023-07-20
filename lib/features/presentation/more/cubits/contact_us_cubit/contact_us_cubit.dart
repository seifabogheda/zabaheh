import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../repos/repo_impl.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final BaseRepo repo = RepoImpl();
  Future<void> close() {
    phoneController.dispose();
    nameController.dispose();
    messageController.dispose();
    return super.close();
  }

  contactUs() async {
    if (formKey.currentState!.validate()) {
      String phone = "+966${phoneController.text}";
      emit(ContactUsLoading());
      var data = await repo.contactUs(
          nameController.text, phone, messageController.text);
      if (data) {
        emit(ContactUsSuccess());
      } else {
        emit(ContactUsFailed());
      }
    }
  }
}
