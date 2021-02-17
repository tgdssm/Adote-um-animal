class Animal {
  String photo;
  String name;
  String breed;
  String sex;
  int age;
  String description;

  Animal({this.photo, this.name, this.age, this.breed, this.sex, this.description});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
      'breed': this.breed,
      'sex': this.sex,
      'description': this.description,
      'age': this.age,
      'photo': this.photo
    };
  }
}