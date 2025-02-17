import Vapor
import JWTKit

struct UserController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let users = routes.grouped("auth")
        
        users.post("signup", use: createUser)
        users.post("signin", use: signIn)
        
        let protected = users.grouped(JWTMiddleware())
        
        protected.get("check", use: checkToken)
        protected.get("user", use: getUser)
        protected.delete("drop", use: deleteUser)
    }
    
    @Sendable
    func createUser(req: Request) async throws -> RegLogDTO {
        let input = try req.content.decode(UserDTO.self)
        guard Vars.users.first(where: { $0.username == input.username }) == nil else {
            throw Abort(.badRequest, reason: "Username is already taken")
        }
        let newUser = User(id: Vars.countID(), name: input.username, email: input.email, password: input.password, response: input.secretResponse, token: "")
        newUser.reloadToken(token: try await getToken(req: req, user: newUser))
        Vars.users.append(newUser)
        return RegLogDTO(id: newUser.id, token: newUser.token)
    }
    
    @Sendable
    func signIn(req: Request) async throws -> RegLogDTO {
        let input = try req.content.decode(UserDTO.self)
        guard let user = Vars.users.first(where: { $0.username == input.username && $0.password == input.password }) else {
            throw Abort(.unauthorized, reason: "Invalid username or password")
        }
        user.reloadToken(token: try await getToken(req: req, user: user))
        return RegLogDTO(id: user.id, token: user.token)
    }
    
    @Sendable
    func checkToken(req: Request) async throws -> HTTPStatus {
        _ = try req.auth.require(UserPayload.self)
        return .ok
    }
    
    @Sendable
    func getUser(req: Request) async throws -> User {
        let payload = try req.auth.require(UserPayload.self)
        guard let user = Vars.users.first(where: { $0.id == payload.userID }) else {
            throw Abort(.notFound)
        }
        return user
    }
    
    @Sendable
    func deleteUser(req: Request) async throws -> HTTPStatus {
        let payload = try req.auth.require(UserPayload.self)
        guard let index = Vars.users.firstIndex(where: { $0.id == payload.userID }) else {
            throw Abort(.notFound, reason: "User not found")
        }
        Vars.users.remove(at: index)
        return .ok
    }
    
    func getToken(req: Request, user: User) async throws -> String {
        let payload = UserPayload(userID: user.id)
        return try req.jwt.sign(payload)
    }
}
