//
//  ContentView.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // PageView was adjusted for 5 pages only.
        // First element is set to be the middle.
        PageView(pages: [ExamplePage(pageIndex: 0),
                         ExamplePage(pageIndex: 1),
                         ExamplePage(pageIndex: 2),
                         ExamplePage(pageIndex: -2),
                         ExamplePage(pageIndex: -1)])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
