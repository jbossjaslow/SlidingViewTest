//
//  DragIcon.swift
//  SonuTest
//
//  Created by Josh Jaslow on 5/22/24.
//

import SwiftUI

struct DragIcon: View {
	var body: some View {
		Circle()
			.fill(.black)
			.overlay {
				Image(systemName: "arrowtriangle.left.and.line.vertical.and.arrowtriangle.right.fill")
					.resizable()
					.scaledToFit()
					.foregroundStyle(.white)
					.padding(10)
			}
	}
}

#Preview {
	DragIcon()
}
