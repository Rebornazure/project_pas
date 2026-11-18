// To parse this JSON data, do
//     final premierLeagueModel = premierLeagueModelFromJson(jsonString);

import 'dart:convert';

PremierLeagueModel premierLeagueModelFromJson(String source) =>
    PremierLeagueModel.fromJson(jsonDecode(source) as Map<String, dynamic>);

String premierLeagueModelToJson(PremierLeagueModel model) =>
    jsonEncode(model.toJson());

class PremierLeagueModel {
  const PremierLeagueModel({required this.teams});

  final List<Team> teams;

  factory PremierLeagueModel.fromJson(Map<String, dynamic> json) {
    final value = json['teams'];
    return PremierLeagueModel(
      teams: value is List
          ? value.whereType<Map<String, dynamic>>().map(Team.fromJson).toList()
          : const [],
    );
  }

  Map<String, dynamic> toJson() => {
    'teams': teams.map((team) => team.toJson()).toList(),
  };
}

class Team {
  const Team({
    required this.idTeam,
    required this.strTeam,
    required this.strStadium,
    required this.strBadge,
    required this.strDescriptionEn,
  });

  final String idTeam;
  final String strTeam;
  final String strStadium;
  final String strBadge;
  final String strDescriptionEn;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
    idTeam: json['idTeam']?.toString() ?? '',
    strTeam: json['strTeam']?.toString() ?? '',
    strStadium: json['strStadium']?.toString() ?? '',
    strBadge: json['strBadge']?.toString() ?? '',
    strDescriptionEn: json['strDescriptionEn']?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    'idTeam': idTeam,
    'strTeam': strTeam,
    'strStadium': strStadium,
    'strBadge': strBadge,
    'strDescriptionEn': strDescriptionEn,
  };
}
