//
//  ContentView.swift
//  memorize
//
//  Created by Alay Shah on 6/2/21.
//

import SwiftUI

enum Themes {
    case DEFAULT
    case FACES
    case CARS
}
let defaultTheme = ["🦧","🕺🏾","🥸","🦕", "🐬", "🐙", "🐢", "🦜", "👨🏾‍💻", "😎", "🤓", "🤠","👩🏾‍🦲", "👾"]
let facesTheme = ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓", "😎", "🥸", "🤩", "🥳", "😏", "😒","😞", "😔"]
let carsTheme = ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜"]

struct ContentView: View {
    @State var emojis: [String] = defaultTheme.shuffled()
    @State var theme: Themes = Themes.DEFAULT
    
    //    @State var emoji_count = 4
    //    var add: some View {
    //        Button(action: {
    //            if emoji_count == emojis.count{
    //                return
    //            }
    //            emoji_count += 1
    //        }, label: {
    //            Image(systemName: "plus.square.fill")
    //        })
    //    }
    //    var remove: some View{
    //        Button(action: {
    //            if emoji_count == 0{
    //                return
    //            }
    //                emoji_count -= 1
    //
    //        }, label: {
    //            Image(systemName: "minus.square.fill")
    //        })
    //    }
    
    var themeOne: some View {
        Button(action: {
            emojis = defaultTheme.shuffled()
            theme = Themes.DEFAULT
        }, label: {
            VStack{
                if theme == Themes.DEFAULT{
                    Image(systemName: "heart.circle.fill").font(.largeTitle)
                }else{
                    Image(systemName: "heart.circle").font(.largeTitle)
                }
                Text("Favorites")
            }
        })
    }
    
    var themeTwo: some View {
        Button(action: {
            emojis = facesTheme.shuffled()
            theme = Themes.FACES
        }, label: {
            VStack{
                if theme == Themes.FACES{
                    Image(systemName: "face.smiling.fill").font(.largeTitle)
                }else{
                    Image(systemName: "face.smiling").font(.largeTitle)
                }
                Text("Faces")
            }
        })
    }
    
    var themeThree: some View {
        Button(action: {
            emojis = carsTheme.shuffled()
            theme = Themes.CARS
        }, label: {
            VStack{
                if theme == Themes.CARS{
                    Image(systemName: "car.circle.fill").font(.largeTitle)
                }else{
                    Image(systemName: "car.circle").font(.largeTitle)
                }
                Text("Vehicles")
            }
        })
    }
    
    var body: some View {
        VStack{
            Text("Memorize!").font(.largeTitle)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(emojis, id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }.foregroundColor(.orange)
            }
            Spacer()
            HStack{
                themeOne
                Spacer()
                themeTwo
                Spacer()
                themeThree
            }
            
            
        }.padding()
    }
}

struct CardView: View {
    @State var isFaceUp:Bool = true
    var content: String
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content)
                    .font(.largeTitle)
            }else{
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}


