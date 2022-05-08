import Foundation

//var myBodyCondition = BodyCondition(upperMicle: 0, lowerMicle: 0, endurance: 0, fatigue: 0)
var myBodyCondition = BodyCondition()
var myRoutin = Routine(routinName: "hellRoutine", exercises: [윗몸일으키기, 윗몸일으키기, 동적휴식, 스쿼트, 스쿼트, 동적휴식, 오래달리기, 오래달리기])

myRoutin.playMyRoutin(condition: myBodyCondition)
