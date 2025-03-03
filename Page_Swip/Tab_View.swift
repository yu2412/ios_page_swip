//
//  Tab_View.swift
//  Page_Swip
//
//  Created by 東山友輔 on 2025/03/03.
//

import SwiftUI


struct Tab_View: View {
    @State private var currentPage: Page = .home

    var body: some View {
        TabView(selection: $currentPage) {
            Tab_HomeView(currentPage: $currentPage)
                .tag(Page.home)

            Page3View(currentPage: $currentPage)
                .tag(Page.page1)

            Page4View(currentPage: $currentPage)
                .tag(Page.page2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always)) // スワイプでページ切り替え
    }
}

struct Tab_HomeView: View {
    @Binding var currentPage: Page

    var body: some View {
        VStack {
            Text("ホーム画面")
                .font(.largeTitle)

            Button("Page 1へ") {
                currentPage = .page1
            }
            .padding()

            Button("Page 2へ") {
                currentPage = .page2
            }
            .padding()
        }
    }
}

struct Page3View: View {
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

struct Page4View: View {
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
    Tab_View()
}
