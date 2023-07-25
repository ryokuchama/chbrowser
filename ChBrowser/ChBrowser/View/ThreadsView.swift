//
//  ThreadsView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/22.
//

import SwiftUI

struct ThreadsView: View {
    let boardTitle: String
    let boardUrl: String
    var body: some View {
        Text("Board Name: \(boardTitle), URL:\(boardUrl)")
    }
}

struct ThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        let title: String = "title"
        let url: String = "https://google.co.jp"
        ThreadsView(boardTitle: title, boardUrl: url)
    }
}
