//
//  WithStructData.swift
//  ScrollToTop
//
//  Created by D. Prameswara on 29/07/23.
//
import SwiftUI

struct Person: Identifiable {
    var id: Int
    var name: String

    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct WithStructData: View {
    private var persons: [Person] = [
        Person(id: 10, name: "Elmer Oconnell"),
        Person(id: 14, name: "Montgomery Norman"),
        Person(id: 8, name: "Jake Bass"),
        Person(id: 20, name: "Nikodem Garza"),
        Person(id: 31, name: "Ashwin Salinas"),
        Person(id: 79, name: "Jason Mcgowan"),
        Person(id: 1002, name: "Natasha Fernandez"),
        Person(id: 21, name: "Chris Duncan"),
        Person(id: 231, name: "Kimberly Sloan"),
        Person(id: 154, name: "Amber Mcbride"),
        Person(id: 876, name: "Chris Duncan"),
        Person(id: 5041, name: "Chantelle Dyer"),
        Person(id: 3964, name: "Alexa Lucero"),
        Person(id: 805, name: "Timothy Graves"),
    ]
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                List {
                    ForEach(persons.indices, id:\.self) { i in
                        let person = persons[i]
                        VStack(alignment: .leading) {
                            Text(person.name)
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ultricies ex id ex posuere blandit. Donec semper ligula ut velit molestie malesuada")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                        }
                        .id(i)
                    }
                }
                Button("Move to top") {
                    withAnimation(.easeIn(duration: 1.0)) {
                        proxy.scrollTo(0)
                    }
                }
            }
        }
    }
}

struct WithStructData_Previews: PreviewProvider {
    static var previews: some View {
        WithStructData()
    }
}
