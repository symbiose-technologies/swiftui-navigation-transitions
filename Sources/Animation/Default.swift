#if canImport(UIKit)


extension Animation {
	public static var `default`: Self {
		.init(duration: defaultDuration, curve: .easeInOut)
	}
}
#endif
