//
//  PageView.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI

struct PageView: View {
    @State var currentPageId: Int = 2
    @State var carry = 0
    @State var hasMovedForward = false
    
    var currentPageIndex: Int {
        currentPageId + pages.count * carry
    }
    
    var pages: [ExamplePage]
    
    var body: some View {
        PageViewController(pages: pages, currentPageId: $currentPageId, carry: $carry, hasMovedForward: $hasMovedForward)
            .onChange(of: currentPageId) { newValue in
                if hasMovedForward {
                    // TODO:
                    let updatingPageId = (newValue + 2) % pages.count
                    pages[updatingPageId].viewModel.update(to: currentPageIndex + 2)
                } else {
                    // TODO:
                    let updatingPageId = (newValue + 3) % pages.count
                    pages[updatingPageId].viewModel.update(to: currentPageIndex - 2)
                }
            }
//            .onChange(of: currentPageId) { [currentPageId] newValue in
//                let currentPageIndex = currentPageId + pages.count * carry
//
//                switch newValue - currentPageId {
//                case 1:
//                    let updatingPageId = (currentPageId + 3) % pages.count
//                    pages[updatingPageId].viewModel.update(to: currentPageIndex + 3)
//                    print("forward, currentPageId: \(currentPageId), carry: \(carry)")
//
//                case 1 - pages.count:
//                    let updatingPageId = (currentPageId + 3) % pages.count
//                    carry += 1
//                    pages[updatingPageId].viewModel.update(to: currentPageIndex + 3)
//                    print("forward count++, currentPageId: \(currentPageId), carry: \(carry)")
//
//                case -1:
//                    let updatingPageId = (currentPageId + 2) % pages.count
//                    pages[updatingPageId].viewModel.update(to: currentPageIndex - 3)
//                    print("backward, currentPageId: \(currentPageId), carry: \(carry)")
//
//                case pages.count - 1:
//                    let updatingPageId = (currentPageId + 2) % pages.count
//                    carry -= 1
//                    pages[updatingPageId].viewModel.update(to: currentPageIndex - 3)
//                    print("backward count--, currentPageId: \(currentPageId), carry: \(carry)")
//
//
//                default:
//                    // TODO: newValueを中心に全て再描画する
//                    // FIXME: 指を起き直して複数のページを連続でページを移動させた場合，
//                    print("ERROR!! newValue: \(newValue), current: \(currentPageId)")
//                    break
//                }
//            }
    }
}
