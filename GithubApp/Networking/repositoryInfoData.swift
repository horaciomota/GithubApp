//
//  repositoryInfoData.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation

func repositoryInfoData() async throws -> [repositoryInfo] {
    
    guard let baseurl = URL(string: "https://api.github.com/users/moraesjeremias/repos") else {
        print("Something wrong with your URL")
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: baseurl)
    print("Fetching repositories...[200]")

    
    let repositoryDataResponse = try JSONDecoder().decode([repositoryInfo].self, from: data)
    return repositoryDataResponse
    
    
}
