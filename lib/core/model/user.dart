class AppUser {
  final String? uid;
  final String? name;
  final String? email;
 

  AppUser( {
   
    this.uid,
    this.name,
    this.email,
  });

  // userr to map
  Map<String, dynamic> userToMap() {
    //requires String and dynamic
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['email'] = email;

    return data;
  }


  factory AppUser.fromMap(Map<String, dynamic> json) => AppUser(

        uid: json["uid"],
        name: json["name"],
        email: json["email"],
      );

}
