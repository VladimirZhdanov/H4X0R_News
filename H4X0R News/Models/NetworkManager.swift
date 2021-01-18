//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by mac on 18.01.2021.
//

import Foundation

class NewworkManager: ObservableObject {
    
   @Published var posts = [Post]()
    
    func fetchData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                           let result =  try decoder.decode(Result.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = result.hits
                            }
                        } catch {
                            print("Some problem to fetch data from the server: \(error)")
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
