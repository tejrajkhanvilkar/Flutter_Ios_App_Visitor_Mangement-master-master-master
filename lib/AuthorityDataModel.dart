class AuthorityDataModel
{

  // AuthorityDataModel()
  // {
  // }

  late String designation;
  late String phone;
  late String email;
  late String image;
  late String name;
  late String organization;
  late String uid;


  AuthorityDataModel(String designation, String phone, String email, String image, String name, String organization, String uid)
  {
    this.designation = designation;
    this.phone = phone;
    this.email = email;
    this.image = image;
    this.name = name;
    this.organization = organization;
    this.uid = uid;
  }

  String getPhone()
  {
    return phone;
  }

  void setPhone(String phone)
  {
    this.phone = phone;
  }

  AuthorityDataModel.cpy(String designation, String email, String image, String name, String organization, String uid)
  {
    this.designation = designation;
    this.email = email;
    this.image = image;
    this.name = name;
    this.organization = organization;
    this.uid = uid;
  }

  String getDesignation()
  {
    return designation;
  }

  void setDesignation(String designation)
  {
    this.designation = designation;
  }

  String getEmail()
  {
    return email;
  }

  void setEmail(String email)
  {
    this.email = email;
  }

  String getImage()
  {
    return image;
  }

  void setImage(String image)
  {
    this.image = image;
  }

  String getName()
  {
    return name;
  }

  void setName(String name)
  {
    this.name = name;
  }

  String getOrganization()
  {
    return organization;
  }

  void setOrganization(String organization)
  {
    this.organization = organization;
  }

  String getUid()
  {
    return uid;
  }

  void setUid(String uid)
  {
    this.uid = uid;
  }
}
