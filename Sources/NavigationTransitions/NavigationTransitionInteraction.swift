#if canImport(UIKit)

import UIKit

//extension UINavigationController {
//	@objc func handleInteraction(_ gestureRecognizer: UIPanGestureRecognizer) {
//		guard let delegate = customDelegate else {
//			return
//		}
//		guard let gestureRecognizerView = gestureRecognizer.view else {
//			delegate.interactionController = nil
//			return
//		}
//
//		let translation = gestureRecognizer.translation(in: gestureRecognizerView).x
//		let width = gestureRecognizerView.bounds.size.width
//		let percent = translation / width
//
//		switch gestureRecognizer.state {
//		case .possible:
//			break
//
//		case .began:
//			delegate.interactionController = UIPercentDrivenInteractiveTransition()
//			popViewController(animated: true)
//			delegate.interactionController?.update(percent)
//
//		case .changed:
//			delegate.interactionController?.update(percent)
//
//		case .ended:
//			let velocity = gestureRecognizer.velocity(in: gestureRecognizerView).x
//
//			if velocity > 675 || (percent >= 0.2 && velocity > -200) {
//				let resistance: Double = 800
//				let maxSpeed: Double = 2.25
//				let nominalSpeed = max(0.99, velocity / resistance)
//				let speed = min(nominalSpeed, maxSpeed)
//
//				delegate.interactionController?.completionSpeed = speed
//				delegate.interactionController?.finish()
//			} else {
//				delegate.interactionController?.cancel()
//			}
//
//			delegate.interactionController = nil
//
//		case .failed, .cancelled:
//			delegate.interactionController?.cancel()
//			delegate.interactionController = nil
//
//		@unknown default:
//			break
//		}
//	}
//}



extension UINavigationController {
    @objc func handleInteraction(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard let delegate = customDelegate else {
            return
        }
        guard let gestureRecognizerView = gestureRecognizer.view else {
            delegate.interactionController = nil
            return
        }
        let translation = gestureRecognizer.translation(in: gestureRecognizerView).x
        let width = gestureRecognizerView.bounds.size.width
        let percent = translation / width
        
        
        print("UINavigationController -- gestureRecognizer.state: \(gestureRecognizer.state) translation: \(translation) width: \(width) percent: \(percent)")
        
        switch gestureRecognizer.state {
        case .possible:
            print("UINavigationController -- gestureRecognizer.state POSSIBLE")
            break

        
        case .began:
            let translation = gestureRecognizer.translation(in: gestureRecognizerView).x
            let width = gestureRecognizerView.bounds.size.width
            let percent = translation / width
            
            if percent < 0 {
                print("UINavigationController -- gestureRecognizer.state BEGAN but is negative so skipping!")
                break;
            }
            
            delegate.interactionController = UIPercentDrivenInteractiveTransition()
            popViewController(animated: true)
            delegate.interactionController?.update(percent)

        case .changed:
            
            let translation = gestureRecognizer.translation(in: gestureRecognizerView).x
            let width = gestureRecognizerView.bounds.size.width
            let percent = translation / width

            delegate.interactionController?.update(percent)

        case .ended:
            
            let translation = gestureRecognizer.translation(in: gestureRecognizerView).x
            let width = gestureRecognizerView.bounds.size.width
            let percent = translation / width

            
            let velocity = gestureRecognizer.velocity(in: gestureRecognizerView).x

            if velocity > 675 || (percent >= 0.2 && velocity > -200) {
                let resistance: Double = 800
                let maxSpeed: Double = 2.25
                let nominalSpeed = max(0.99, velocity / resistance)
                let speed = min(nominalSpeed, maxSpeed)

                delegate.interactionController?.completionSpeed = speed
                delegate.interactionController?.finish()
            } else {
                delegate.interactionController?.cancel()
            }

            delegate.interactionController = nil

        case .failed, .cancelled:
            delegate.interactionController?.cancel()
            delegate.interactionController = nil

        @unknown default:
            break
        }
    }
}


//Below is a Vertical-to-bottom navigation
//extension UINavigationController {
//    @objc func handleInteraction(_ gestureRecognizer: UIPanGestureRecognizer) {
//        guard let delegate = customDelegate else {
//            return
//        }
//        guard let gestureRecognizerView = gestureRecognizer.view else {
//            delegate.interactionController = nil
//            return
//        }
//
//        let translation = gestureRecognizer.translation(in: gestureRecognizerView).y
//        let height = gestureRecognizerView.bounds.size.height
//        let percent = translation / height
//
//        switch gestureRecognizer.state {
//        case .possible:
//            break
//
//        case .began:
//            delegate.interactionController = UIPercentDrivenInteractiveTransition()
//            popViewController(animated: true)
//            delegate.interactionController?.update(percent)
//
//        case .changed:
//            delegate.interactionController?.update(percent)
//
//        case .ended:
//            let velocity = gestureRecognizer.velocity(in: gestureRecognizerView).y
//
//            if velocity > 675 || (percent >= 0.2 && velocity > -200) {
//                let resistance: Double = 800
//                let maxSpeed: Double = 2.25
//                let nominalSpeed = max(0.99, velocity / resistance)
//                let speed = min(nominalSpeed, maxSpeed)
//
//                delegate.interactionController?.completionSpeed = speed
//                delegate.interactionController?.finish()
//            } else {
//                delegate.interactionController?.cancel()
//            }
//
//            delegate.interactionController = nil
//
//        case .failed, .cancelled:
//            delegate.interactionController?.cancel()
//            delegate.interactionController = nil
//
//        @unknown default:
//            break
//        }
//    }
//}


#endif
