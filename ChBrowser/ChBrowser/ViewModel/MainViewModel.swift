//
//  MainViewModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var list: [String:String] = [:]
    var model: MainModelProtocol?
    
    func initialize() {
        Task {
            let result = await model?.initialize()
            guard let _result = result else {
                Logger.error("init failed")
                return
            }
            DispatchQueue.main.async {
                self.list = _result
            }
        }
    }
}
