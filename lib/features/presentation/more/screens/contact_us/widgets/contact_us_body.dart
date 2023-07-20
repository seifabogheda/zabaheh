import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_us_form.dart';
import 'contact_us_social.dart';

class ContactUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactUsCubit(),
      child: BlocBuilder<ContactUsCubit, ContactUsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                ContactUsForm(),
                if (state is ContactUsLoading)
                  Center(
                    child: AppLoaderHelper.showSimpleLoading(),
                  ),
                if (state is ContactUsSuccess)
                  CustomButton(
                    title: tr(context, "send"),
                    onTap: () {
                      context.read<ContactUsCubit>().contactUs();
                    },
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  ),
                if (state is ContactUsInitial)
                  CustomButton(
                    title: tr(context, "send"),
                    onTap: () {
                      context.read<ContactUsCubit>().contactUs();
                    },
                    margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  ),
                ContactUsSocial(),
              ],
            ),
          );
        },
      ),
    );
  }
}
