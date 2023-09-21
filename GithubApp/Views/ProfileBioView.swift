//
//  ProfileBioView.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import SwiftUI

struct ProfileBioView: View {
    
    @EnvironmentObject var basicInfoManager: BasicInfoManager

    var body: some View {
        HStack{
            
            AsyncImage(url: URL(string: basicInfoManager.basicinfo?.avatar_url ?? "")) { avatar in
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
                
                
                Text(basicInfoManager.basicinfo?.name ?? "")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(basicInfoManager.basicinfo?.bio ?? "")
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
                        
                        Text(String(basicInfoManager.basicinfo?.public_repos ?? 1 ))
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    
                    VStack {
                        
                        Text("Followers")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        
                        Text(String(basicInfoManager.basicinfo?.followers ?? 2))
                            .font(.headline)
                            .fontWeight(.bold)
                        
                    }
                    
                    VStack {
                        
                        Text("Following")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        
                        Text(String(basicInfoManager.basicinfo?.following ?? 3))
                            .font(.headline)
                            .fontWeight(.bold)
                        
                    }
                    
                }
                
            }
            
            
        }
        .frame(maxHeight: 100)
    }
}

struct ProfileBioView_Previews: PreviewProvider {
    static var previews: some View {
        // Crie uma instância simulada de BasicInfoManager para o preview
        let basicInfoManager = BasicInfoManager()
        
        return ProfileBioView()
            .environmentObject(basicInfoManager)
    }
}

