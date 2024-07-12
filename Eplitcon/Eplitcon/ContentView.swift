//
//  ContentView.swift
//  Eplitcon
//
//  Created by iOS Developer on 11/07/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()

    var body: some View {
        HStack {
                    Button(action: {
                        // Back button action
                    }) {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(Color.orange)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Text("Frenley")
                .font(.title2)
                        .foregroundColor(Color.orange)
                    
                    Spacer()
                    
                    Button(action: {
                        // Right button action
                    }) {
                        Image(systemName: "bolt")
                            .foregroundColor(Color.orange)
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                .padding()
                .background(Color.orange.opacity(0.10)) // Light background color
            
        ScrollView {
                
                    if let user = networkManager.user {
                        
                        // Section 01
                        Section {
                            VStack {
                                
                                    ForEach(user.photoList, id: \.positionInPics) { photo in
                                        if let url = URL(string: photo.imageUrl) {
                                            AsyncImage(url: url)
                                                
                                        }
                                    }
                                
                                HStack {
                                    Text("\(user.firstName)  \(user.lastName),")
                                       
                                    Text("23")
                                    Image(systemName: ("person.crop.circle.badge.checkmark"))
                                        .foregroundColor(Color.blue)
                                } .font(.nunito(size: 26))
                                .padding(.leading)
                            
                                
                            }
                        }
                    Spacer()
                        
                        // Section 02
                        
                        Section {
                            VStack (alignment: .leading){
                                
                                Text("About Me").bold()
                                    .font(.nunito(size: 24))
                                Text((user.aboutMe))
                                    .fontWeight(.light)
                                    .frame(width:320,height: 120)
                            }
                        }
                        .font(.nunito(size: 15))
                       
                        
                        // Section 03
                    
                        Section {
                            VStack(alignment: .leading){
                                Text("My Basic Info").bold()
                                    .font(.nunito(size: 22))
                                Text("Id: \(user.id)")
                                    .font(.nunito(size: 15))
                                Text("Date Of Birth : \(user.dateOfBirth)")
                                    .font(.nunito(size: 15))
                        }
                       
                        }
                        .frame(alignment: .leading)
                            .padding()
                        
                     
                        
                        
                        // Section 04
                        
                        Section {
                            VStack(alignment: .leading){
                                Spacer()
                                Text("My Interests").bold()
                                    .font(.nunito(size: 20))
                                HStack{
                                    ForEach(user.usersInterestList, id: \.interestTitle) { interest in
                                        HStack {
                                            Image(systemName: "point.3.filled.connected.trianglepath.dotted")
                                            Text( (interest.interestTitle))
                                        }
                                        .font(.nunito(size: 15))
                                            .frame(width: 100,height: 26)
                                            .foregroundColor(Color.orange.opacity(1.00))
                                            .background(Color.orange.opacity(0.30))
                                            .cornerRadius(21)
                                                                                    
                                        Spacer()
                                    }
                
                                }.frame(maxWidth: .infinity, alignment: .leading)
                                    .padding()
                            
                               
                               
                            }
                            .padding()
                            
                        }
                        .frame(width:360,height: 130)
                        
                        
                        // Section 05
                        // Location
                        
                            VStack(alignment: .leading) {
                                Text("Location")
                                    .bold()
                                    .font(.nunito(size: 18))
                                   
                                
                                HStack {
                                    Image(systemName: "location.circle.fill")
                                    Text("\(user.city),")
                                    Text("\(user.country)")
                                }
                                .frame(maxWidth: .infinity,alignment: .leading)
                                .font(.nunito(size: 15))
                                
                            }
                            .frame(width:320,height: 130)
                            
                        
                        
                        // Section 6
                        
                        ZStack {
                                    
                                    HStack(spacing: 90) {
                                        Spacer()
                                        
                                        ZStack {
                                            Circle()
                                                .fill(Color.gray)
                                                .frame(width: 70, height: 70)
                                            Image(systemName: "xmark")
                                                .foregroundColor(.white)
                                                .font(.nunito(size: 15))
                                        }
                                        
                                        
                                        ZStack {
                                            Circle()
                                                .fill(Color.yellow)
                                                .frame(width: 70, height: 70)
                                            Image(systemName: "heart.fill")
                                                .foregroundColor(.white)
                                                .font(.nunito(size: 15))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(.bottom, 60)
                                    
                                    
                                    HStack(spacing: 25) {
                                        ZStack {
                                            Circle()
                                                .fill(Color.red)
                                                .frame(width: 50, height: 50)
                                            Image(systemName: "person.crop.circle")
                                                .foregroundColor(.white)
                                                .font(.nunito(size: 15))
                                        }
                                        
                                        ZStack {
                                            Circle()
                                                .fill(Color.orange)
                                                .frame(width: 50, height: 50)
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.white)
                                                .font(.nunito(size: 15))
                                                
                                        }
                                    }
                                    .padding(.top, 150)
                                }
                        .padding(.bottom, 150)
                       
                    } else {
                        Text("Loading...")
                            .font(.nunito(size: 25))
                            .onAppear {
                                networkManager.fetchUser()
                            }
                    }
            }
        .padding([.leading, .trailing], 16)
        .ignoresSafeArea()
        }
        
    }
extension Font {
    static func nunito(size: CGFloat) -> Font {
        return Font.custom("Nunito", size: size)
    }
}

#Preview {
    ContentView()
}


