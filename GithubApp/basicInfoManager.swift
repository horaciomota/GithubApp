//
//  basicInfoManager.swift
//  GithubApp
//
//  Created by Horacio Mota on 21/09/2023.
//

import Foundation
import SwiftUI

class BasicInfoManager: ObservableObject {
    @Published var basicinfo:basicGithubInfo?

    init() {
        self.basicinfo = nil
    }
}
