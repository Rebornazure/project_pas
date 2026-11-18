import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project_pas/Models/team_model.dart';

class PremierLeagueController extends GetxController {
  final teams = <Team>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  static final Uri _url = Uri.https(
    'www.thesportsdb.com',
    '/api/v1/json/123/search_all_teams.php',
    {'l': 'English Premier League'},
  );

  @override
  void onInit() {
    super.onInit();
    getTeams();
  }

  Future<void> getTeams() async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final response = await http
          .get(_url)
          .timeout(const Duration(seconds: 20));
      if (response.statusCode != 200) {
        throw Exception('HTTP ${response.statusCode} saat mengambil data tim.');
      }
      teams.assignAll(premierLeagueModelFromJson(response.body).teams);
    } catch (error) {
      errorMessage.value = error.toString().replaceFirst('Exception: ', '');
      Get.snackbar('Gagal memuat tim', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> refreshProduk() => getTeams();
}
