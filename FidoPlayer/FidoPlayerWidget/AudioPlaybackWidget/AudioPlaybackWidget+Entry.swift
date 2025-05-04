//
//  AudioPlaybackWidget+Entry.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//


import WidgetKit

extension AudioPlaybackWidget {
    struct Entry: TimelineEntry {
        var date: Date = .now
        var isPlaying: Bool
    }
}

// MARK: - Data

extension AudioPlaybackWidget.Entry {
    static var placeholder: Self {
        .init(isPlaying: false)
    }
}
