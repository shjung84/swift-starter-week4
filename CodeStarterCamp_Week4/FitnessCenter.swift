import Foundation

class FitnessCenter {
	let centerName: String
	//	목표 바디 컨디션
	var achievement = BodyCondition()
	//	회원(Optional로 설정합니다.)
	var member: Person?
	//	최소 2개 이상의 루틴 목록 (Collection타입)
	var routineList: [Routine] = routine
	
	init(centerName: String) {
		self.centerName = centerName
	}
	
	// 입장
	func enterTheGym() {
		greeting()
		achieve()
		play()
	}
		
	// 인사, 정보입력
	func greeting() {
		print("안녕하세요. \(centerName)입니다. 회원님의 이름은 무엇인가요?")
		receiveMember()
	}
	
	func achieve() {
		print("운동 목표치를 순서대로 알려주세요. 예시) 상체근력:130,하체근력:120,근지구력:150")
		receiveGaol()
	}

	// MARK: - Receive
	func receiveMember() {
		while true {
			do {
				print("이름 : ", terminator: "")
				let memberName = try inputString()
				member = Person(name: memberName, condition: BodyCondition())
				break
			} catch ErrorCase.Empty {
				print("이름을 입력하세요.")
			} catch {
				print("Error !! \(error)")
			}
		}
	}
	
	func receiveGaol() {
		while true {
			do {

				print("상체근력 : ", terminator: "")
				let upperMuscle = try inputInt()
				achievement.upperMuscle += upperMuscle

				print("하체근력 : ", terminator: "")
				let lowerMuscle = try inputInt()
				achievement.lowerMuscle += lowerMuscle

				print("근지구력 : ", terminator: "")
				let endurance = try inputInt()
				achievement.endurance += endurance

				break
			} catch ErrorCase.notInt {
				print("숫자를 입력하세요.")
			} catch {
				print("Error !! \(error)")
			}
		}
	}
	
	func receiveRoutine() -> Int {
		print("몇 번째 루틴으로 운동하시겠어요?")

		while true {
			do {
				let myRoutine = try inputRoutine()
				print("선택된 루틴 : \(routineList[myRoutine].routineName)")
				return myRoutine
			} catch ErrorCase.notInt {
				print("숫자를 입력하세요.")
			} catch ErrorCase.notRange {
				print("루틴을 확인해주세요.")
			} catch {
				print("Error !! \(error)")
			}
		}
	}

	func receiveSet() -> Int {
		print("몇 세트 반복하시겠어요?")

		while true {
			do {
				print("세트 선택 : ", terminator: "")
				let mySet = try inputInt()
				return mySet
			} catch ErrorCase.notInt {
				print("숫자를 입력하세요.")
			} catch {
				print("Error !! ")
			}
		}
	}
	
	// MARK: - Input
	func inputInt() throws -> Int {
		guard let inputSome = readLine(), let inputSome = Int(inputSome) else {
			throw ErrorCase.notInt
		}
		return inputSome
	}
	
	func inputString() throws -> String {
		guard let inputSome = readLine(), inputSome.isEmpty == false else {
			throw ErrorCase.Empty
		}
		return inputSome
	}
	
	func inputRoutine() throws -> Int {
		
		var i: Int = 1
		for routine in routineList {
			print("\(i). \(routine.routineName)")
			i += 1
		}
		
		print("루틴 선택 : ", terminator: "")
		let myRange = routineList.count
		guard let chooseRoutine = readLine(), let chooseRoutine = Int(chooseRoutine) else {
			throw ErrorCase.notInt
		}
		switch chooseRoutine {
			case 1...myRange:
				return chooseRoutine - 1
			default:
				throw ErrorCase.notRange
		}
	}
	
	// MARK: - Condition
	func checkCondition() {
		if let member = member {
			let current = member.condition
			print("현재 \(member.name)님의 컨디션은 다음과 같습니다.")
			print("----------------------------")
			print("[상체근력] 목표 : \(achievement.upperMuscle), 결과 : \(current.upperMuscle)")
			print("[하체근력] 목표 : \(achievement.lowerMuscle), 결과 : \(current.lowerMuscle)")
			print("[근지구력] 목표 : \(achievement.endurance), 결과 : \(current.endurance)")
			print("[피로도] \(current.fatigue)")
			print("----------------------------")
		}
	}
	
	// MARK: - Goal
	func checkAchieveGoal() throws {
		if let member = member {
			let current = member.condition
			if achievement.upperMuscle < current.upperMuscle,
			   achievement.lowerMuscle < current.lowerMuscle,
			   achievement.endurance < current.endurance {
				print("성공입니다!", terminator: "")
			} else {
				throw ErrorGym.memberFailed
			}
		}
	}
	
	// MARK: - Play
	func playExercise(playRoutine: Int, playSet: Int) throws {
		print("============================")
		let routineName = routineList[playRoutine].routineName
		print("🏋🏽‍♀️ \(routineName)을 \(playSet)set시작합니다.")
		try member?.exercise(set: playSet, routine: &routineList[playRoutine])
		print("----------------------------")
		try checkAchieveGoal()
	}
	
	// MARK: - Play
	func play() {
		if let member = member {
			while true {
				do {
					// 성공
					try playExercise(playRoutine: receiveRoutine(), playSet: receiveSet())
//					try checkAchieveGoal()
					// 컨디션 출력
					checkCondition()
					break
				} catch ErrorGym.memberFailed {
					// 실패
					print("목표치에 도달하지 못했습니다.", terminator: "")
					checkCondition()
					
					member.condition.upperMuscle = 0
					member.condition.lowerMuscle = 0
					member.condition.endurance = 0
					member.condition.fatigue = 0
					
				} catch ErrorGym.memberRun {
					// 도망
					print("\(member.name)님의 피로도가 \(member.condition.fatigue)입니다. 회원님이 도망갔습니다.")
					break
				} catch {
					print("Error !! \(error)")
				}
			}
		}
	}
}

