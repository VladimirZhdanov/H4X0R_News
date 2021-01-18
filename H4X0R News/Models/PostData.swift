//
//  PostData.swift
//  H4X0R News
//
//  Created by mac on 18.01.2021.
//

struct Result: Codable {
    let hits: [Post]
}

struct Post: Codable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
