import Foundation

func searchGithubUser(searchText: String) {
    guard !searchText.isEmpty else {
        print("Search text is empty.")
        return
    }

    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api.github.com"
    urlComponents.path = "/users/\(searchText)"
    
    guard let endpoint = urlComponents.url else {
        print("Ops... Check your URL")
        return
    }
    
    Task {
        do {
            let (data, _) = try await URLSession.shared.data(from: endpoint)
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
