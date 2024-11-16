class CreateChat {
  int? id;
  int? clientId;
  int? consultantId;
  String? channel;
  String? createdAt;
  String? updatedAt;
  Consultant? consultant;
  Client? client;

  CreateChat(
      {this.id,
      this.clientId,
      this.consultantId,
      this.channel,
      this.createdAt,
      this.updatedAt,
      this.consultant,
      this.client});

  CreateChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clientId = json['client_id'];
    consultantId = json['consultant_id'];
    channel = json['channel'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    consultant = json['consultant'] != null
        ? new Consultant.fromJson(json['consultant'])
        : null;
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
  }
}

class Consultant {
  int? id;
  String? fName;
  String? lName;
  String? avatarUrl;

  Consultant({this.id, this.fName, this.lName, this.avatarUrl});

  Consultant.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    avatarUrl = json['avatar_url'];
  }
}

class Client {
  int? id;
  String? fName;
  String? lName;
  String? displayName;
  Null avatarUrl;

  Client({this.id, this.fName, this.lName, this.displayName, this.avatarUrl});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fName = json['f_name'];
    lName = json['l_name'];
    displayName = json['display_name'];
    avatarUrl = json['avatar_url'];
  }
}
