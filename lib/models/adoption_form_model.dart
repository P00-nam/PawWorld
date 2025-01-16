class AdoptionFormModel {
  final String name;
  final String email;
  final String phone;
  bool hasOwnedPetBefore;
  bool hasFencedYard;
  bool isReadyToAdopt;

  AdoptionFormModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.hasOwnedPetBefore,
    required this.hasFencedYard,
    required this.isReadyToAdopt,
  });

  factory AdoptionFormModel.fromJson(Map<String, dynamic> json) {
    print("Adoption $json");
    return AdoptionFormModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      hasOwnedPetBefore: json['hasOwnedPetBefore'],
      hasFencedYard: json['hasFencedYard'],
      isReadyToAdopt: json['isReadyToAdopt'],
    );
  }
}
