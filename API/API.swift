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
    
    struct WorkShift: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "workshift" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
    }
    
    struct Events: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "events" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
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
    
    struct Employees: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "employees" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
    }
    
    struct EmployeeCard: APIRequesting {
        var httpMethod: HTTPMethod { return .get }
        var requestURL: String { return "employeecard" }
        var requestData: [String : Any]?
        var host: String?
        var headers: HTTPHeaders?
        var onlyAuthorized: Bool = true
        
        init (with params: [String: Any]?) {
            self.requestData = params
        }
    }
    
}
