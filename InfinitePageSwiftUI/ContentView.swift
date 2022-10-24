//
//  ContentView.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        PageView(pages: [ExamplePage(pageIndex: 0),
                         ExamplePage(pageIndex: 1),
                         ExamplePage(pageIndex: 2),
                         ExamplePage(pageIndex: 3),
                         ExamplePage(pageIndex: 4)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
