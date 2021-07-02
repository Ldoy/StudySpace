import UIKit
import Foundation

// 
let double = NSNumber.init(value: 5.3)
let int = NSNumber.init(value: 2)


func convertToDouble<T: BinaryInteger> (from number: T) -> Double {
	return Double("\(number).0") ?? 0.0
}
	
