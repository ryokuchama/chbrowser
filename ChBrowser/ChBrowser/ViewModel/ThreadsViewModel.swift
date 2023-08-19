//
//  ThreadsViewModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/22.
//

import Foundation

class ThreadsViewModel: ObservableObject {
    
    @Published var threads: [ThreadsStruct] = []
    var model: ThreadsModelProtocol?
    
    func initialize(url: String) {
        Task {
            guard let result = await model!.initialize(url: url) else {
                Logger.error("init failed")
                return
            }
            DispatchQueue.main.async {
                self.threads = result
            }
        }
    }
}
