import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

import '../App/common/AppConfig/base_url.dart';

class AddNewStudentRepo extends ApiURLService {
  static addNewStudentRepo(Map<String, dynamic> body) async {
    var response = await APIService().getResponse(
      url: "${BaseUrl.baseUrl}/Student/Add",
      apitype: APIType.aPost,
      body: body,
    );
  }
}
