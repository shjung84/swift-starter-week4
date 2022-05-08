import Foundation

struct Routine {
	let routinName: String
	let exercises: [Exercise]
	
	mutating func playMyRoutin(condition: BodyCondition) {
//		var myCondition = condition
		print("""
		--------------
		hellRoutine을 시작합니다.
		""")
		for exercise in exercises {
			print("\(exercise.name)")
			exercise.action()
		}
		condition.yourConsition()
	}
}
