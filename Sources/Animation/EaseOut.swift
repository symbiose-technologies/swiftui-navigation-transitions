#if canImport(UIKit)

extension NavAnimation {
	public static func easeOut(duration: Double) -> Self {
		.init(duration: duration, curve: .easeOut)
	}

	public static var easeOut: Self {
		.easeOut(duration: defaultDuration)
	}
}
#endif
