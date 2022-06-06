import Foundation

struct Exercise {
	let name: String
	let action: (BodyCondition) -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기") { person in
	person.upperMuscle += Int.random(in: 10...20)
	person.fatigue += Int.random(in: 10...20)
}

let 스쿼트: Exercise = Exercise(name: "스쿼트") { person in
	person.lowerMuscle += Int.random(in: 20...30)
	person.fatigue += Int.random(in: 10...20)
}

let 오래달리기: Exercise = Exercise(name: "오래달리기") { person in
	person.upperMuscle += Int.random(in: 5...10)
	person.lowerMuscle += Int.random(in: 5...10)
	person.endurance += Int.random(in: 20...30)
	person.fatigue += Int.random(in: 20...30)
}

let 동적휴식: Exercise = Exercise(name: "동적휴식") { person in
	person.fatigue -= Int.random(in: 10...20)
}
