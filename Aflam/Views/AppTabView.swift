//
//  AppTabView.swift
//  Aflam
//
//  Created by Mohamed Ali Boutaleb on 6/2/22.
//

import SwiftUI

struct AppTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
