//
//  ContentView.swift
//  H4X0R News
//
//  Created by mac on 18.01.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NewworkManager()
    
    var body: some View {
        
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }.navigationBarTitle("H4X0R news")
        }
        .onAppear(perform: {
            networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
