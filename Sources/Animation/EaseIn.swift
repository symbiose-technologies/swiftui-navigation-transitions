#if canImport(UIKit)

extension NavAnimation {
	public static func easeIn(duration: Double) -> Self {
		.init(duration: duration, curve: .easeIn)
	}

	public static var easeIn: Self {
		.easeIn(duration: defaultDuration)
	}
}
#endif
