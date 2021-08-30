import 'package:firebase_database/firebase_database.dart';

class VisitorDataModel
{

  late String Vuid;
  late String Address;
  late String City;
  late String ImageUrl;
  late String ImageName;
  late String Reason;
  late String WhomToMeet_Name;
  late String First_Name;
  late String Mobile_NO;
  late String Email_ID;
  late String AreaCode;
  late String Breathing_Difficulty;
  late String Cough;
  late String FeverStatus;
  late String Last_Name;
  late String MDate;
  late String MTime;
  late String Resp_Problem;
  late String State;
  late bool Visited_Status;
  late String WhomToMeet;
  late bool Notification_Status;
  late String Visited_Status_Update;
  late String RescheduledTime;


  VisitorDataModel.nmd(String rtime, String uid ,String reason, String whomToMeet_Name, String first_Name, String mobile_NO, String email_ID, String address,String city ,String areaCode, String breathing_Difficulty, String cough, String feverStatus, String last_Name, String MDate, String MTime, String resp_problem, String state, bool visited_Status, String whomToMeet, bool notification_Status, String visited_Status_Update,String imageurl,String imagename)
  {
    Vuid=uid;
    Reason = reason;
    WhomToMeet_Name = whomToMeet_Name;
    First_Name = first_Name;
    Mobile_NO = mobile_NO;
    Email_ID = email_ID;
    Address=address;
    City=city;
    ImageName=imagename;
    ImageUrl=imageurl;
    AreaCode = areaCode;
    Breathing_Difficulty = breathing_Difficulty;
    Cough = cough;
    FeverStatus = feverStatus;
    Last_Name = last_Name;
    this.MDate = MDate;
    this.MTime = MTime;
    Resp_Problem = resp_problem;
    State = state;
    Visited_Status = visited_Status;
    WhomToMeet = whomToMeet;
    Notification_Status = notification_Status;
    Visited_Status_Update = visited_Status_Update;
    RescheduledTime=rtime;
  }

  VisitorDataModel(this.RescheduledTime,this.Vuid,this.Reason,this.Mobile_NO,this.AreaCode,this.First_Name,this.Last_Name,this.Email_ID,this.Address,this.City,this.State,this.WhomToMeet_Name,this.WhomToMeet,this.MDate,this.MTime,this.FeverStatus,this.Cough,this.Breathing_Difficulty,this.Resp_Problem,this.Visited_Status,this.Notification_Status,this.Visited_Status_Update,this.ImageUrl,this.ImageName){}

  VisitorDataModel.con(String RescheduledTime,String Vuid,String Reason,String Mobile_NO,String AreaCode,First_Name, String Last_Name,String Email_ID,String Address,String City,String State,String WhomToMeet_Name,String WhomToMeet,String MDate,String MTime,String FeverStatus,String Cough,String Breathing_Difficulty,String Resp_Problem, bool Visited_Status,bool Notification_Status,String Visited_Status_Update, String ImageUrl, String ImageName)
  {
    this.RescheduledTime=RescheduledTime;
    this.Vuid=Vuid;
    this.Reason=Reason;
    this.Mobile_NO=Mobile_NO;
    this.AreaCode=AreaCode;
    this.First_Name=First_Name;
    this.Last_Name=Last_Name;
    this.Email_ID=Email_ID;
    this.Address=Address;
    this.City=City;
    this.State=State;
    this.WhomToMeet_Name=WhomToMeet_Name;
    this.WhomToMeet=WhomToMeet;
    this.MDate=MDate;
    this.MTime=MTime;
    this.FeverStatus=FeverStatus;
    this.Cough=Cough;
    this.Breathing_Difficulty=Breathing_Difficulty;
    this.Resp_Problem=Resp_Problem;
    this.Visited_Status=Visited_Status;
    this.Notification_Status=Notification_Status;
    this.Visited_Status_Update=Visited_Status_Update;
    this.ImageUrl=ImageUrl;
    this.ImageName=ImageName;

  }


