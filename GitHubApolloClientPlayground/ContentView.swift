//
//  ContentView.swift
//  GitHubApolloClientPlayground
//
//  Created by ykkc on 2020/05/13.
//  Copyright © 2020 ykkc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("user name")
            Text("email")
            Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
