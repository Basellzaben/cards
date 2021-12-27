  class Cardinfo {
   int Id=0;
  int ProfileId=0;
  String CardName="";
   String CardImage1="";
   String CardImage2="";
   String CardImage3="";
  String CardNo="";
  String Barcode="";
  String ExpiryDate="";
  String CardType="";
  String YearsOfExp="";
  String Email="";

  Cardinfo(this.ProfileId, this.CardName, this.CardImage1, this.CardImage2, this.CardImage3, this.CardNo
      ,this.Barcode, this.ExpiryDate, this.CardType  , this.YearsOfExp  , this.Email,this.Id);


  Cardinfo.fromJson(Map<String, dynamic> json) {
    ProfileId = json['ProfileId'];
    Id = json['Id'];
    CardName = json['CardName'];
    CardImage1 = json['CardImage1'];
    CardImage2 = json['CardImage2'];
    CardImage3 = json['CardImage3'];
    CardNo = json['CardNo'];
    Barcode = json['Barcode'];
   ExpiryDate = json['ExpiryDate'];
    CardType = json['CardType'];
    YearsOfExp = json['YearsOfExp'];
    Email = json['Email'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProfileId'] = this.ProfileId;
    data['Id'] = this.Id;
    data['CardName'] = this.CardName;
    data['CardImage1'] = this.CardImage1;
    data['CardImage2'] = this.CardImage2;
    data['CardImage3'] = this.CardImage3;
    data['CardNo'] = this.CardNo;
    data['Barcode'] = this.Barcode;
    data['ExpiryDate'] = this.ExpiryDate;
    data['CardType'] = this.CardType;
    data['YearsOfExp'] = this.YearsOfExp;
    data['Email'] = this.Email;
    return data;
  }}