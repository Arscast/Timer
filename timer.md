import SwiftUI

struct ContentView : View {
    @State var counter = 0

    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()

    var body: some View {
       
            Text("\(counter)")
                .onReceive(timer) {time in
                    if self.counter == 10{
                        self.timer.upstream.connect().cancel()
                    } else {
                        print("The time is now \(time)")
                    }
                    self.counter += 1
            }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


