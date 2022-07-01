import 'package:get/get.dart';
import 'package:msm_unify/Api/api_response.dart';
import 'package:msm_unify/repo/add_new_student_repo.dart';

class AddNewStudentViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  // onInit() {
  //   addNewStudentViewModel();
  // }

  Future<void> addNewStudentViewModel(Map<String, dynamic>? model) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      AddNewStudentRepo.addNewStudentRepo(model!);
      _apiResponse = ApiResponse.complete();
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }
}
