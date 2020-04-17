import SwiftUI

struct ContentView : View {
    @State var counter = 0
    @State var go = false

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
            }
            
            VStack() {
                Text("\(counter)")
                    .font(.largeTitle)
                        .onReceive(timer) {time in
                            if self.go{
                                self.counter -= 1
                                if self.counter == 0{
                                self.timer.upstream.connect().cancel()
                                
                                }
                            }
            }
               Button(action: {
                self.go.toggle()
               }) {
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