  VisitorDataModel.fromDataSnap(DataSnapshot snap)
  {

    Reason = snap.value["Reason"];
    First_Name = snap.value["First_Name"];
    Mobile_NO = snap.value["Mobile_NO"];
    Email_ID = snap.value["Email_ID"];
    AreaCode = snap.value["AreaCode"];
    Breathing_Difficulty = snap.value["Breathing_Difficulty"];
    Cough = snap.value["Cough"];
    FeverStatus = snap.value["FeverStatus"];
    Last_Name =snap.value["Last_Name"];
    this.MDate =snap.value["MDate"];
    this.MTime = snap.value["MTime"];
    Resp_Problem = snap.value["Resp_Problem"];
    State = snap.value["State"];
    Visited_Status =snap.value["Visited_Status"];
    WhomToMeet = snap.value["WhomToMeet"];
    WhomToMeet_Name=snap.value['WhomToMeet_Name'];
    Address=snap.value['Address'];
    City=snap.value['City'];
    Notification_Status=snap.value['Notification_Status'];
    Visited_Status_Update=snap.value['Visited_Status_Update'];
    ImageUrl=snap.value['ImageUrl'];
    ImageName=snap.value['ImageName'];
    Vuid=snap.value["Vuid"];
    RescheduledTime=snap.value["RescheduledTime"];
  }

  String getVuid()
  {
    return Vuid;
  }

  void setVuid(String vuid)
  {
    Vuid=vuid;
  }

  String getRescheduledTime()
  {
    return RescheduledTime;
  }

  void setRescheduledTime(String rtime)
  {
    RescheduledTime=rtime;
  }

  String getReason()
  {
    return Reason;
  }

  void setReason(String reason)
  {
    Reason = reason;
  }

  String getWhomToMeet_Name()
  {
    return WhomToMeet_Name;
  }

  void setWhomToMeet_Name(String whomToMeet_Name)
  {
    WhomToMeet_Name = whomToMeet_Name;
  }

  String getFirst_Name()
  {
    return First_Name;
  }

  void setFirst_Name(String first_Name)
  {
    First_Name = first_Name;
  }

  String getMobile_NO()
  {
    return Mobile_NO;
  }

  void setMobile_NO(String mobile_NO)
  {
    Mobile_NO = mobile_NO;
  }

  String getEmail_ID()
  {
    return Email_ID;
  }

  void setEmail_ID(String email_ID)
  {
    Email_ID = email_ID;
  }

  String getAreaCode()
  {
    return AreaCode;
  }

  void setAreaCode(String areaCode)
  {
    AreaCode = areaCode;
  }

  String getBreathing_Difficulty()
  {
    return Breathing_Difficulty;
  }

  void setBreathing_Difficulty(String breathing_Difficulty)
  {
    Breathing_Difficulty = breathing_Difficulty;
  }

  String getCough()
  {
    return Cough;
  }

  void setCough(String cough)
  {
    Cough = cough;
  }

  String getFeverStatus()
  {
    return FeverStatus;
  }

  void setFeverStatus(String feverStatus)
  {
    FeverStatus = feverStatus;
  }

  String getLast_Name()
  {
    return Last_Name;
  }

  void setLast_Name(String last_Name)
  {
    Last_Name = last_Name;
  }

  String getMDate()
  {
    return MDate;
  }

  void setMDate(String MDate)
  {
    this.MDate = MDate;
  }

  String getMTime()
  {
    return MTime;
  }

  void setMTime(String MTime)
  {
    this.MTime = MTime;
  }

  String getReasonResp_Problem()
  {
    return Resp_Problem;
  }

  void setReasonResp_Problem(String reasonResp_Problem)
  {
    Resp_Problem = reasonResp_Problem;
  }

  String getState()
  {
    return State;
  }

  void setState(String state)
  {
    State = state;
  }

  bool isVisited_Status()
  {
    return Visited_Status;
  }

  void setVisited_Status(bool visited_Status)
  {
    Visited_Status = visited_Status;
  }

  String getWhomToMeet()
  {
    return WhomToMeet;
  }

  void setWhomToMeet(String whomToMeet)
  {
    WhomToMeet = whomToMeet;
  }

  bool isNotification_Status()
  {
    return Notification_Status;
  }

  void setNotification_Status(bool notification_Status)
  {
    Notification_Status = notification_Status;
  }

  String getVisited_Status_Update()
  {
    return Visited_Status_Update;
  }

  void setVisited_Status_Update(String visited_Status_Update)
  {
    Visited_Status_Update = visited_Status_Update;
  }

  String getAddress()
  {
    return Address;
  }

  void setAddress(String address)
  {
    Address=address;
  }

  String getCity()
  {
    return City;
  }

  void setCity(String city)
  {
    City=city;
  }


  String getImageUrl()
  {
    return ImageUrl;
  }

  void setImageUrl(String imgurl)
  {
    ImageUrl=imgurl;
  }

  String getImageName()
  {
    return ImageName;
  }

  void setImageName(String imgnm)
  {
    ImageName=imgnm;
  }

}