//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI
import Foundation

struct AppSettings {
    static var search: String = ""
}

struct ContentView: View {
    
    @EnvironmentObject var basicInfoManager: BasicInfoManager
    @State var searchText: String = ""

    
    var body: some View {
        NavigationStack {
            VStack {
                ProfileBioView()
                
                //list of repositories
                VStack (alignment: .leading) {
                    
                    //Follow button component
                    followButton()
                    
                    //Repository component
                    repositoryCell()
                    
                    Spacer()
                    
                }
                .padding(.top, 8)
                
            }.padding()
                .task {
                    do {
                        basicInfoManager.basicinfo = try await getBasicData()
                    }catch {
                        print("Something went wrong with your data, error: \(error)")
                    }
                }
        }.searchable(text: $searchText) {
            Button("Search Followers") {
                searchGithubUser(searchText: searchText)
            }
        }
    }
    
    
    
}
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            // Crie uma instância simulada de BasicInfoManager para o preview
            let basicInfoManager = BasicInfoManager()
            
            return ContentView()
                .environmentObject(basicInfoManager)
        }
    }
    

