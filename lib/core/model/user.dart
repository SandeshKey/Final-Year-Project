class AppUser {
  final String? uid;
  final String? name;
  final String? email;
  final String? displayImage;
  final String? phoneNumber;

  AppUser({
    this.uid,
    this.name,
    this.email,
    this.displayImage,
    this.phoneNumber,
  });

  // userr to map
  Map<String, dynamic> userToMap() {
    //requires String and dynamic
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;
    data['displayImage'] = displayImage;
    data['phoneNumber'] = phoneNumber;

    return data;
  }

  factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(
        uid: json["uid"],
        name: json["name"],
        email: json["email"],
        displayImage: json["displayImage"],
        phoneNumber: json["phoneNumber"],
      );
}
