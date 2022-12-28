//
//  HomeScreen.swift
//  Evyree
//
//  Created by William Chen on 2022/12/19.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        NavigationView{
            Text("test")
            Text("test2")
        }.navigationTitle("Home")

    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
