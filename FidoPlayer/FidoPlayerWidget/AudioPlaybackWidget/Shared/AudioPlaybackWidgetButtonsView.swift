//
//  AudioPlaybackWidgetButtonsView.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//

import SwiftUI

struct AudioPlaybackWidgetButtonsView: View {
    let isPlaying: Bool

    var body: some View {
        if isPlaying {
            pauseButton
        } else {
            playButton
        }
    }
}

// MARK: - Content

extension AudioPlaybackWidgetButtonsView {
    private var playButton: some View {
        Button(intent: AudioPlaybackWidgetPlayIntent()) {
            Image(systemName: "play.circle.fill")
                .padding(0)
        }
        .buttonStyle(.borderedProminent)
    }

    private var pauseButton: some View {
        Button(intent: AudioPlaybackWidgetPauseIntent()) {
            Image(systemName: "pause.circle.fill")
                .padding(0)
        }
        .buttonStyle(.borderedProminent)
    }
}
