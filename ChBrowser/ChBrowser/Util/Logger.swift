//
//  Logger.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import Foundation

class Logger {
    class func trace(_ text: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        let level: String = "📓Trace"
        log(fileName: file, line: line, function: function, level: level, text: text)
    }
    
    class func debug(_ text: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        let level: String = "📔Debug"
        log(fileName: file, line: line, function: function, level: level, text: text)
        
    }
    
    class func info(_ text: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        let level: String = "📘Info"
        log(fileName: file, line: line, function: function, level: level, text: text)
    }
    
    class func warn(_ text: String,
                    file: String = #file,
                    function: String = #function,
                    line: Int = #line) {
        let level: String = "📙Warn"
        log(fileName: file, line: line, function: function, level: level, text: text)
        
    }
    
    class func error(_ text: String,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line) {
        let level: String = "📕Error "
        log(fileName: file, line: line, function: function, level: level, text: text)
    }
    
    private class func log(fileName: String, line: Int, function: String, level: String, text: String) {
        print("[\(level)]\(text): \(function) in \(fileName) line:\(line)")
    }
}
