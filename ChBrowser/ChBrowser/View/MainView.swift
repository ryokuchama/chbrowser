//
//  MainView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    init() {
        self.viewModel = .init()
        let model: MainModel = .init()
        let http: HttpClient = .init()
        let parser: KannaHandler = .init()
        model.httpClient = http
        model.parser = parser
        viewModel.model = model
    }
    var body: some View {
        NavigationView {
            ScrollView {
                VGridView(dict: viewModel.list)
            }
        }.onAppear() {
            viewModel.initialize()
        }.navigationTitle(viewModel.list["title"] ?? "三男にようこそ")
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
