import Foundation
import SwiftRex

enum CounterViewModel {
    static func viewModel<S: StoreType>(store: S) -> StoreProjection<ViewEvent, ViewState>
    where S.ActionType == AppAction, S.StateType == AppState {
        store.projection(action: Self.handleViewEvent, state: Self.prepareViewState)
    }

    static func handleViewEvent(_ viewEvent: ViewEvent) -> AppAction? {
        switch viewEvent {
        case .tapMinus: return .counter(.decrease)
        case .tapPlus: return .counter(.increase)
        }
    }

    static func prepareViewState(from state: AppState) -> ViewState {
        ViewState(
            title: NSLocalizedString("Yet another Redux counter", comment: "Title for counter view"),
            // SwiftUI doesn't need NSLocalizedString. You can pass the string as in the key or, for more control, the LocalizedStringKey
            // For either cases, or UIKit NSLocalizedString, please use namespaced constants to store that. That'd also help genstrings command-line.
            counterText: NumberFormatter().string(from: .init(value: state.counter.currentCount)) ?? "0",
            minusButtonTitle: "➖",
            plusButtonTitle: "➕"
        )
    }

    // Having ViewEvents and ViewState is totally optional, but recommended to avoid Model in the ViewController
    // There's an extra effort to make a store projection, but at the same time gives a place to put UI formatting logic

    enum ViewEvent {
        case tapPlus
        case tapMinus
    }

    struct ViewState: Equatable {
        let title: String
        let counterText: String
        let minusButtonTitle: String
        let plusButtonTitle: String

        static var empty: ViewState {
            .init(title: "Yet another Redux counter", counterText: "0", minusButtonTitle: "➖", plusButtonTitle: "➕")
        }
    }
}
