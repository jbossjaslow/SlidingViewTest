//
//  ContentView.swift
//  SonuTest
//
//  Created by Josh Jaslow on 5/22/24.
//

import SwiftUI

struct SlidingView: View {
	@Environment(\.mainWindowSize) var mainWindowSize
	
	@State private var offset: CGFloat = 0
	@State private var currentOffset: CGFloat = 0
	
	let gap: CGFloat = 5
	let dragIconSize: CGFloat = 50
	
	var finalOffset: CGFloat {
		(offset + currentOffset).clamped(to: lowerBound...upperBound)
	}
	
	var lowerBound: CGFloat {
		-(mainWindowSize.width / 2) + (dragIconSize / 2)
	}
	var upperBound: CGFloat {
		(mainWindowSize.width / 2) - (dragIconSize / 2)
	}
	
	var body: some View {
		ZStack {
			Image(.house1)
				.resizable()
				.scaledToFit()
				.frame(width: mainWindowSize.width)
				.mask(alignment: .trailing) {
					Rectangle()
						.frame(width: (mainWindowSize.width / 2) - finalOffset - (gap / 2))
				}
			
			Image(.house2)
				.resizable()
				.scaledToFit()
				.frame(width: mainWindowSize.width)
				.mask(alignment: .leading) {
					Rectangle()
						.frame(width: (mainWindowSize.width / 2) + finalOffset - (gap / 2))
				}
			
			DragIcon()
				.frame(width: dragIconSize,
					   height: dragIconSize)
				.gesture(dragGesture)
				.offset(x: finalOffset)
		}
    }
	
	var dragGesture: some Gesture {
		DragGesture(minimumDistance: 0)
			.onChanged { value in
				currentOffset += value.translation.width
			}
			.onEnded { _ in
				offset += currentOffset
				currentOffset = 0
			}
	}
}

extension Comparable {
	func clamped(to limits: ClosedRange<Self>) -> Self {
		return min(max(self, limits.lowerBound), limits.upperBound)
	}
}

#Preview {
	SlidingView()
}
