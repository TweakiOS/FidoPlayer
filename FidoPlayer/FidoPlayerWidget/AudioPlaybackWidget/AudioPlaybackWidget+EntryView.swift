//
//  AudioPlaybackWidget+EntryView.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//

import SwiftUI

struct WidgetHeaderView: View {
    var title: LocalizedStringResource

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .fixedSize()
            Spacer(minLength: 0)
        }
    }
}

extension AudioPlaybackWidget {
    struct EntryView: View {
        let entry: AudioPlaybackWidget.Entry
        
        @Environment(\.widgetFamily) var family
        
        var body: some View {
            switch family {
            case .systemSmall:
                VStack {
                    WidgetHeaderView(title: "Fido Player")
                    Spacer()
                    AudioPlaybackWidgetButtonsView(isPlaying: entry.isPlaying)
                }
                .containerBackground(.clear, for: .widget)
            case .systemMedium:
                VStack {
                    WidgetHeaderView(title: "Fido Player")
                    Spacer()
                    AudioPlaybackWidgetButtonsView(isPlaying: entry.isPlaying)
                }
                .containerBackground(.clear, for: .widget)
            default:
                EmptyView()
            }
        }
    }
}
