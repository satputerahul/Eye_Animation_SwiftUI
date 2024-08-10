
import SwiftUI

struct ContentView: View {
    
    @State var eyeOpen = true
    let eyeArr = ["eye_1","eye_2","eye_3", "eye_4"]
    let userArr = ["user_1","user_2","user_3","user_4"]
    
    @State var no = 0
    
    var body: some View {
        
        
        ZStack {
            
            Image(userArr[no])
                .resizable()
                .scaledToFill()
                .animation(.easeInOut, value: eyeOpen)
 
        
            VStack {
                
                ZStack {
                    Image(eyeArr[no])
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 100)
                        .clipShape(Rectangle().offset(y: eyeOpen ? 100 : 0))
                        .clipShape(Circle())
                        .animation(.easeInOut(duration: 1.5), value: eyeOpen)
                        .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                                
                                if eyeOpen {
                                    no = no > 2 ? 0 : no + 1
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    eyeOpen.toggle()
                                    
                                }
                            }
                        }
                }
            }
        

            }
            .scaledToFill()
            .background(Color.black)
            
    }
        
}

#Preview {
    ContentView()
}
