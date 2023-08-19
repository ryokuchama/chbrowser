//
//  ListCellView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/24.
//

import SwiftUI

struct ListCellView: View {
    let title: String
    let resCount: Int
    let datNumber: String
    let boardName: String
    var body: some View {
        VStack {
            HStack {
                Text("\(title)").font(.body)
                Spacer()
            }
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let title: String = ""
        let resCount: Int = 0
        let datNumber: String = "00000000"
        let boardName = ""
        ListCellView(title: title, resCount: resCount, datNumber: datNumber, boardName: boardName)
    }
}
