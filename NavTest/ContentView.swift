//
//  ContentView.swift
//  NavTest
//
//  Created by Shah, Om on 3/18/24.
//

import SwiftUI

var courses:[Courses] = [.init(name: "Math", color: .red, imageName: "number.square"), .init(name: "Science", color: .green, imageName: "atom"), .init(name: "History", color: .yellow, imageName: "book")]

var meetings:[Meetings] = [.init(name: "Dinner", color: .red, location: "Velvet Taco", imageName: "fork.knife.circle"), .init(name: "Midnight Snack", color: .green, location: "Burger Mojo", imageName: "takeoutbag.and.cup.and.straw.fill")]



struct ContentView: View {
    
    @State private var path: [Meetings] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            
            List{
                Section("My Courses"){
                    ForEach(courses, id:\.name){
                        course in
                        NavigationLink(value: course){
                            Label(course.name, systemImage: course.imageName).foregroundColor(course.color)
                        }
                    }
                }
               /* Section("My Meetings"){
                    ForEach(meetings, id:\.name){
                        meeting in
                        NavigationLink(value: meeting){
                            Label(meeting.name, systemImage: meeting.imageName).foregroundColor(meeting.color)
                
                        }
                    }
                } */
                Section("My Meetings"){
                    Button("Add Meeting"){
                        path = meetings
                        path.append(meetings.first!)
                    }
                }
            

            }
            .navigationTitle("My Schedule")
            .navigationDestination(for: Courses.self) { course in
                ZStack{
                    course.color
                        .ignoresSafeArea()
                    Label(course.name, systemImage: course.imageName)
                        .font(.largeTitle).bold()
                }
            }
            .navigationDestination(for: Meetings.self) { meeting in
                ZStack{
                    meeting.color
                        .ignoresSafeArea()
                    Label(meeting.name, systemImage: meeting.imageName)
                        .font(.largeTitle).bold()
                }
            }
        }
    }
        
}

#Preview {
    ContentView()
}

struct Courses:Hashable{
    let name:String
    let color:Color
    let imageName:String
}

struct Meetings:Hashable{
    let name:String
    let color:Color
    let location:String
    let imageName:String
}
