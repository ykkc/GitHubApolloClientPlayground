//
//  ContentView.swift
//  GitHubApolloClientPlayground
//
//  Created by ykkc on 2020/05/13.
//  Copyright © 2020 ykkc. All rights reserved.
//

import SwiftUI
import Apollo

struct ContentView: View {
    private static let token = "<GitHub Token>"
    
    @State var name: String?
    @State var email: String?
    @State var thumbnail: Data?
    
    let apollo: ApolloClient? = {
        let configration = URLSessionConfiguration.default
        configration.httpAdditionalHeaders = ["Authorization": "Bearer \(token)"]
        guard let url = URL(string: "https://api.github.com/graphql") else { return nil }
        return ApolloClient(
            networkTransport: HTTPNetworkTransport(url: url, session: URLSession(configuration: configration))
        )
    }()
    
    var body: some View {
        VStack {
            Text("\(name ?? "user name")")
            Text("\(email ?? "email")")
            ThumbnailImage
        }.onAppear {
            self.apollo?.fetch(query: ShowViewerQuery()) { result in
                guard let data = try? result.get().data else { return }
                self.name = data.viewer.name
                self.email = data.viewer.email
                self.downloadImage(url: data.viewer.avatarUrl)
            }
        }
    }
    
    private var ThumbnailImage: some View {
        if let imageData = self.thumbnail, !imageData.isEmpty {
            return Image(uiImage: UIImage(data: imageData)!)
        } else {
            return Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!)
        }
    }
    
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else { return }

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.thumbnail = data
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
