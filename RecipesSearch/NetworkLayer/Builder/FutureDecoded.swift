//  FutureDecoded.swift

import Foundation

extension Future where Value == Data {
    func decoded<NextValue: Decodable>(toType type: NextValue.Type, withKeyPath keyPath: String = "", debug: Bool = false) throws -> Future<NextValue> {
        return transformed {
            do {
                return try JSONDecoder().decode(NextValue.self, from: $0)
            } catch {
                print("Decode response error:>>", error)
                throw error
            }
        }
    }
}
