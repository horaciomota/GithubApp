//
//  BasicInfoData.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation

func getBasicData() async throws -> basicGithubInfo {
    
    guard let baseUrl = URL(string: "https://api.github.com/users/horaciomota") else {
        print("Ops... Check your URL")
        throw URLError(.badURL)
    }
    
    let (data, _) = try await URLSession.shared.data(from: baseUrl)
    print("Fetching BasicData...[200]")
    
    let basicInfoResponse = try JSONDecoder().decode(
        basicGithubInfo.self, from: data )
            
    return basicInfoResponse
}
