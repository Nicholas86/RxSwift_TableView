//
//  Protocol.swift
//  
//
//  Created by apple on 17/4/12.
//
//

import RxSwift
import RxCocoa

enum ValidationResult {
    case ok(message:String)
    case empty
    case validating
    case failed(message:String)
}

enum SignupState {
    case signupState(signedUp:Bool)
}

protocol GitHubAPI {
    func usernameAvailable(userName:String) -> Observable<Bool>
    func signup(userName:String,passWord:String) -> Observable<Bool>
}

protocol GitHubValidationService {
    func validateUsername(userName:String) -> Observable<ValidationResult>
    func validationPassWord(passWord:String) -> ValidationResult
    func validationRepeatedPassword(passWord:String,repeatedPassword: String) -> ValidationResult
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}






