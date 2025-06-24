//
//  ContentView.swift
//  calculator
//
//  Created by 이돈혁 on 5/26/25.
//

import SwiftUI

struct ContentView: View {
    @State private var displayText: String = "0"
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            // Display
            HStack {
                Spacer()
                Text(displayText)
                    .font(.system(size: 72))
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.black)
            
            // Buttons
            VStack(spacing: 12) {
                ForEach([
                    ["C", "+/-", "%", "÷"],
                    ["7", "8", "9", "×"],
                    ["4", "5", "6", "−"],
                    ["1", "2", "3", "+"]
                ], id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { label in
                            Button(action: {
                                if "0123456789".contains(label) {
                                    if displayText == "0" {
                                        displayText = label
                                    } else {
                                        displayText += label
                                    }
                                } else if label == "C" {
                                    displayText = "0"
                                } else if ["+", "−", "×", "÷"].contains(label) {
                                    if let last = displayText.last, !"+−×÷".contains(last) {
                                        displayText += label
                                    }
                                }
                            }) {
                                Text(label)
                                    .frame(width: 70, height: 70)
                                    .background(buttonColor(label))
                                    .foregroundColor(.white)
                                    .font(.system(size: 28))
                                    .clipShape(Circle())
                            }
                        }
                    }
                }
                HStack(spacing: 12) {
                    Button(action: {
                        if displayText != "0" {
                            displayText += "0"
                        }
                    }) {
                        Text("0")
                            .frame(width: 148, height: 70)
                            .background(buttonColor("0"))
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .clipShape(Capsule())
                    }
                    Button(action: {
                        // Prevent multiple dots in a number
                        let components = displayText.split(whereSeparator: { "+−×÷".contains($0) })
                        if let last = components.last, !last.contains(".") {
                            displayText += "."
                        }
                    }) {
                        Text(".")
                            .frame(width: 70, height: 70)
                            .background(buttonColor("."))
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .clipShape(Circle())
                    }
                    Button(action: {
                        let expression = NSExpression(format: displayText.replacingOccurrences(of: "×", with: "*").replacingOccurrences(of: "÷", with: "/"))
                        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
                            displayText = result.stringValue
                        }
                    }) {
                        Text("=")
                            .frame(width: 70, height: 70)
                            .background(buttonColor("="))
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .clipShape(Circle())
                    }
                }
            }
        }
        .padding()
        .background(Color.black)
    }

    func buttonColor(_ label: String) -> Color {
        if ["+", "−", "×", "÷", "="].contains(label) {
            return .orange
        } else if ["C", "+/-", "%"].contains(label) {
            return .gray
        } else {
            return Color(.darkGray)
        }
    }
}

#Preview {
    ContentView()
}
