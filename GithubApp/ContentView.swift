//
//  ContentView.swift
//  GithubApp
//
//  Created by Horacio Mota on 20/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle()
                    .frame(width: 105, height: 120)
                    .cornerRadius(12)
                
                VStack (alignment: .leading, spacing: 4) {
                    
                    
                    Text("Horacio Mota")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text("Mobile developer  -  Swift, TDD, CoreDATA")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(.secondary)
                        .padding(.bottom)
                    
                    HStack (spacing: 12) {
                        
                        VStack {
                            Text("Repositories")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text("50")
                                .font(.headline)
                                .fontWeight(.bold)
                        }
                        
                        VStack {
                            
                            Text("Followers")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            
                            Text("10k")
                                .font(.headline)
                                .fontWeight(.bold)
                      
                        }
                        
                        VStack {
                            
                            Text("Following")
                                .font(.subheadline)
                                .foregroundColor(.secondary)

                            
                            Text("20k")
                                .font(.headline)
                                .fontWeight(.bold)
                            
                        }
                        
                    }

                }
                
                
            }
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
                
                
                Text("Popular")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Text("Based on the popularity of repository")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                //Repository card
                
                HStack {
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .cornerRadius(12)
                    
                    VStack {
                        Text("Disney")
                    }
                    
                }
                
            }

        }.padding()
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
