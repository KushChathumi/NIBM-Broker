//
//  CreateItemView.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-08.
//

import SwiftUI

struct CreateItemView: View {
    
    @State var show = false
    
    var body: some View {
        VStack{
            HStack(spacing: 15){
                Text("Advertisement")
                    .font(Font.custom("Noteworthy", size: 35))
                    .bold()
                    .foregroundColor(Color.white)
                
                Spacer(minLength: 0)
                
                Button(action:{
                    self.show.toggle()
                   
                } ){
                    Text("Back")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,25)
                        .background(Color.red)
                        .cornerRadius(10)
                }
            }
            .padding() 
            .background(Color.cyan)
            
            Spacer(minLength: 0)
            
        }
        .fullScreenCover(isPresented: self.$show){
            MainView()
        }
        
    }
}

struct CreateItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateItemView()
    }
}
