import '../../../core/repositeries/preference/contracts/preference_repo_contract.dart';
import '../../constants/preference_config_constants.dart';

class AppPreferenceRepo extends PreferenceRepoContract {
  setVisitedData() async {
    await prefCoreRepo.setBool(prAlreadyVisited, true);
  }

  Future<bool> getVisitedData() async {
    return await prefCoreRepo.getBool(prAlreadyVisited);
  }
}
