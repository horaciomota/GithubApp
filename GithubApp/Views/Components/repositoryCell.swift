//
//  repositoryCell.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import SwiftUI

struct repositoryCell: View {
    
    @EnvironmentObject var basicInfoManager: BasicInfoManager
    
    @State var repositories: [repositoryInfo] = []
    
    var body: some View {


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
        
        ScrollView (showsIndicators: false){
            ForEach(repositories) { repository in
                HStack (alignment: .top) {
                    HStack{
                        Rectangle()
                            .frame(maxWidth:3, maxHeight: .infinity)
                            .cornerRadius(12)
                    }
                    
                    VStack (alignment: .leading, spacing: 8) {
                        Text("DisneyPlus-Swift-App ")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        VStack(alignment: .leading, spacing: 8) {
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
                            
                            Text(repository.description ?? "Non-descripted repository")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                    }
                    
                }
                .frame(maxHeight: 120)
                .padding(.top, 8)
           
                
                
            }
        }
        .task {
            do {
                repositories = try await repositoryInfoData()
            }catch {
                print("Something wrong with your data, check error: \(error)")
            }
        }
        
        


    }
    
}


struct repositoryCell_Previews: PreviewProvider {
    static var previews: some View {
        repositoryCell()
    }
}
