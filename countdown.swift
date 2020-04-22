import SwiftUI

struct ContentView : View {
    @State var counter = 0
    @State var go = false
    @State var showAlert = false
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
            
        VStack {
            VStack {
                Text("My first app :)")
                    .font(.largeTitle)
                Spacer()
                Stepper(value: $counter, in: 1...60) {
                    Text("Seconds")
                }
                .padding()
            }
            
            VStack() {
                Text("\(counter)")
                    .font(.largeTitle)
                        .onReceive(timer) {time in
                            if self.go{
                                self.counter -= 1
                                if self.counter == 0{
                                    self.go = false
                                    self.showAlert = true
                                } else {
                                    self.showAlert = false
                                }
                            }
            }
               Button(action: {
                self.go.toggle()
               }) {
                   Text("Start/Stop")
               }
                .alert(isPresented: $showAlert) {
                           Alert(title: Text("Time is over"), message: Text("Finish!"))
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
