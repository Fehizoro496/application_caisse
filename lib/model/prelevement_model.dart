class PrelevementModel {
  String? idPrelevement;
  late int montant;
  DateTime? datePrelevement;

  PrelevementModel(
      {this.idPrelevement, required this.montant, this.datePrelevement});

  factory PrelevementModel.fromJson(Map<String, dynamic> json) =>
      PrelevementModel(
          idPrelevement: json['idPrelevement'],
          montant: json['montant'],
          datePrelevement: json['datePrelevement']);

  Map<String, dynamic> toJson() => {
        'idPrelevement': idPrelevement,
        'client': montant,
        'datePrelevement': datePrelevement
      };

  @override
  String toString() {
    return "Prelevement du $datePrelevement:\nmontant: ${montant}Ar";
  }
}
