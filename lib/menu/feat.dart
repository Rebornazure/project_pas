import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/controller/premier_league_controller.dart';
import 'package:project_pas/Models/team_model.dart';

class FeatPage extends StatefulWidget {
  const FeatPage({super.key});

  @override
  State<FeatPage> createState() => FeatPageState();
}

class FeatPageState extends State<FeatPage> {
  final controller = Get.put(PremierLeagueController());

  @override
  Widget build(BuildContext context) => Obx(() {
    if (controller.isLoading.value && controller.teams.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    if (controller.errorMessage.value.isNotEmpty && controller.teams.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.cloud_off_outlined,
                size: 44,
                color: Color(0xFF81918B),
              ),
              const SizedBox(height: 12),
              Text(controller.errorMessage.value, textAlign: TextAlign.center),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: controller.getTeams,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ENGLISH PREMIER LEAGUE',
                style: TextStyle(
                  color: Color(0xFF087E72),
                  fontSize: 12,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Daftar Klub',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF173B35),
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Informasi tim dan stadion dari TheSportsDB.',
                style: TextStyle(color: Color(0xFF667873)),
              ),
            ],
          ),
        ),
        if (controller.isLoading.value)
          const LinearProgressIndicator(minHeight: 2),
        Expanded(
          child: RefreshIndicator(
            onRefresh: controller.refreshProduk,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 20),
              itemCount: controller.teams.length,
              itemBuilder: (context, index) =>
                  teamCard(controller.teams[index]),
            ),
          ),
        ),
      ],
    );
  });

  Widget teamCard(Team team) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    elevation: 0,
    color: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(13),
      child: Row(
        children: [
          badge(team.strBadge),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  team.strTeam,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF173B35),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.stadium_outlined,
                      size: 16,
                      color: Color(0xFF087E72),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        team.strStadium.isEmpty
                            ? 'Stadion belum tersedia'
                            : team.strStadium,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF667873),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Widget badge(String url) {
    if (url.isEmpty) {
      return const CircleAvatar(
        radius: 27,
        backgroundColor: Color(0xFFE7EFE9),
        child: Icon(Icons.sports_soccer, color: Color(0xFF315C48)),
      );
    }
    return SizedBox(
      width: 54,
      height: 54,
      child: Image.network(
        url,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, progress) => progress == null
            ? child
            : const Center(
                child: SizedBox(
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
        errorBuilder: (context, error, stack) => const CircleAvatar(
          backgroundColor: Color(0xFFE7EFE9),
          child: Icon(Icons.sports_soccer, color: Color(0xFF315C48)),
        ),
      ),
    );
  }
}
