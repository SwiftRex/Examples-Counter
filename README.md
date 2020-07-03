# SwiftRex Counter Examples

In this repository:

- **Counter.xcworkspace**: Main workspace containing both projects.
- **Counter.UIKit**: UIKit example using RxSwift (RxSwiftRex)
- **Counter.SwiftUI**: SwiftUI example using Combine (CombineRex)

Both examples share:
- Dependency injection (World.swift)
- Log logic (LoggerMiddleware.swift)
- AppState, AppAction, Reducers and Middlewares (AppModule.swift)
- Counter View Model (CounterViewModel.swift)

The exclusive code:
- Store class (Store.swift)
- SwiftUI View / UIViewController + Storyboard
