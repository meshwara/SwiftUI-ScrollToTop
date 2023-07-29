//
//  ContentView2.swift
//  ScrollToTop
//
//  Created by D. Prameswara on 29/07/23.
//

import SwiftUI

struct ContentView2: View {
    @State private var isShow = false
    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(1 ... 100, id: \.self) { i in
                    Text("                           item number \(i)")
                        .overlay {
                            if i == 1 {
                                GeometryReader { geo in
                                    Text("\(geo.frame(in: .global).minY)")
                                        .onChange(of: geo.frame(in: .global).minY) { y in
                                            withAnimation(.easeIn(duration: 0.2)) {
                                                isShow = y < 20
                                            }
                                        }
                                }
                            }
                        }
                        .id(i)
                }
            }
            Button("Move to top") {
                withAnimation(.easeIn(duration: 1.0)) {
                    proxy.scrollTo(1)
                }
            }
            .opacity(isShow ? 1 : 0)
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
