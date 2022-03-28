//
//  LazyHstack.swift
//  CollectioNviewsSwiftui
//
//  Created by Rion on 27.3.22.
//

import SwiftUI

struct HViewGrid: View {
    var gridItems: [GridItem] = [GridItem(.adaptive(minimum: 250, maximum: 400))]
    var title: String
    @State var seeMore = false
    let rows = [
        GridItem(.flexible()),GridItem(.flexible())
    ]
    
    let row = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            HStack {
                Text(title).bold()
                Spacer()
                Button(action: {
                    withAnimation {
                        self.seeMore.toggle()
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                            .rotationEffect(.degrees(seeMore ? 90 : 0))
                        .foregroundColor(.black)
                })
            }.padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: seeMore ? rows : row, alignment: .firstTextBaseline) {
                    ForEach(cocktails) { m in
                            doubleColumn(m: m).frame(width: 250)
                        }
                    }.padding(.leading).frame(height: seeMore ? 410 : 200)
            }.ignoresSafeArea(edges: .vertical)
            Divider().padding(.all)
        }
    }
}



struct ContentView11: View {
    
   
    


    let config = [
           GridItem(.fixed(80))
       ]

 
 


    @State var searchText = ""
    @State var gridOption = false
    var body: some View {
        ScrollView{

                        
                        
                        Spacer()
            
            ScrollView(.horizontal){
                    LazyHGrid(rows: config , alignment: .center) {
                        ForEach(cocktails) { m in
                    
                            doubleColumn(m: m)
                            
                    
                          
                        
                        
                    }.padding(.horizontal)
        }
    }
}
    }
}
struct LazyHstack_Previews: PreviewProvider {
    static var previews: some View {
      HViewGrid(title: "HiHiHi")
        ContentView11()
    }
}
