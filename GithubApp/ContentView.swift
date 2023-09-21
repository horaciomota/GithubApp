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




