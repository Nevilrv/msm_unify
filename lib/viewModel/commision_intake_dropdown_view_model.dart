import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/model/responseModek/commission_intake_dropdown_response_model.dart';
import 'package:msm_unify/repo/commission_intake_dropdown_repo.dart';

class CommissionIntakeDropdownViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  onInit() {
    commissionIntakeDropdownViewModel();
  }

  Future<void> commissionIntakeDropdownViewModel() async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      List<CommissionIntakeDropdownResponseModel> response =
          await CommissionIntakeDropdownRepo().commissionIntakeDropdownRepo();
      print('commisionIntakeDropdownRepo RESPONSE=>${response}');
      _apiResponse = ApiResponse.complete(response);
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
