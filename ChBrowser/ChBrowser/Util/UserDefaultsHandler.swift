//
//  UserDefalutsHandler.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

final class UserDefaultsImpl: UserDefaultsProtocol {
    
    private var _default: UserDefaults = UserDefaults.standard
    
    func getValue(forKey: String) -> Any? {
        return _default.object(forKey: forKey)
    }
    
    func setvalue(forKey: String, value: Any) {
        _default.set(value, forKey: forKey)
    }
}
