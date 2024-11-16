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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.clientId;
    data['consultant_id'] = this.consultantId;
    data['channel'] = this.channel;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.consultant != null) {
      data['consultant'] = this.consultant!.toJson();
    }
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['avatar_url'] = this.avatarUrl;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['f_name'] = this.fName;
    data['l_name'] = this.lName;
    data['display_name'] = this.displayName;
    data['avatar_url'] = this.avatarUrl;
    return data;
  }
}
