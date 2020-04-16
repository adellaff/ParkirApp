class User {
  String idUser;
  String username;
  String password;
  String idRole;

  User({this.idUser, this.username, this.password,this.idRole});

  Map<String, dynamic> toMap(){
    return{
      'id_user': idUser,
      'username':username,
      'password':password,
      'id_role':idRole
    };
  }
}