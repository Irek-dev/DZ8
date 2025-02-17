import Vapor

final class User: Content {
    var id: Int
    var username: String
    var email: String
    var password: String
    var secretResponse: String
    var token: String

    init(id: Int, name: String, email: String, password: String, response: String, token: String) {
        self.id = id
        self.username = name
        self.email = email
        self.password = password
        self.secretResponse = response
        self.token = token
    }
    
    func reloadToken(token: String) {
        self.token = token
    }
}
