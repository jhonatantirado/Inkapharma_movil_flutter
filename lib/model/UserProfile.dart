class UserProfile{
  String username;
  String picture;
  String email;

  UserProfile(this.username,this.picture,this.email);

  UserProfile.map(dynamic obj){
    this.username = obj["username"];
    this.picture = obj["picture"];
    this.email =  obj["email"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic> ();
    map["username"] = username;
    map["picture"] = picture;
    map["email"] = email;
    return map;
  }

  UserProfile.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        picture = json['picture'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'picture': picture,
        'email': email,
      };
}