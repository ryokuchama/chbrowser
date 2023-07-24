//
//  VGridView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/15.
//

import SwiftUI

struct VGridView: View {
    let dict: [String:String]
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(Array(dict.keys), id: \.self) { element in
                NavigationLink(destination: ThreadsView(boardTitle: element, boardUrl: dict[element]!)) {
                    HStack{
                        Image(systemName: "folder.fill")
                        Text("\(element)")
                    }
                }
            }.padding()
        }
    }
}

struct VGridView_Previews: PreviewProvider {
    static var previews: some View {
        let dict: [String:String] = ["Amazon":"https://amazon.co.jp","Google":"https://google.co.jp"]
        VGridView(dict: dict)
    }
}
