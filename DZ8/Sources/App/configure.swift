import Vapor

public func configure(_ app: Application) async throws {
    app.jwt.signers.use(.hs256(key: "secret"))
    try routes(app)
}
