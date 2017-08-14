//
//  DefaultImplementations.swift
//  RxExample
//
//  Created by Krunoslav Zaher on 12/6/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
#endif

import struct Foundation.CharacterSet
import struct Foundation.URL
import struct Foundation.URLRequest
import struct Foundation.NSRange
import class Foundation.URLSession
import func Foundation.arc4random

//MARK:GitHubValidationService  的Delehate
class GitHubDefaultValidationService: GitHubValidationService {
    let API: GitHubAPI

    static let sharedValidationService = GitHubDefaultValidationService(API: GitHubDefaultAPI.sharedAPI)

    init (API: GitHubAPI) {
        self.API = API
    }
    
    // validation
    
    let minPasswordCount = 5
    //用户名协议
    func validateUsername(userName: String) -> Observable<ValidationResult> {
        if userName.characters.count == 0 {
            return .just(.empty)
        }
        
        // this obviously won't be
        if userName.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) != nil {
            return .just(.failed(message: "Username can only contain numbers or digits"))
        }
        
        let loadingValue = ValidationResult.validating
        
        return API
            .usernameAvailable(userName: userName)
            .map { available in
                if available {
                    return .ok(message: "Username available")
                }
                else {
                    return .failed(message: "Username already taken")
                }
            }
            .startWith(loadingValue)
    }
    //密码的协议
    func validationPassWord(passWord: String) -> ValidationResult {
        let numberOfCharacters = passWord.characters.count
        if numberOfCharacters == 0 {
            return .empty
        }
        
        if numberOfCharacters < minPasswordCount {
            return .failed(message: "Password must be at least \(minPasswordCount) characters")
        }
        
        return .ok(message: "Password acceptable")
    }
    //再次输入密码,验证密码协议
    func validationRepeatedPassword(passWord: String, repeatedPassword: String) -> ValidationResult {
        if repeatedPassword.characters.count == 0 {
            return .empty
        }
        
        if repeatedPassword == passWord {
            return .ok(message: "Password repeated")
        }
        else {
            return .failed(message: "Password different")
        }
    }
}

//MARK:GitHubAPI  的Delegate
class GitHubDefaultAPI : GitHubAPI {
    let URLSession: Foundation.URLSession

    static let sharedAPI = GitHubDefaultAPI(
        URLSession: Foundation.URLSession.shared
    )

    init(URLSession: Foundation.URLSession) {
        self.URLSession = URLSession
    }
    
    
    //GitHubAPI 的代理方法
    func usernameAvailable(userName username: String) -> Observable<Bool> {
        // this is ofc just mock, but good enough
        
        let url = URL(string: "https://github.com/\(username.URLEscaped)")!
        let request = URLRequest(url: url)
        return self.URLSession.rx.response(request: request)
            .map { (response, _) in
                return response.statusCode == 404
            }
            .catchErrorJustReturn(false)
    }
   
    func signup(userName: String, passWord: String) -> Observable<Bool> {
        // this is also just a mock
        let signupResult = arc4random() % 5 == 0 ? false : true
        
        return Observable.just(signupResult)
            .delay(1.0, scheduler: MainScheduler.instance)
    }
    
}






