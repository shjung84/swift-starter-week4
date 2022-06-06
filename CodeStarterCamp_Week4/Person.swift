import Foundation

struct Person {
	var name: String
	var condition: BodyCondition

	mutating func exercise(set: Int, routine: inout Routine) throws {
		let exercises = routine.exercises

		for i in 1...set {
			print("----------------------------")
			print("[세트 : \(i)]")
			
			for exercise in exercises {
				print("\(exercise.name)")
				exercise.action(condition)
				
				guard condition.fatigue < 100 else {
					print("Person 피로도 : \(condition.fatigue)")
					throw ErrorGym.memberRun
				}
			}
		}
	}
}
