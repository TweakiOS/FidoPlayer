//
//  AudioPlaybackWidget+Providers.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//


import WidgetKit

extension AudioPlaybackWidget {
    struct Provider: TimelineProvider {
        func placeholder(in context: Context) -> Entry {
            .placeholder
        }

        func getSnapshot(in context: Context, completion: @escaping (Entry) -> Void) {
            completion(.placeholder)
        }

        func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
            let entry = Entry(isPlaying: AudioPlayer.shared.isPlaying)
            print("AudioPlaybackWidget: Widget isPlaying: \(AudioPlayer.shared.isPlaying)")
            completion(.init(entries: [entry], policy: .never))
        }
    }
}
