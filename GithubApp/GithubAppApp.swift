//
//  GithubAppApp.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

@main
struct GithubAppApp: App {
    
    @StateObject var basicInfoManager = BasicInfoManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(basicInfoManager)
        }
    }
}
