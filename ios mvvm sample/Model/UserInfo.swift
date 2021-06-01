//
//  UserInfo.swift
//  ios mvvm sample
//
//  Created by JARVIS BAE on 2021/06/01.
//

protocol BuilderType {
    associatedtype UserInfo
    func build() -> UserInfo
}

extension UserInfo {
    typealias Builder = UserInfo
    
}
class UserInfo {
    
    private var userId: Int = 0
    private var userName: String? = nil
    private var lat: Double? = 0
    private var lng: Double? = 0
    
    func withUserId(_ userId: Int) -> UserInfo {
        self.userId = userId
        return self
    }
    
    func withUserName(_ userName: String) -> UserInfo {
        self.userName = userName
        return self
    }
    
    func withLat(_ lat: Double) -> UserInfo {
        self.lat = lat
        return self
    }
    
    func withLng(_ lng: Double) -> UserInfo {
        self.lng = lng
        return self
    }
    
    func build() -> UserInfo {
        let userInfo = UserInfo()
        userInfo.userId = self.userId
        userInfo.userName = self.userName
        userInfo.lat = self.lat
        userInfo.lng = self.lng
        return userInfo
    }

}

enum LoginError: Error {
    case defaultError
    case error(code: Int)
    var msg: String {
        switch self {
        case .defaultError:
            return "error"
        case .error(let code):
            return "\(code) error"
        }
    }
}
