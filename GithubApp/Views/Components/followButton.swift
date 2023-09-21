//
//  followButton.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import SwiftUI


struct followButton: View {
    var body: some View {
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
    }
}
