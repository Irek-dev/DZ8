import Foundation

struct UserDTO: Codable {
    let username: String
    let password: String
    let email: String
    let secretResponse: String
}
