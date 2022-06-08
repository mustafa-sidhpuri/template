class LoggedInUser{
  String? id;
  String? name;
  String? profilePicUrl;
  String? email;

  LoggedInUser({required this.id, required this.name, required this.email, this.profilePicUrl});

  Map<String, dynamic> toMap(){
    return {
      "id": id?? "",
      "name": name?? "",
      "profilePicUrl": profilePicUrl?? "",
      "email": email?? ""
    };
  }
}