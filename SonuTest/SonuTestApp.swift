//
//  SonuTestApp.swift
//  SonuTest
//
//  Created by Josh Jaslow on 5/22/24.
//

import SwiftUI

@main
struct SonuTestApp: App {
    var body: some Scene {
        WindowGroup {
			GeometryReader { geo in
				VStack {
					Spacer()
					
					SlidingView()
						.background(.white)
						.environment(\.mainWindowSize, geo.size)
					
					Spacer()
				}
				.background(.green)
				.frame(width: geo.size.width,
					   height: geo.size.height)
			}
        }
    }
}

private struct MainWindowSizeKey: EnvironmentKey {
	static let defaultValue: CGSize = .zero
}

extension EnvironmentValues {
	var mainWindowSize: CGSize {
		get { self[MainWindowSizeKey.self] }
		set { self[MainWindowSizeKey.self] = newValue }
	}
}
