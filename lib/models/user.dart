class User {
  String firstName;
  String lastName;
  String phone;
  String profilePictureURL;

  User({this.firstName, this.lastName, this.phone, this.profilePictureURL});

  @override
  String toString() {
    return '''
         User{
             firstName: $firstName,
             lastName: $lastName,
             phone: $phone,
             profilePictureURL: $profilePictureURL
         }
    ''';
  }

  String get getUserName => '$firstName $lastName';

  String get getPhoneNumber => '$phone';

/* @override
  int get hashCode {}

  @override
  bool operator ==(other) {}*/
}
