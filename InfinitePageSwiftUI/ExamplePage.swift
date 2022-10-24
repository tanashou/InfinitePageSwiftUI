//
//  DemoView.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI

struct ExamplePage: View {
    @ObservedObject var viewModel: ViewModel
    
    init(pageIndex: Int) {
        self.viewModel = ViewModel(pageIndex: pageIndex)
    }
    
    var body: some View {
        Text("\(viewModel.pageIndex)")
    }
    
    
    // To modify pageIndex from other view.
    class ViewModel: ObservableObject {
        @Published var pageIndex: Int
        
        init(pageIndex: Int) {
            self.pageIndex = pageIndex
        }
        
        public func update(to index: Int) {
            pageIndex = index
        }
    }
}

struct DemoView_Previews: PreviewProvider {
    static var previews: some View {
        ExamplePage(pageIndex: 1)
    }
}
