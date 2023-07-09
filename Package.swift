// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "swiftui-navigation-transitions",
	platforms: [
		.iOS(.v13),
		.macCatalyst(.v13),
		.tvOS(.v13),
        .macOS(.v12)
	]
)

// MARK: Dependencies

package.dependencies = [
    .package(url: "https://github.com/siteline/swiftui-introspect", from: "0.6.3"),
    .package(url: "https://github.com/pointfreeco/swift-custom-dump", from: "0.10.3"), // dev
    .package(url: "https://github.com/pointfreeco/xctest-dynamic-overlay", from: "0.8.5"), // dev
]

let SwiftUIIntrospect: Target.Dependency = .product(
    name: "SwiftUIIntrospect",
    package: "swiftui-introspect"
)

let CustomDump: Target.Dependency = .product(
	name: "CustomDump",
	package: "swift-custom-dump"
)

let XCTestDynamicOverlay: Target.Dependency = .product(
	name: "XCTestDynamicOverlay",
	package: "xctest-dynamic-overlay"
)

// MARK: Targets

package.targets += [
	.target(name: "Animation"),

	.target(name: "Animator"),
	.testTarget(name: "AnimatorTests", dependencies: [
		"Animator",
		"TestUtils",
	]),

	.target(name: "AtomicTransition", dependencies: [
		"Animator",
	]),
	.testTarget(name: "AtomicTransitionTests", dependencies: [
		"AtomicTransition",
		"TestUtils",
	]),

	.target(name: "NavigationTransition", dependencies: [
		"Animation",
		"AtomicTransition",
        SwiftUIIntrospect,
	]),

	.target(name: "NavigationTransitions", dependencies: [
		"NavigationTransition",
		"RuntimeAssociation",
		"RuntimeSwizzling",
	]),

	.target(name: "RuntimeAssociation"),
	.target(name: "RuntimeSwizzling"),

	.target(name: "TestUtils", dependencies: [
		CustomDump,
		"NavigationTransitions",
		XCTestDynamicOverlay,
	]),
]

// MARK: Product

package.products += [
	.library(name: "NavigationTransitions", targets: ["NavigationTransitions"]),
]
