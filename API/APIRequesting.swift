import Alamofire

typealias JSON = [String: Any]

protocol APIRequesting {
    var httpMethod: HTTPMethod { get }
    var requestURL: String { get }
    var requestData: [String: Any]? { get }
    var host: String? { get set}
    var headers: HTTPHeaders? { get }
    var onlyAuthorized: Bool { get }
}

extension APIRequesting {
    
//    if (self.onlyAuthorized) {
//
//    }
    
    @discardableResult
    func send(completion: ((_ json: JSON) -> Void)?) -> DataRequest? {
        var host = "http://52.59.185.179:8080/"
        let request = Alamofire.request(host + requestURL, method: httpMethod, parameters: requestData, headers: headers)
        request.responseJSON { (response) -> Void in
            self.handleResponse(response, then: { (response) in
                guard case .success (let data) = response , let json = data as? JSON else {
                    return
                }
                completion?(json) 
            })
        }
        return request
    }
    
    private func handleResponse(_ dataResponse: DataResponse<Any>, then completion: ((_ response: APIResponse) -> Void)?) {
        
        guard let httpCode = dataResponse.response?.statusCode, httpCode == 200 else {
            print("APIRequesting: Failed to parse JSON")
            completion?(.error(code: nil, message: nil))
            return
        }
        
        guard let response = dataResponse.result.value as? JSON else {
            print("APIRequesting: 200 response without data")
            completion?(.error(code: nil, message: nil))
            return
        }
        completion?(.error(code: 1, message: "1"))
        completion?(.success(data: response))
    }
    
}
