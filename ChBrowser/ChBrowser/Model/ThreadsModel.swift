//
//  ThreadsModel.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/24.
//

import Foundation

class ThreadsModel: ThreadsModelProtocol {
    
    var parser: ParserProtocol?
    var httpClient: HttpClientProtocol?
    
    func initialize(url: String) async {
        let txt: String = url+"subject.txt"
        Logger.info("URL: \(txt)")
        guard let result = await httpClient!.get(body: txt) else {
            Logger.error("failed to get subject.txt")
            return
        }
        guard let toString: String = String(data: result, encoding: .shiftJIS) else {
            Logger.error("Cast failed: Data to String")
            return
        }
        toString.enumerateLines{line,stop in
            Logger.info(line)
        }
    }
    
    private func getThreadTitle(text: String) -> String? {
        guard let start = text.firstIndex(of: ">") else {
            return nil
        }
        guard let last = text.lastIndex(of: "(") else {
            return nil
        }
        
    }
    
    private func getResponseCount(text: String) -> Int {
        
    }
    
    private func getDatNumber(text: String) -> String{
        
    }
}
