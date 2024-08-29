class StudentModel {
  final int id;
  final String image;
  final String name;
  final String std;
  final String phoneNumber;
  final String address;
  StudentModel(
      {required this.id,
      required this.image,
      required this.name,
      required this.std,
      required this.phoneNumber,
      required this.address});

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as int,
      image: map['image'] as String,
      name: map['name'] as String,
      std: map['std'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
        'name': name,
        'std': std,
        'phoneNumber': phoneNumber,
        'address': address,
      };
}
