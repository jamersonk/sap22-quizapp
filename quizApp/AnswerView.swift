//
//  AnswerView.swift
//  quizApp
//
//  Created by James Kuang on 15/6/22.
//

import SwiftUI

struct AnswerView: View {
    var isCorrect: Bool
    var qn2Display: Int
    var body: some View {
        Text(isCorrect ? "Your answer was correct!" : "You got this one wrong.")
        Text("\(Questions[qn2Display].solutionB) was the correct answer.")
        Text(isCorrect ? "Good Job!" : "Try again next time!")
            .padding()
        Text("Swipe down to dismiss.")
            .font(.caption)
        Text("Tap to move onto the next question.")
            .font(.caption2)
    }
}

struct AnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AnswerView(isCorrect: true, qn2Display: 3)
    }
}
