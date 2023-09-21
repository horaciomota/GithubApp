//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var basicInfoManager: BasicInfoManager

    var body: some View {
        VStack {
            ProfileBioView()
            //list of repositories
            
            VStack (alignment: .leading) {
                
                Button {
                    
                } label: {
                    Text("Follow")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    
                    Text("Popular")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text("Based on the popularity of repository")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 8)
                
                //Repository card
                
                HStack {
                    Rectangle()
                        .frame(maxWidth:3, maxHeight: .infinity)
                        .cornerRadius(12)
                    
                    VStack (alignment: .leading, spacing: 8) {
                        
                        
                        Text("DisneyPlus-Swift-App ")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                       
                        HStack {
                            Image(systemName: "circle.fill")
                                .foregroundColor(Color.red)
                            
                            Text("Swift")
                                .font(.subheadline)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                            
                            Text("3")
                                .font(.subheadline)
                        }
                        
                        
                        Text("Making Disney+ alit better, but not so kid-friendly. A complete redesign of Disney+ App in Swift")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.leading)
                    }
                    
                }
                .frame(maxHeight: 100)
                .padding(.top, 8)
                
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
    
    }
    

    
    
}


struct basicGithubInfo: Codable, Identifiable {
    
    let id: Int
    let name: String
    let bio: String
    let followers: Int
    let following: Int
    let public_repos: Int
    let avatar_url: String
    
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Crie uma instância simulada de BasicInfoManager para o preview
        let basicInfoManager = BasicInfoManager()
        
        return ContentView()
            .environmentObject(basicInfoManager)
    }
}



