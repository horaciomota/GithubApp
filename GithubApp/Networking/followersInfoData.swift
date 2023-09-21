//
//  followersInfoData.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation


func followersInfoData() async throws -> [basicGithubInfo] {
    
    guard let baseurl = URL(string: "https://api.github.com/users/horaciomota/followers") else {
        print("Ops... something wrong with yours URL")
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: baseurl)
    
    let followersDataResponse = try JSONDecoder().decode([basicGithubInfo].self, from: data)
    print(followersDataResponse.count)
    return followersDataResponse
    
    
}
