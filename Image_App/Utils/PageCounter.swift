//
//  PageCounter.swift
//  Image_App
//
//  Created by Can on 10.03.2021.
//

struct PageCounter {

    static var currentPage: Int = 1
    let maxPages: Int = 26

    static var hasMorePages: Bool {
        return currentPage < 26
    }

    static var nextPage: Int {
        return hasMorePages ? PageCounter.currentPage + 1: PageCounter.currentPage
    }
}

