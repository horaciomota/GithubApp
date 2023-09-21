//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var basicinfo:basicGithubInfo
    
    var body: some View {
        VStack {
            HStack{
                
                AsyncImage(url: URL(string: basicinfo.avatar_url)) { avatar in
                    if let image = avatar.image {
                        
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .cornerRadius(12)

                    }
                    else {
                        Rectangle()
                            .frame(width: 105, height: 120)
                            .cornerRadius(12)
                    }
                }
                
           
                
                VStack (alignment: .leading, spacing: 4) {
                    
                    
                    Text(basicinfo.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text(basicinfo.bio)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                        .multilineTextAlignment(.leading)
                    
                    HStack (spacing: 12) {
                        
                        VStack {
                            Text("Repositories")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(String(basicinfo.public_repos))
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                        VStack {
                            
                            Text("Followers")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            
                            Text(String(basicinfo.followers))
                                .font(.headline)
                                .fontWeight(.bold)
                      
                        }
                        
                        VStack {
                            
                            Text("Following")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            
                            Text(String(basicinfo.following))
                                .font(.headline)
                                .fontWeight(.bold)
                            
                        }
                        
                    }

                }
                
                
            }
            .frame(maxHeight: 100)
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
                    basicinfo = try await getBasicData()
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
        ContentView(basicinfo: basicGithubInfo(id: 1, name: "MockName", bio: "",followers: 2, following: 2, public_repos: 12, avatar_url: "MockImgUrl"))
    }
}
