  class Cardinfo {
   int Id=0;
  int ProfileId=0;
  String CardName="";
  String CardImage="";
  String CardNo="";
  String Barcode="";
  String ExpiryDate="";
  String CardType="";
  String YearsOfExp="";
  String Email="";

  Cardinfo(this.ProfileId, this.CardName, this.CardImage, this.CardNo
      ,this.Barcode, this.ExpiryDate, this.CardType  , this.YearsOfExp  , this.Email,this.Id);


  Cardinfo.fromJson(Map<String, dynamic> json) {
    ProfileId = json['ProfileId'];
    Id = json['Id'];
    CardName = json['CardName'];
    CardImage = json['CardImage'];
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
    data['CardImage'] = this.CardImage;
    data['CardNo'] = this.CardNo;
    data['Barcode'] = this.Barcode;
    data['ExpiryDate'] = this.ExpiryDate;
    data['CardType'] = this.CardType;
    data['YearsOfExp'] = this.YearsOfExp;
    data['Email'] = this.Email;
    return data;
  }}