import 'dart:convert';

import 'package:msm_unify/App/common/AppConfig/base_url.dart';
import 'package:msm_unify/model/responseModek/commission_intake_dropdown_response_model.dart';
import 'package:msm_unify/services/api_service.dart';
import 'package:msm_unify/services/api_url.dart';

class CommissionIntakeDropdownRepo extends ApiURLService {
  Future<List<CommissionIntakeDropdownResponseModel>>
      commissionIntakeDropdownRepo() async {
    var response = await APIService().getResponse(
        url:
            "${BaseUrl.baseUrl}/InstitutionIntake/ForDDLByAgentAndCountry?InstitutionId=647&ProgramId=0&AgentId=0&CountryId=0",
        apitype: APIType.aGet);
    List<CommissionIntakeDropdownResponseModel>
        commissionIntakeDropdownResponseModel =
        commissionIntakeDropdownResponseModelFromJson(jsonEncode(response));
    print('=========jjjj${commissionIntakeDropdownResponseModel.first}');
    return commissionIntakeDropdownResponseModel;
  }
}
