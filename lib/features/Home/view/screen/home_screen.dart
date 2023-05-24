import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_image.dart';
import '../../../../core/routes/route.dart';
import '../../../../core/theme/controller/colors.dart';
import '../../logic/controller/api_controller.dart';
import '../widget/form_dialog.dart';
import '../widget/list_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home'.tr,
          style: TextStyle(color: Colors.blue),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.offNamed(Routes.profileScreen);
            },
            child: Image(
              image: AssetImage(AppImages.profileImage),
            ),
          )
        ],
        backgroundColor: Colors.white30,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.dialog(FormDialog());
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Container(
          width: Get.width * 0.99,
          height: Get.height,
          padding: const EdgeInsets.all(8),
          child: GetBuilder<ApiController>(builder: (controller) {
            return FutureBuilder(
                future: controller.getAllData(),
                builder: (context, snapshot) {
                  print('snapshot.data?.length ${snapshot.data?.length}');
                  if (snapshot.hasData) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          var data = snapshot.data?[index];
                          var date = DateFormat('yyyy-MM-dd hh:mm:ss')
                              .parse(data!.date);
                          return ListItem(
                            data: data,
                            controller: controller,
                            date: date,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text("THERE IS NO ITEMS"),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text("THERE IS NO ITEMS"),
                    );
                  }
                });
          }),
        ),
      ),
    );
  }
}
