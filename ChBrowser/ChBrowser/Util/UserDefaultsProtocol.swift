//
//  UserDefaultsProtocol.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

protocol UserDefaultsProtocol {
    func registerInitData()
    func getValue(forKey: UserDefaultKeys) -> Any?
    func setvalue(forKey: UserDefaultKeys, value: Any)
}
