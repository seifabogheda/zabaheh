import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:flutter/material.dart';

import '../../../models/notifications_model.dart';
import '../../../repos/repo_impl.dart';
import 'notifications_item.dart';

class NotificationsBody extends StatefulWidget {
  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  final GenericCubit<List<NotificationModel>> notificationCubit =
      GenericCubit([]);
  final BaseRepo repo = RepoImpl();

  getNotifications() async {
    var result = await repo.notifications();
    notificationCubit.onUpdateData(result);
  }

  @override
  void initState() {
    getNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        itemCount: 5,
        // itemCount: state.data.length,
        itemBuilder: (context, index) {
          return NotificationsItem(model:NotificationModel(),);
        },
      ),
    );

    //   BlocBuilder<GenericCubit<List<NotificationModel>>,
    //     GenericState<List<NotificationModel>>>(
    //   bloc: notificationCubit,
    //   builder: (context, state) {
    //     if (state is GenericUpdateState) {
    //       if (state.data != []) {
    //         return Expanded(
    //           child: ListView.builder(
    //             padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
    //             itemCount: 5,
    //             // itemCount: state.data.length,
    //             itemBuilder: (context, index) {
    //               return NotificationsItem(model: state.data[index],);
    //             },
    //           ),
    //         );
    //       }
    //       else {
    //         Expanded(
    //           child: Center(
    //             child: MyText(
    //               title: "لا يوجد اشعارات",
    //             ),
    //           ),
    //         );
    //       }
    //     }
    //     return Expanded(
    //       child: Center(
    //         child: AppLoaderHelper.showSimpleLoading(),
    //       ),
    //     );
    //   },
    // );
  }
}
