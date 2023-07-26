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
    
    func initialize(url: String) async -> [ThreadsStruct]? {
        let txt: String = url+"subject.txt"
        Logger.info("URL: \(txt)")
        guard let result = await httpClient!.get(body: txt) else {
            Logger.error("failed to get subject.txt")
            return nil
        }
        guard let toString: String = String(data: result, encoding: .shiftJIS) else {
            Logger.error("Cast failed: Data to String")
            return nil
        }
        var threads: [ThreadsStruct] = []
        toString.enumerateLines{line,stop in
            Logger.info(line)
            guard let title = self.getThreadTitle(text: line) else {
                return
            }
            guard let resNum = self.getResponseCount(text: line) else {
                return
            }
            guard let dat = self.getDatNumber(text: line) else {
                return
            }
            let threadInfo: ThreadsStruct = .init(title: title, responseCount: resNum, datNumber: dat)
            threads.append(threadInfo)
        }
        if threads.count == 0 {
            Logger.error("threads not found")
            return nil
        }
        return threads
    }
    
    private func getThreadTitle(text: String) -> String? {
        guard let result = text.range(of: "<>") else {
            Logger.error("text not found.")
            return nil
        }
        let finalString = text[result.upperBound...]
        guard let index = text.lastIndex(of: " ") else {
            Logger.error("text not found.")
            return nil
        }
        Logger.info("finalString: \(finalString[...index])")
        return String(finalString)
    }
    
    private func getResponseCount(text: String) -> Int? {
        guard let result = text.lastIndex(of: "(") else {
            Logger.error("text not found.")
            return nil
        }
        var targetString = text[result...]
        targetString.removeAll(where: {$0 == "(" || $0 == ")"})
        guard let number = Int(targetString) else {
            Logger.error("cast failed")
            return nil
        }
        Logger.info("finalCount: \(number)")
        return number
    }
    
    private func getDatNumber(text: String) -> String? {
        guard let endIdx = text.firstIndex(of: ".") else {
            Logger.error("Dat number not found")
            return nil
        }
        let result = text[...endIdx]
        Logger.info("result: \(result)")
        return String(result)
    }
}
