//
//  PageViewController.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/17.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    var pages: [Page]
    @Binding var currentPageId: Int
    @Binding var carry: Int
    @Binding var hasMovedForward: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        pageViewController.setViewControllers(
            [context.coordinator.controllers[currentPageId]], direction: .forward, animated: false)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        var controllers = [UIViewController]()
        
        init(_ pageViewController: PageViewController) {
            parent = pageViewController
            controllers = parent.pages.map { UIHostingController(rootView: $0) }
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController? {
                guard let index = controllers.firstIndex(of: viewController) else {
                    return nil
                }
                if index == 0 {
                    return controllers.last
                }
                return controllers[index - 1]
            }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController? {
                guard let index = controllers.firstIndex(of: viewController) else {
                    return nil
                }
                if index + 1 == controllers.count {
                    return controllers.first
                }
                return controllers[index + 1]
            }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool) {
                if completed,
                   let visibleViewController = pageViewController.viewControllers?.first,
                   let currentPageId = controllers.firstIndex(of: visibleViewController) {
                    let previousIndex = parent.currentPageId
                    switch currentPageId - previousIndex {
                    case 1:
                        parent.hasMovedForward = true
                        
                    case 1 - controllers.count:
                        parent.carry += 1
                        parent.hasMovedForward = true
                        
                    case -1:
                        parent.hasMovedForward = false
                        
                    case controllers.count - 1:
                        parent.carry -= 1
                        parent.hasMovedForward = false
                        
                    default:
                        print("error")
                        break
                    }
                    parent.currentPageId = currentPageId
                }
            }
    }
}

