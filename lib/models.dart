class ServiceModel {
  int? idService;
  late String nameService;
  late int priceService;

  ServiceModel(
      {this.idService, required this.nameService, required this.priceService});

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        idService: json['idService'],
        nameService: json['nameService'],
        priceService: json['priceService'],
      );

  Map<String, dynamic> toJson() => {
        'idService': idService,
        'nameService': nameService,
        'priceService': priceService
      };

  @override
  String toString() {
    return "Service{$idService / $nameService / ${priceService}Ar}";
  }
}

class Invoice {
  int? idInvoice;
  late DateTime date;

  Invoice({this.idInvoice, required this.date});

  factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        idInvoice: json['idInvoice'],
        date: json['date'],
      );

  Map<String, dynamic> toJson() => {
        'idInvoice': idInvoice,
        'date': date,
      };

  @override
  String toString() {
    return "Facture{id:$idInvoice date:$date}";
  }
}

class InvoiceLine {
  int? idInvoiceLine;
  late Invoice invoice;
  late ServiceModel service;
  late int quantity;

  InvoiceLine(
      {this.idInvoiceLine,
      required this.invoice,
      required this.service,
      required this.quantity});

  factory InvoiceLine.fromJson(Map<String, dynamic> json) => InvoiceLine(
        idInvoiceLine: json['idInvoiceLine'],
        invoice: json['invoice'],
        service: json['service'],
        quantity: json['quantity'],
      );

  Map<String, dynamic> toJson() => {
        'idInvoiceLine': idInvoiceLine,
        'invoice': invoice,
        'service': service,
        'quantity': quantity,
      };

  @override
  String toString() {
    return "LigneFacture{id:$idInvoiceLine facture:$invoice service:$service quantite:$quantity}";
  }
}
