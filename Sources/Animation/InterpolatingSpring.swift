#if canImport(UIKit)

import UIKit

extension NavAnimation {
	public static func interpolatingSpring(
		mass: Double = 1.0,
		stiffness: Double,
		damping: Double,
		initialVelocity: Double = 0.0
	) -> Self {
		.init(
			duration: defaultDuration,
			timingParameters: UISpringTimingParameters(
				mass: mass,
				stiffness: stiffness,
				damping: damping,
				initialVelocity: CGVector(dx: initialVelocity, dy: initialVelocity)
			)
		)
	}
}
#endif
