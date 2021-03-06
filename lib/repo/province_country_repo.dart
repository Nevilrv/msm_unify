import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/province_country_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class ProvinceCountryRepo extends ApiURLService {
  Future<List<ProvinceCountryResponseModel>> provinceCountryRepo() async {
    print('rrfgr');
    var response = await APIService().getResponse(
        url: "${BaseUrl.baseUrl}/Misc/Province?Country=101",
        apitype: APIType.aGet);
    print('rrfgr');
    print('--res ${response}');
    List<ProvinceCountryResponseModel> provinceCountryResponseModel =
        provinceCountryResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${provinceCountryResponseModel.first}');
    return provinceCountryResponseModel;
  }
}
