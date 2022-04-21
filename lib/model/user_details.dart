class UserDetails {
  String? displayName;
  String? email;
  String? photoURL;

  UserDetails({this.displayName, this.email, this.photoURL});

  UserDetails.fromJSON(Map<String, dynamic> json) {
    displayName = json["displayName"];
    email = json["email"];
    photoURL = json["photoURL"];
  }

  Map<String, dynamic> toJson() {
    // Object -- data
    final Map<String, dynamic> data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoURL'] = photoURL;

    return data;
  }
}
