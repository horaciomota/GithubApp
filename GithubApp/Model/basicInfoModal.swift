//
//  basicInfoModal.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation

struct basicGithubInfo: Codable, Identifiable {
    
    let id: Int
    let name: String
    let bio: String
    let followers: Int
    let following: Int
    let public_repos: Int
    let avatar_url: String
    
}

