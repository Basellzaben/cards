class Users {
  String Name;
  int ID;
  String Email;
  String Mobile;
  String Password;
  String Country;
  String ProfileImage;

  Users(this.Name, this.ID,this.Email,this.Mobile,this.Password,this.Country,this.ProfileImage);

  factory Users.fromJson(dynamic json) {
    return Users(json['Name'] as String, json['ID'] as int
    ,json['Email'] as String, json['Mobile'] as String,
        json['Password'] as String, json['Country'] as String,
         json['ProfileImage'] as String);
  }

  @override
  String toString() {
    return '{ ${this.Name}, ${this.ID} }';
  }


  String getname(){
    return this.Name;
  }
  String getid(){
    return this.ID.toString();
  }
  String getEmail(){
    return this.Email;
  }
  String getMobile(){
    return this.Mobile;
  }
  String getPassword(){
    return this.Password;
  }
  String getCountry(){
    return this.Country;
  }
  String getProfileImage(){
    return this.ProfileImage;
  }



}