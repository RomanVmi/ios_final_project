import Alamofire

struct API {
    struct Login: APIRequesting {
        
        var httpMethod: HTTPMethod { return .post }
        var requestURL: String { return "login" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = false
        
        init (with hostname: String, and params: [String: Any]?) {
            self.host = hostname
            self.requestData = params
        }
    }
    
    struct History: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "history" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
        
        init (with params: [String: Any]?) {
            self.requestData = params
        }
    }
    
    struct Events: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "events" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
    }
    
    struct UsersRecords: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "employees" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
    }
    
//    struct AUTH: APIRequesting {
//
//        var httpMethod: HTTPMethod { return .post }
//        var requestURL: String { return "login" }
//        var requestData: [String : Any]?
//        var host: String
//        var headers: HTTPHeaders?
//
//        init (with hostname: String, and params: [String: Any]?, already auth: String?) {
//            self.host = hostname
//            self.requestData = params
//            if (auth != nil) {
//                let custom_headers: HTTPHeaders = [
//                    "auth_hash": auth!
//                ]
//                self.headers = custom_headers
//            }
//
//        }
//    }
    
}
