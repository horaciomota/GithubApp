//
//  repositoryInfoModel.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation

struct repositoryInfo: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let description: String?
    let stargazers_count: Int
    let language: String?
    
}
