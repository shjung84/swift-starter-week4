import Foundation

//운동 타입
struct Exercise {
	let name: String
	let action: () -> Void
}

let 윗몸일으키기: Exercise = Exercise(name: "윗몸일으키기", action: {
	myBodyCondition.upperMicle += Int.random(in: 10...20)
	myBodyCondition.fatigue += Int.random(in: 10...20)
})

let 스쿼트: Exercise = Exercise(name: "스쿼트", action: {
	myBodyCondition.lowerMicle += Int.random(in: 20...30)
	myBodyCondition.fatigue += Int.random(in: 10...20)
})

let 오래달리기: Exercise = Exercise(name: "오래달리기", action: {
	myBodyCondition.upperMicle += Int.random(in: 5...10)
	myBodyCondition.lowerMicle += Int.random(in: 5...10)
	myBodyCondition.endurance += Int.random(in: 20...30)
	myBodyCondition.fatigue += Int.random(in: 20...30)
})

let 동적휴식: Exercise = Exercise(name: "동적휴식", action: {
	myBodyCondition.fatigue -= Int.random(in: 10...20)
})
