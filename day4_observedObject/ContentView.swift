//
//  ContentView.swift
//  day4_observedObject
//
//  Created by Raghav Deo on 02/12/23.
//

import SwiftUI
struct NewNumberView : View
{
    @State   var number:Int = 0

    var body : some View
    {
        VStack
        {

            Text("Number value:\(number)")
            Button("Change Nuber")
            {
                number+=1
            }
        }

        counterView()
    }

}

class CounterViewModel : ObservableObject
{
    @Published var count = 10
    func increaseCount()
    {
        count+=1
    }
}
struct counterView : View
{
    @ObservedObject var viewModel = CounterViewModel()
    var body:some View{
        Button("Tap Button")
        {
            viewModel.increaseCount()
        }.padding()
        Text("Count is now \(viewModel.count)")
    }
    
}


struct ContentView: View {
    var body: some View {
        VStack {
       NewNumberView()
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
