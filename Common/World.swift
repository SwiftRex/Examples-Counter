import Foundation
import SwiftRex

struct World {
    let store: () -> AnyStoreType<AppAction, AppState>
}

extension World {
    static let `default` = World(
        store: { Store.instance.eraseToAnyStoreType() }
    )
}
