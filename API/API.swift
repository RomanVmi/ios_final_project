import Alamofire

struct API {
    struct Login: APIRequesting {
        
        var httpMethod: HTTPMethod { return .post }
        var requestURL: String { return "login" }
        var requestData: [String : Any]?
        var host: String
        var headers: HTTPHeaders?
        
        init (with hostname: String, and params: [String: Any]?) {
            self.host = hostname
            self.requestData = params
        }
    }
    
    struct AUTH: APIRequesting {
        
        var httpMethod: HTTPMethod { return .post }
        var requestURL: String { return "login" }
        var requestData: [String : Any]?
        var host: String
        var headers: HTTPHeaders?
        
        init (with hostname: String, and params: [String: Any]?, already auth: String?) {
            self.host = hostname
            self.requestData = params
            if (auth != nil) {
                let custom_headers: HTTPHeaders = [
                    "auth_hash": auth!
                ]
                self.headers = custom_headers
            }
            
        }
    }
    
}
