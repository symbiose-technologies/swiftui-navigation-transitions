import SwiftUI

#if os(iOS)
struct AppView: View {
	@ObservedObject var appState = AppState()

	var body: some View {
		RootView().environmentObject(appState)
	}
}
#else
@main
struct AppView: App {
    
    var body: some Scene {
        WindowGroup {
            Text("Not implemented on macOS")            
        }
    }
}

#endif
