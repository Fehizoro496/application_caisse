class UtilisateurModel {
  int? idUtilisateur;
  late String nomUtilisateur;
}

class FactureModel {
  int? idFacture;
  late String client;
  // late int fournisseur;
  DateTime? dateFacture;

  FactureModel(
      {this.idFacture,
      required this.client,
      // required this.fournisseur,
      this.dateFacture});
}

class OperationModel {
  int? idOperation;
  late String nomOperation;
  late int quantiteOperation;
  late int prixOperation;
  DateTime? dateOperation;

  OperationModel(
      {this.idOperation,
      required this.nomOperation,
      required this.quantiteOperation,
      required this.prixOperation,
      this.dateOperation});

  factory OperationModel.fromJson(Map<String, dynamic> json) => OperationModel(
      idOperation: json['idOperation'],
      nomOperation: json['nomOperation'],
      quantiteOperation: json['quantiteOperation'],
      prixOperation: json['prixOperation'],
      dateOperation: json['dateOperation']);

  Map<String, dynamic> toJson() => {
        'idOperation': idOperation,
        'nomOperation': nomOperation,
        'quantiteOperation': quantiteOperation,
        'prixOperation': prixOperation,
        'dateOperation': dateOperation
      };

  @override
  String toString() {
    return "Service $idOperation :$nomOperation \n$prixOperation Ar x $quantiteOperation \nTotal : ${prixOperation * quantiteOperation} Ar";
  }
} //Operation

