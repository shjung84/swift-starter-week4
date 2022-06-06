import Foundation

var hellRoutine = Routine(routineName: "지옥의 루틴",
						  exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])
var ohMyGodRoutine = Routine(routineName: "오마이갓 루틴",
							 exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식])
var routine: [Routine] = [hellRoutine, ohMyGodRoutine]

var gym = FitnessCenter(centerName: "야곰 피트니스 센터")
gym.enterTheGym()



