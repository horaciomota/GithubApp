//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var basicInfoManager: BasicInfoManager
    
    @State private var search = ""

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
        }.searchable(text: $search) {
            Button("Search Followers") {
                searchGithubUser()
            }
        }
    }
    
    func searchGithubUser() {
        Task {
            do {
                guard let baseUrl = URL(string: "https://api.github.com/users/\(search)") else {
                    print("Ops... Check your URL")
                    return
                }

                let (data, _) = try await URLSession.shared.data(from: baseUrl)
                print("Fetching Followers Data...")
                
                let userResponse = try JSONDecoder().decode(basicGithubInfo.self, from: data)
                // Use os dados dos seguidores conforme necessário
                
                if let userName = userResponse.bio {
                                // Faça algo com o nome do usuário (userName)
                                print("User Name: \(userName)")
                            } else {
                                print("User Name not found in response.")
                            }
                
            } catch {
                print("Error: \(error)")
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
