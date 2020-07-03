import RxSwiftRex
import Foundation
import SwiftRex

class Store: ReduxStoreBase<AppAction, AppState> {
    private init() {
        super.init(
            subject: .rx(initialValue: .empty),
            reducer: Reducer.app,
            middleware: appMiddleware
        )
    }

    static let instance = Store()
}
