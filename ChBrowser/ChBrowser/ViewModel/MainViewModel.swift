//
//  MainViewModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var list: [String:String] = [:]
    private var model: MainModelProtocol?
    
    func initialize() {
        
    }
}
