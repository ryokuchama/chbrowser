//
//  ListCellView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/24.
//

import SwiftUI

struct ListCellView: View {
    let title: String
    var body: some View {
        VStack {
            Text("\(title)").font(.title)
        }
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        let title: String = ""
        ListCellView(title: title)
    }
}
