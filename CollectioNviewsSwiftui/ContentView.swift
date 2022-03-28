//
//  ContentView.swift
//  CollectioNviewsSwiftui
//
//  Created by Rion on 27.3.22.
//

import SwiftUI

struct Banesa: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String
    var type: String
}

let cocktails = [
    Banesa(name: "Shitet Banesa 72m2 200,000€", image: "monarch-1024x683", description: "Shitet Banesa ne Emshir kati 3 2 dhoma,1 banjo dhe 1 sallon dhe poashtu me çmim 85,000€ dhe ka garancion", type: "Apartment"),
   Banesa(name: "Shitet Banesa 72m2 200,000€", image: "download-1", description: "Shitet Banesa ne Emshir kati 3 2 dhoma,1 banjo dhe 1 sallon dhe poashtu me çmim 85,000€ dhe ka garancion", type: "Apartment"),
 Banesa(name: "Shitet Banesa 72m2 200,000€", image: "monarch-1024x683", description: "Shitet Banesa ne Emshir kati 3 2 dhoma,1 banjo dhe 1 sallon dhe poashtu me çmim 85,000€ dhe ka garancion", type: "Apartment"),
    Banesa(name: "Shitet Banesa 72m2 200,000€", image: "monarch-1024x683", description: "Shitet Banesa ne Emshir kati 3 2 dhoma,1 banjo dhe 1 sallon dhe poashtu me çmim 85,000€ dhe ka garancion", type: "Apartment"),
    ]


struct singleColumn: View {
    var m: Banesa
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(m.image)
            .resizable()
            .frame(height: 300)
                .overlay(Color.black.opacity(0.3))
                .cornerRadius(15)
            VStack(alignment: .leading, spacing: 7) {
                HStack {
                    Image(systemName: "a.square.fill").foregroundColor(Color.gray)
                    Text(m.type)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.gray)
                        .textCase(.uppercase)
                }
                Text(m.name).font(.title)
                    .foregroundColor(Color.white)
                    .fontWeight(.bold)
                Spacer()
                Text(m.description)
                    .lineLimit(2)
                    .foregroundColor(Color.white)
            }.padding()
            .padding(.horizontal, 5)
        }
        .padding(.horizontal,0)
        .padding(.vertical, 10)
        .shadow(color: Color.gray, radius: 12 )
    }
}

struct doubleColumn: View {
    var m: Banesa
    var body: some View {
        ZStack{
            Color.init(red: 0.95, green: 0.97, blue: 0.97)
            VStack{
                
                VStack(spacing:10){
            Image(m.image)
                        .resizable()
                    
                        .frame(width:300,height:180)
                        .scaledToFit()
                        .padding(.top,-20)
                    HStack{
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                        Image(systemName: "star.fill")
                            .foregroundColor(.orange)
                    }
                
                    VStack(spacing:15){
                        
                     
                    
            Text(m.name)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                        
                     
                Text(m.description)
                        .fontWeight(.light)
                        .frame(width:270)
                        .font(.system(size: 13))
                            
                        .lineLimit(4)
              
                    }
                }
              
        }
       
            .frame(width:300,height: 300)
      
            
        }
     
        .cornerRadius(15)
    }
      
}

//(.fixed(350)), GridItem(.adaptive(minimum: 350))
//let columns = [


struct ContentView: View {
    
   
    


    let config = [
           GridItem(.fixed(80))
       ]

 
 

    @State var search = false
    @State var searchText = ""
    @State var gridOption = false
    var body: some View {
        ScrollView{
                        HStack {
                            Button(action: {
                                withAnimation {search.toggle()}
                            }) {
                                HStack {
                                    Image(systemName: "magnifyingglass").foregroundColor(.black).font(.title2)
                                }
                            }
                            Spacer(minLength: 0)
                            Image("logoDark")
                                .resizable()
                                .frame(width: 90, height: 25)
                                .aspectRatio(contentMode: .fit)
                            
                            Spacer(minLength: 0)
                            Button(action: {
                                withAnimation {
                                    gridOption.toggle()
                                }
                            }) {
                                Image(systemName: gridOption ? "rectangle.grid.1x2.fill" : "square.grid.2x2.fill").foregroundColor(.black).font(.title2)
                            }
                        }.padding()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Cocktails").font(.title).bold()
                            Divider()
                        }
                        
                        
                        Spacer()
                        
                    }.padding(.horizontal)
                    if gridOption {HViewGrid(title: "Favourites")}
            ScrollView(.horizontal){
                    LazyHGrid(rows: config , alignment: .center) {
                        ForEach(cocktails) { m in
                    
                            doubleColumn(m: m)
                            
                    
                          
                        
                        }
                    }.padding(.horizontal)
                }.navigationTitle("Cocktails")
            .navigationBarItems(leading: EditButton())
    }
}
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
     ContentView()
       
    }
}
