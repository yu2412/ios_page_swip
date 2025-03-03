//
//  ContentView.swift
//  Page_Swip
//
//  Created by 東山友輔 on 2025/03/01.
//

import SwiftUI

enum Page {
    case home, page1, page2
}

struct ContentView: View {
    @State private var currentPage: Page = .home

    var body: some View {
        ZStack {
            currentPageView()
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width < -100 { // 左スワイプ
                                goToNextPage()
                            } else if value.translation.width > 100 { // 右スワイプ
                                goToPreviousPage()
                            }
                        }
                )
        }
    }

    func currentPageView() -> some View {
        switch currentPage {
        case .home:
            return AnyView(Tab_HomeView(currentPage: $currentPage))
        case .page1:
            return AnyView(Page1View(currentPage: $currentPage))
        case .page2:
            return AnyView(Page2View(currentPage: $currentPage))
        }
    }

    func goToNextPage() {
        switch currentPage {
        case .home:
            currentPage = .page1
        case .page1:
            currentPage = .page2
        case .page2:
            break // 何もしない（最後のページ）
        }
    }

    func goToPreviousPage() {
        switch currentPage {
        case .home:
            break // 何もしない（最初のページ）
        case .page1:
            currentPage = .home
        case .page2:
            currentPage = .page1
        }
    }
}

struct HomeView: View {
    @Binding var currentPage: Page

    var body: some View {
        VStack {
            Text("ホーム画面")
                .font(.largeTitle)

            List {
                Text("大根")
                Text("キャベツ")
                Text("じゃがいも")
            }
        }
    }
}

struct Page1View: View {
    @Binding var currentPage: Page

    var body: some View {
        VStack {
            Text("Page 1")
                .font(.largeTitle)
            Button("ホームに戻る") {
                currentPage = .home
            }
            .padding()
        }
    }
}

struct Page2View: View {
    @Binding var currentPage: Page

    var body: some View {
        VStack {
            Text("Page 2")
                .font(.largeTitle)
            Button("ホームに戻る") {
                currentPage = .home
            }
            .padding()
        }
    }
}


#Preview {
    ContentView().environmentObject(UserSettings())
}
