import Foundation

// MARK: - 정답 생성 함수 (0으로 시작하면 안됨)
func generateAnswer() -> [Int] {
    var answer: [Int] = []
    while answer.count < 3 {
        let n = Int.random(in: 0...9)
        if !answer.contains(n) {
            answer.append(n)
        }
    }
    if answer[0] == 0 {
        return generateAnswer() // 첫 자리가 0이면 다시 생성
    }
    return answer
}

func isValidInput(_ input: String) -> Bool {
    let characters = Array(input)
    guard characters.count == 3,
          Set(characters).count == 3,
          characters.allSatisfy({ $0.isNumber }),
          input.first != "0" else {
        return false
    }
    return true
}

func check(_ guess: [Int], against answer: [Int]) -> String {
    var strike = 0
    var ball = 0

    for i in 0..<3 {
        if guess[i] == answer[i] {
            strike += 1
        } else if answer.contains(guess[i]) {
            ball += 1
        }
    }

    if strike == 0 && ball == 0 {
        return "Nothing"
    }

    var result = ""
    if strike > 0 { result += "\(strike)스트라이크 " }
    if ball > 0 { result += "\(ball)볼" }
    return result.trimmingCharacters(in: .whitespaces)
}

func showMenu() {
    print("\n환영합니다! 원하는 번호를 입력해주세요.")
    print("1. 게임 시작하기   2. 게임 기록 보기   3. 종료하기")
}

func startGame() {
    let answer = generateAnswer()
    // print("정답: \(answer)") // 디버깅용

    print("\n< 게임을 시작합니다 >")
    while true {
        print("숫자를 입력하세요")
        if let input = readLine() {
            if !isValidInput(input) {
                print("올바르지 않은 입력값입니다")
                continue
            }

            let guess = input.compactMap { Int(String($0)) }
            if guess == answer {
                print("정답입니다!")
                break
            } else {
                print(check(guess, against: answer))
            }
        }
    }
}

// MARK: - 메인 루프
while true {
    showMenu()
    if let choice = readLine() {
        switch choice {
        case "1":
            startGame()
        case "2":
            print("게임 기록 보기 기능은 아직 구현되지 않았습니다.")
        case "3":
            print("프로그램을 종료합니다.")
            exit(0)
        default:
            print("올바른 번호를 입력해주세요.")
        }
    }
}
