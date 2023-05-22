//
//  ViewController.swift
//  calc
//
//  Created by Sabri KOÇ on 20.12.2022.
//

import SwiftUI

enum CalculatorButton: String {
    case zero,one,two,three,four,five,six,seven
    case equals, plus,minus,multiply,divide
    case decimal
    case ac,plusMinus,percent
    
    var title: String{
        switch self{
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "x"
        case .plusMinus: return "+/-"
        case .percent: return "%"
        case .decimal: return "."
        default:
            return "AC"
        }
    }
    
    var backgroundColor: Color{
        switch self {
        case .zero,.one,.two,.three,.four,.five,.six,.seven:
            return Color(.darkGray)
        case .ac,.plusMinus,.percent :
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}
struct ContentView: View {
    
    let buttons: [[CalculatorButton]] = [
        [.ac,.plusMinus,.percent,.divide],
        [.seven,.five,.six,.minus],
        [.four,.five,.six,.minus],
        [.one,.two,.three,.plus],
        [.zero,.decimal,.equals]
    ]
    
    var body: some View{
         
        ZStack(alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    Text("42").foregroundColor(.white).font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self) {row in
                    HStack(spacing:12){
                        ForEach(row, id: \.self)
                        {button in
                            
                            Button(action: {
                                
                            }){
                                Text(button.title)
                                    .font(.system(size:32))
                                    .frame(width: self.buttonWidth(button:button),height:(UIScreen.main.bounds.width - 5 * 12 ) / 4)
                                    .foregroundColor(.white)
                                    .background(button.backgroundColor)
                                    .cornerRadius(self.buttonWidth(button:button))
                            }
                            
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 4 * 12 ) / 4*2
        }
        return (UIScreen.main.bounds.width - 5 * 12 ) / 4
    }
    }


struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
