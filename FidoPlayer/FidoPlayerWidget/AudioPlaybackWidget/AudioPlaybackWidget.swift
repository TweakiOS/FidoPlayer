//
//  AudioPlaybackWidget.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//

import SwiftUI
import WidgetKit

struct AudioPlaybackWidget: Widget {
    private let kind: String = WidgetType.audioPlayback.kind

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) {
            EntryView(entry: $0)
        }
        .configurationDisplayName("Audio Playback Widget")
        .description("Play Audio in the background directly from the Widget.")
        .supportedFamilies([.systemMedium, .systemSmall])
    }
}

// MARK: - Preview

#Preview(as: .systemMedium) {
    AudioPlaybackWidget()
} timeline: {
    AudioPlaybackWidget.Entry(isPlaying: false)
    AudioPlaybackWidget.Entry(isPlaying: true)
}

#Preview(as: .systemSmall) {
    AudioPlaybackWidget()
} timeline: {
    AudioPlaybackWidget.Entry(isPlaying: false)
    AudioPlaybackWidget.Entry(isPlaying: true)
}
