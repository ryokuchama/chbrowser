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
    @ObservedObject var viewModel: ThreadsViewModel = .init()
    
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.threads, id: \.self.datNumber) { element in
                    ListCellView(title: element.title, resCount: element.responseCount, datNumber: element.datNumber, boardName: boardTitle)
                    Divider()
                }
            }
        }.onAppear{
            let http: HttpClient = .init()
            let model: ThreadsModel = .init()
            model.httpClient = http
            viewModel.model = model
            viewModel.initialize(url: boardUrl)
        }
    }
}

struct ThreadsView_Previews: PreviewProvider {
    static var previews: some View {
        let title: String = "title"
        let url: String = "https://google.co.jp"
        ThreadsView(boardTitle: title, boardUrl: url)
    }
}
