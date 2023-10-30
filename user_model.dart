class User_Model{
  String ? uid;
  String ? username;
  String ? phone;
  String ? email;
  String ? password;
  User_Model({this.uid,this.phone,this.username,this.email,this.password});
  factory User_Model.fromMap(map){
    return User_Model(
      uid: map['uid'],
      phone: map['phone'],
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'uid':uid,

      'username':username,
      'phone':phone,
      'email' :email,
      'password' :password,
    };

  }
}


