//
//  ContentView.swift
//  quizApp
//
//  Created by James Kuang on 15/6/22.
//
import SwiftUI
// VARIABLES AND CONSTANTS
var Questions = [
    Question(QnNo: "1", qn: "Which nation was first absorbed by Nazi Germany?", solutionA: "Czeckoslovakia", solutionB: "Austria", solutionC: "Poland", solutionD: "France"),
    Question(QnNo: "2", qn: "Which city sustained the most deaths from bombing during WWII?", solutionA: "London", solutionB: "Dresden", solutionC: "France", solutionD: "Kosovo"),
    Question(QnNo: "3", qn: "Baguettete?", solutionA: "No", solutionB: "No Comment", solutionC: "Yes", solutionD: "BAGUETTEEEE!"),
    Question(QnNo: "4", qn: "What is the subject code for O-Level History?", solutionA: "2273", solutionB: "2179", solutionC: "4049", solutionD: "What is O-Level?"),
    Question(QnNo: "5", qn: "How many a's are there in Llanfairpwllgwyngyll­gogery­chwyrn­drobwll­llan­tysilio­gogo­goch?", solutionA: "9", solutionB: "I will not do maths in this quiz.", solutionC: "Antidistablishmentarism", solutionD: "why"),
    Question(QnNo: "6", qn: "What is the motto of France?", solutionA: "Peace, Bread, Land", solutionB: "Liberty, Equality, Fraternity", solutionC: "Baguette!", solutionD: "What is this France you speak of?"),
    Question(QnNo: "7", qn: "Shortly before Hitler concentrated power absolutely in himself, President Hidenburg activated a particular article of the Weimar constitution. What is the name of this article?", solutionA: "Enabling Act", solutionB: "Article 48", solutionC: "Article 84", solutionD: "Establishment of the Fuhrer position."),
    Question(QnNo: "8", qn: "What is the name of the state of Germany between the years of 1918 and 1933?", solutionA: "Inter-war Germany", solutionB: "Weimar Republic", solutionC: "German Reich", solutionD: "Prussia"),
    Question(QnNo: "9", qn: "Who was the last president of the Weimar Republic?", solutionA: "Adolf Hitler", solutionB: "Hindenburg", solutionC: "Joseph Stalin", solutionD: "Mao Zedong"),
    Question(QnNo: "10", qn: "What type of electorial system did the Weimar Republic utilise?", solutionA: "First Past the Post", solutionB: "Proportional Voting", solutionC: "Direct Democracy", solutionD: "Preferiential Voting"),
]
let DO_NOT_EXCEED = Questions.count - 1

struct ContentView: View {
    @State var totalQuestions = Questions.count
    @State var currentQuestion = 0
    @State var points = 0
    @State var isSheet1Shown = false
    @State var isAlertShown = false
    @State var isAnswerCorrect = false
    @State var hasAnswered = false

    }
    
    var body: some View {
        ZStack{
            Color.white
                .onTapGesture {
                    if hasAnswered == false {
                        print("qn not answered.")
                    } else if currentQuestion >= DO_NOT_EXCEED {
                        isAlertShown = true
                    } else {
                    currentQuestion += 1
                    hasAnswered = false
                    }
                }
            VStack{
                Text("Question \(Questions[currentQuestion].QnNo) of \(totalQuestions).")
                Text("Q\(Questions[currentQuestion].QnNo)")
                    .padding()
                Text(Questions[currentQuestion].qn)
                    .padding()
                Button {
                    print("Answered A")
                    if hasAnswered == false {
                        isAnswerCorrect = false
                        isSheet1Shown = true
                        hasAnswered = true
                    } else {
                        currentQuestion += 1
                    }
                } label: {
                    Text(Questions[currentQuestion].solutionA)
                }
                .padding()
                Button {
                    print("Answered B")
                    if hasAnswered == false {
                        isAnswerCorrect = true
                        isSheet1Shown = true
                        hasAnswered = true
                    } else {
                        currentQuestion += 1
                    }
                } label: {
                    Text(Questions[currentQuestion].solutionB)
                }
                .padding()
                Button {
                    print("Answered C")
                    if hasAnswered == false {
                        isAnswerCorrect = false
                        isSheet1Shown = true
                        hasAnswered = true
                    } else {
                        currentQuestion += 1
                    }
                } label: {
                    Text(Questions[currentQuestion].solutionC)
                }
                .padding()
                Button {
                    print("Answered D")
                    if hasAnswered == false {
                        isAnswerCorrect = false
                        isSheet1Shown = true
                        hasAnswered = true
                    } else {
                        currentQuestion += 1
                    }
                } label: {
                    Text(Questions[currentQuestion].solutionD)
                }
                .padding()
            }
        }
        .sheet(isPresented: $isSheet1Shown) {
            AnswerView(isCorrect: isAnswerCorrect, qn2Display: currentQuestion)
        }
        .alert("The quiz is finished! You got \(points) out of \(totalQuestions).", isPresented: $isAlertShown) {
            Button(role: .destructive) {
                print("resetting")
                points = 0
                currentQuestion = 0
                hasAnswered = false
            } label: {
                Text("Reset")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
