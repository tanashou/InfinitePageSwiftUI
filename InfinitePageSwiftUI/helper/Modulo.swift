//
//  Modulo.swift
//  InfinitePageSwiftUI
//
//  Created by 田中翔真 on 2022/10/27.
//


infix operator %%
func %%(lhs: Int, rhs: Int) -> Int{
    return ((lhs % rhs) + rhs) % rhs
}
