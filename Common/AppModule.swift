import Foundation
import SwiftRex

/// App Actions that will run through the Store in order to trigger side-effects or help reducing the state
enum AppAction {
    case counter(CounterAction)
}

struct AppState: Equatable {
    var counter: CounterState

    static var empty: AppState {
        .init(counter: .empty)
    }
}

enum CounterAction {
    case increase
    case decrease
}

struct CounterState: Equatable {
    var currentCount: Int

    static var empty: CounterState {
        .init(currentCount: 0)
    }
}

/// Counter app reducer. Given some action and current state, calculates the new state
/// In this case, handles only CounterActions
extension Reducer where ActionType == CounterAction, StateType == CounterState {
    static let counter = Reducer { action, state in
        var state = state
        switch action {
        case .increase:
            state.currentCount += 1
        case .decrease:
            state.currentCount -= 1
        }
        return state
    }
}

/// Main app reducer. Given some action and current state, calculates the new state
/// In this case, compose all other reducers together, but first, lift them to the
/// Global AppState and AppAction so they can be plugged together. This is usually
/// done by providing KeyPaths to the local entities inside the global ones.
extension Reducer where ActionType == AppAction, StateType == AppState {
    static let app = Reducer<CounterAction, CounterState>.counter.lift(
        action: \AppAction.counter,
        state: \AppState.counter
    )
}

let appMiddleware = IdentityMiddleware<AppAction, AppAction, AppState>()
    .logger()
