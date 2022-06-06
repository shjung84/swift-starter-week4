import Foundation

enum ErrorCase: Error {
	case Empty	
	case notInt
	case notRange
}

enum ErrorGym: Error {
	case memberFailed
	case memberRun
}
