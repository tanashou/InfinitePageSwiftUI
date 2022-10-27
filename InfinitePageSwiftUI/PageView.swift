//
//  PageView.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI

struct PageView: View {
    @State var currentPage: Int = 0
    var pages: [ExamplePage]
    
    var body: some View {
        PageViewController(pages: pages, currentPage: $currentPage)
            .onChange(of: currentPage) { [currentPage] newValue in
                switch newValue - currentPage {
                case 1:
                    let updatingPageId = (newValue + 2) %% pages.count // Example for 5 pages. Change the number if defalt page number is not 5.
                    pages[updatingPageId].viewModel.updateIndex(to: newValue + 2)
                    
                case -1:
                    let updatingPageId = (newValue - 2) %% pages.count
                    pages[updatingPageId].viewModel.updateIndex(to: newValue - 2)
                    
                default:
                    break
                }
            }
    }
}
