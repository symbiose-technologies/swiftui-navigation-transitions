#if canImport(UIKit)

extension NavAnimation {
	public static func easeInOut(duration: Double) -> Self {
		.init(duration: duration, curve: .easeInOut)
	}

	public static var easeInOut: Self {
		.easeInOut(duration: defaultDuration)
	}
}
#endif
