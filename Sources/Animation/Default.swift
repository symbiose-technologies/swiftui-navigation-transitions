#if canImport(UIKit)


extension NavAnimation {
	public static var `default`: Self {
		.init(duration: defaultDuration, curve: .easeInOut)
	}
}
#endif
