//
//  VGridView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/15.
//

import SwiftUI

struct VGridView: View {
    let array: [String]
    let onEvent: ((String)->(Void))?
    private let columns = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        LazyVGrid(columns: columns, alignment: .leading) {
            ForEach(array, id: \.self) { element in
                HStack{
                    Image(systemName: "folder.fill")
                    Text("\(element)")
                }
            }.padding()
        }
//        .onTapGesture {
//
//        }
    }
}

struct VGridView_Previews: PreviewProvider {
    static var previews: some View {
        let array: [String] = ["Apple", "Boeing", "Cisco", "Dow", "EA", "GS"]
        VGridView(array: array, onEvent: nil)
    }
}
