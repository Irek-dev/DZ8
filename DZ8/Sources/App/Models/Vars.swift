import Foundation

class Vars {
    private static var counterID = 0
    static var users: [User] = []
    
    static func countID() -> Int {
        counterID += 1
        return counterID
    }
}
