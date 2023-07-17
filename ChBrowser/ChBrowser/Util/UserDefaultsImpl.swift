//
//  UserDefalutsHandler.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

final class UserDefaultsImpl: UserDefaultsProtocol {
    
    private var _default: UserDefaults = UserDefaults.standard
    
    func registerInitData() {
        self.setvalue(forKey: UserDefaultKeys.bbsMenuUrlsString, value: "https://sannan.nl/sannan_bbsmenu.html")
        self.setvalue(forKey: UserDefaultKeys.bbsResultsString, value: "")
    }
    
    func getValue(forKey: UserDefaultKeys) -> Any? {
        return _default.object(forKey: forKey.rawValue)
    }
    
    func setvalue(forKey: UserDefaultKeys, value: Any) {
        _default.set(value, forKey: forKey.rawValue)
    }
}
