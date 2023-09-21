//
//  GithubAppApp.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

@main
struct GithubAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(basicinfo: basicGithubInfo(id: 1, name: "MockName", bio: "",followers: 2, following: 2, public_repos: 12, avatar_url: "MockImgUrl"))     }
    }
}
