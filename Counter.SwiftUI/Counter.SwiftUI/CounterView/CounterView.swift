import CombineRex
import SwiftUI

struct CounterView: View {
    /*
     * Store can be inject using @ObjectBinding
     * (injects only for this view, but you can pass it around)

     ContentView.swift:
         `@ObjectBinding var store: MainStore`
     SceneDelegate.swift:
         `ContentView(store: store)`

     * ---

     * Or using @EnvironmentObject
     * (injects for the whole view hierarchy)

     ContentView:
         `@EnvironmentObject var store: MainStore`
     SceneDelegate:
         `ContentView().environmentObject(store)`
     */
    @ObservedObject var viewModel: ObservableViewModel<CounterViewModel.ViewEvent, CounterViewModel.ViewState>

    var body: some View {
        VStack {
            Spacer()

            Text(viewModel.state.title)

            Spacer()

            HStack {
                Spacer()

                // With this convenient extension you don't need closures. Please find it at `Button+Extension.swift`
                Button(viewModel.state.minusButtonTitle, store: viewModel, event: .tapMinus)
                    .padding()
                    .background(Color.init(red: 234.0/255, green: 124.0/255, blue: 38.0/255))
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

                Spacer()

                Text("\(viewModel.state.counterText)")

                Spacer()

                // Without the extension is not so bad too
                Button(viewModel.state.plusButtonTitle) {
                    self.viewModel.dispatch(.tapPlus)
                }
                .padding()
                .background(Color.init(red: 234.0/255, green: 124.0/255, blue: 38.0/255))
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 2))

                Spacer()
            }

            Spacer()
        }
    }
}

#if DEBUG
struct CounterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CounterView(viewModel: .mock(state: .empty))

            CounterView(viewModel: .mock(
                state: CounterViewModel.prepareViewState(from: .init(counter: .init(currentCount: 42)))
            ))
        }
    }
}
#endif
