//
//  MainView.swift
//  ChBrowser
//
//  Created by 梶健将 on 2023/07/11.
//

import SwiftUI

struct MainView: View {
    let testArray = ["Apple", "Boeing", "Cisco", "Dow", "EA", "GS"]
    var body: some View {
        NavigationView {
//            NavigationLink(destination: , label: ) {
            ScrollView {
                VGridView(array: testArray, onEvent: nil)
            }
//            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
