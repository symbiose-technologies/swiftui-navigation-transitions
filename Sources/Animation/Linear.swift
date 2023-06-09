#if canImport(UIKit)

extension NavAnimation {
	public static func linear(duration: Double) -> Self {
		.init(duration: duration, curve: .linear)
	}

	public static var linear: Self {
		.linear(duration: defaultDuration)
	}
}
#endif
