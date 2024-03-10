import 'package:flutter_templete/core/data/models/apis/aboutus_model.dart';
import 'package:flutter_templete/core/services/base_controller.dart';
import 'package:flutter_templete/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

import '../../../core/data/reposotories/uboutus_repositories.dart';
import '../../../core/enums/message_type.dart';

class AboutController extends BaseController {

  Rx<AboutUsModel> aboutModel = AboutUsModel().obs;

  @override
  void onInit() {
    getAboutUS();
    super.onInit();
  }


  void getAboutUS () {
    runFutureFunctionWithLoading(
        function: AboutUsRepositories().aboutUs().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l , messageType: MessageType.REJECTED);
            }, (r) {
            aboutModel.value = r;
          });
        })
    );
  }

}
