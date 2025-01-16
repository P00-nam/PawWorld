class PetModel {
  final String? id;
  final String? name;
  final String? color;
  final String? gender;
  final String? description;
  final String? imagePath;
  final String? category;
  bool? favoritePets;

  PetModel({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.gender,
    required this.imagePath,
    required this.category,
    this.favoritePets = false,
  });

  factory PetModel.fromJson(Map<String, dynamic> map) {
    return PetModel(
      id: map['_id'] as String?,
      name: map['name'] as String?,
      description: map['description'] as String?,
      color: map['color'] as String?,
      gender: map['gender'] as String?,
      imagePath: map['image'] as String?,
      category: map['category'] as String?,
    );
  }
}

List<Map<String, dynamic>> categories = [
  {'name': 'All', 'iconPath': 'asset/all_pet.png'},
  {'name': 'Cat', 'iconPath': 'asset/cat.png'},
  {'name': 'Dog', 'iconPath': 'asset/dog.png'},
  {'name': 'Rabbit', 'iconPath': 'asset/rabbit.png'},
  {'name': 'Bird', 'iconPath': 'asset/bird.png'},
  {'name': 'Horse', 'iconPath': 'asset/horses.png'},
];
