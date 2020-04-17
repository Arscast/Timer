import SwiftUI

struct ContentView : View {
    @State var counter = 0

    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
            
        VStack {
            VStack {
                Text("My first app :)")
                    .font(.largeTitle)
                 Spacer()
                Stepper(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(4)/*@END_MENU_TOKEN@*/, in: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Range@*/1...10/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Label@*/Text("Stepper")/*@END_MENU_TOKEN@*/
                }
            }
            VStack(alignment: .leading) {
                Text("\(counter)")
                    .font(.largeTitle)
                        .onReceive(timer) {time in
                            self.counter += 1
                        }
               Button(action: {}) {
                    Text("Start/Stop")
                }
                 Spacer()
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

