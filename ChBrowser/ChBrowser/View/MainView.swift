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
//            NavigationLink(destination: , label: ) {
            ScrollView {
                VGridView(array: Array(viewModel.list.keys), onEvent: nil)
            }
//            }
        }.onAppear() {
            viewModel.initialize()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
