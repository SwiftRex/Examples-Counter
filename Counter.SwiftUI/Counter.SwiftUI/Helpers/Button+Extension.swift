import SwiftRex
import SwiftUI

extension Button where Label == Text {
    public init<S, SomeStore: StoreType>(_ title: S, store: SomeStore, event: SomeStore.ActionType) where S: StringProtocol {
        self = Button(title) { store.dispatch(event) }
    }
}
