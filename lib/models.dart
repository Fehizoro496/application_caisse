class OperationModel {
  int? idOperation;
  late String nomOperation;
  late int quantiteOperation;
  late int prixOperation;
  late DateTime dateOperation;

  OperationModel(
      {this.idOperation,
      required this.nomOperation,
      required this.quantiteOperation,
      required this.prixOperation});

  factory OperationModel.fromJson(Map<String, dynamic> json) => OperationModel(
      idOperation: json['idOperation'],
      nomOperation: json['nomOperation'],
      quantiteOperation: json['quantiteOperation'],
      prixOperation: json['prixOperation']);

  Map<String, dynamic> toJson() => {
        'idOperation': idOperation,
        'nomOperation': nomOperation,
        'quantiteOperation': quantiteOperation,
        'prixOperation': prixOperation
      };

  @override
  String toString() {
    return "Service $idOperation :$nomOperation \n$prixOperation Ar x $quantiteOperation \nTotal : ${prixOperation * quantiteOperation} Ar";
  }
} //Operation

// class ServiceModel {
//   int? idService;
//   late String nameService;
//   late int priceService;

//   ServiceModel(
//       {this.idService, required this.nameService, required this.priceService});

//   factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
//         idService: json['idService'],
//         nameService: json['nameService'],
//         priceService: json['priceService'],
//       );

//   Map<String, dynamic> toJson() => {
//         'idService': idService,
//         'nameService': nameService,
//         'priceService': priceService
//       };

//   @override
//   String toString() {
//     return "Service{$idService / $nameService / ${priceService}Ar}";
//   }
// }

// class Invoice {
//   int? idInvoice;
//   late DateTime date;

//   Invoice({this.idInvoice, required this.date});

//   factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
//         idInvoice: json['idInvoice'],
//         date: json['date'],
//       );

//   Map<String, dynamic> toJson() => {
//         'idInvoice': idInvoice,
//         'date': date,
//       };

//   @override
//   String toString() {
//     return "Facture{id:$idInvoice date:$date}";
//   }
// }

// class InvoiceLine {
//   int? idInvoiceLine;
//   late Operation operation;

//   InvoiceLine(
//       {this.idInvoiceLine,
//       required this.invoice,
//       required this.service,
//       required this.quantity});

//   factory InvoiceLine.fromJson(Map<String, dynamic> json) => InvoiceLine(
//         idInvoiceLine: json['idInvoiceLine'],
//         invoice: json['invoice'],
//         service: json['service'],
//         quantity: json['quantity'],
//       );

//   Map<String, dynamic> toJson() => {
//         'idInvoiceLine': idInvoiceLine,
//         'invoice': invoice,
//         'service': service,
//         'quantity': quantity,
//       };

//   @override
//   String toString() {
//     return "LigneFacture{id:$idInvoiceLine facture:$invoice service:$service quantite:$quantity}";
//   }
// }
