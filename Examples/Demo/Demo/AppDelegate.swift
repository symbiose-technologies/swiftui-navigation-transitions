#if canImport(UIKit)

import SwiftUI

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
	#if !os(tvOS)
	func applicationDidFinishLaunching(_ application: UIApplication) {
		customizeNavigationBarAppearance()
		customizeTabBarAppearance()
	}

	// https://developer.apple.com/documentation/technotes/tn3106-customizing-uinavigationbar-appearance
	func customizeNavigationBarAppearance() {
		let customAppearance = UINavigationBarAppearance()

		customAppearance.configureWithOpaqueBackground()
		customAppearance.backgroundColor = .systemBackground

		let proxy = UINavigationBar.appearance()
		proxy.scrollEdgeAppearance = customAppearance
		proxy.compactAppearance = customAppearance
		proxy.standardAppearance = customAppearance
		if #available(iOS 15.0, tvOS 15, *) {
			proxy.compactScrollEdgeAppearance = customAppearance
		}
	}

	func customizeTabBarAppearance() {
		let customAppearance = UITabBarAppearance()

		customAppearance.configureWithOpaqueBackground()
		customAppearance.backgroundColor = .systemBackground

		let proxy = UITabBar.appearance()
		proxy.standardAppearance = customAppearance
		if #available(iOS 15, tvOS 15, *) {
			proxy.scrollEdgeAppearance = customAppearance
		}
	}
	#endif

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}
}
#elseif os(macOS)

//creat the AppDelegate for macOS
//@main
//class AppDelegate: NSObject, NSApplicationDelegate {
//
//
//    func applicationWillFinishLaunching(_ notification: Notification) {
//    }
//    func applicationDidFinishLaunching(_ notification: Notification) {
//    }
//
//
//    func applicationDidChangeOcclusionState(_ notification: Notification) {
//
//    }
//
//    lazy var windows = NSWindow()
//    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
//        if !flag {
//            for window in sender.windows {
//                window.makeKeyAndOrderFront(self)
//            }
//        }
//        return true
//    }
//
//}



#endif
