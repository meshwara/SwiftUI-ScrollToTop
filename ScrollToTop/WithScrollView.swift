//
//  WithScrollView.swift
//  ScrollToTop
//
//  Created by D. Prameswara on 29/07/23.
//

import SwiftUI

struct WithScrollView: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                LazyVStack {
                    ForEach(1 ... 100, id: \.self) { i in
                        Text("Item number \(i)")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.vertical, 5)
                            .id(i)
                    }
                }
                .padding()
            }

            Button("Move to top") {
                withAnimation(.easeIn(duration: 1.0)) {
                    proxy.scrollTo(1)
                }
            }
        }
        .navigationTitle("Move to top")
    }
}

struct WithScrollView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WithScrollView()
        }
    }
}
