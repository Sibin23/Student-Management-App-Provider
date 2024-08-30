

class StudentModel {
  int? id;
  final String image;
  final String name;
  final String std;
  final String phoneNumber;
  final String address;
  StudentModel(
      {this.id = 0,
      required this.image,
      required this.name,
      required this.std,
      required this.phoneNumber,
      required this.address});

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      image: map['image'] as String,
      name: map['name'] as String,
      std: map['standard'] as String,
      phoneNumber: map['phoneNumber'] as String,
      address: map['address'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'image': image,
        'name': name,
        'standard': std,
        'phoneNumber': phoneNumber,
        'address': address,
      };
}
