//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Rectangle()
                .frame(width: 105, height: 120)
                .cornerRadius(12)
            
            VStack (alignment: .leading) {
                
                
                Text("Horacio Mota")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Mobile developer  -  Swift")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                HStack (spacing: 12) {
                    
                    VStack {
                        Text("50")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("Repositories")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack {
                        Text("10k")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("Followers")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    VStack {
                        Text("20k")
                            .font(.headline)
                            .fontWeight(.bold)
                        
                        Text("Following")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                }
                .cornerRadius(12)

            }
            
            
        }.padding()
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
