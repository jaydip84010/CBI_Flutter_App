class PdfViewModel {
  final double purchasePrice;
  final double? transferAttorneyFees;
  final double? postgesAndPetties;
  final double? deedsOfficeFees;
  final double? electronicGenerationFee;
  final double? ficaRegistrationFee;
  final double? ratesClearanceFee;
  final double? transferDutye;
  final double? transferDutyReceiptFee;
  final double? deedsOfficeSearchFee;
  final double? total;

  PdfViewModel({
    required this.purchasePrice,
    this.transferAttorneyFees,
    this.postgesAndPetties,
    this.deedsOfficeFees,
    this.electronicGenerationFee,
    this.ficaRegistrationFee,
    this.ratesClearanceFee,
    this.transferDutye,
    this.transferDutyReceiptFee,
    this.deedsOfficeSearchFee,
    this.total,
  });
}
