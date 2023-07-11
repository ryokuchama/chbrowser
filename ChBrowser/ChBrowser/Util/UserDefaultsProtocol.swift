//
//  UserDefaultsProtocol.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

protocol UserDefaultsProtocol {
    func getValue(forKey: String) -> Any?
    func setvalue(forKey: String, value: Any)
}
