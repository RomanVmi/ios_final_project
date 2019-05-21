
class User {
    
    var auth_hash: String
    var hostname: String
    var role: String
    
    init?(from json: JSON) {
        guard
            let auth_hash = json["id"] as? Int,
            let hostname = json["username"] as? String,
            let role = json["email"] as? String
            else {
                return nil
        }
        
        //self.id = id
        //self.username = username
        //self.email = email
    }
    
}

