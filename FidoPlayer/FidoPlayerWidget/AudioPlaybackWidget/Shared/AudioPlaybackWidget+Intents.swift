//
//  AudioPlaybackWidget+Intents.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//


import AppIntents
import AVFoundation
import WidgetKit
import Foundation


enum WidgetType: String {
    case audioPlayback
}

// MARK: - Helpers

extension WidgetType {
    var kind: String {
        rawValue + "Widget"
    }
}




final class AudioPlayer {
    private enum State {
        case playing
        case paused
        case stopped
        case disabled
    }

    static let shared = AudioPlayer()
    private var player: AVPlayer?
    private var state: State

private init() {
    do {
        let audioSession = AVAudioSession.sharedInstance()
        try audioSession.setActive(false)
        try audioSession.setCategory(.playback, mode: .default, options: [])
        try audioSession.setActive(true)
        state = .stopped
        print("AVAudioSession successfully configured and activated")
    } catch let error as NSError {
        state = .disabled
        print("AVAudioSession activation failed: \(error), \(error.userInfo)")
    }
}
    var isEnabled: Bool {
        state != .disabled
    }

    var isPlaying: Bool {
        state == .playing
    }
}

// MARK: - Actions

extension AudioPlayer {
    func play(streamURL: URL) {
        guard isEnabled else {
            return
        }
        if player == nil {
            player = AVPlayer(url: streamURL)
            print("AVPlayer initialized with URL: \(streamURL)")
            NotificationCenter.default.addObserver(
                self,
                selector: #selector(handlePlaybackError),
                name: .AVPlayerItemFailedToPlayToEndTime,
                object: player?.currentItem
            )
        }
        if let player {
            state = .playing
            player.play()
            print("AudioPlayer state set to .playing")
        } else {
            print("Play: Failed to initialize AVPlayer")
        }
    }

    @objc private func handlePlaybackError(notification: Notification) {
        if let error = notification.userInfo?[AVPlayerItemFailedToPlayToEndTimeErrorKey] as? Error {
            print("Playback error: \(error.localizedDescription)")
        }
    }

    func pause() {
        guard isEnabled, let player else {
            print("AudioPlayer is disabled or player is nil")
            return
        }
        state = .paused
        player.pause()
        print("AudioPlayer state set to .paused")
    }

    func stop() {
        guard isEnabled else {
            return
        }
        state = .stopped
        player?.pause()
        player = nil
    }
}



// MARK: - PlayIntent

struct AudioPlaybackWidgetPlayIntent: AudioPlaybackIntent {
    static var title: LocalizedStringResource = "Play Stream"

    private let streamURL: URL

    init(streamURL: URL) {
        self.streamURL = streamURL
    }

    init() {
        self.init(streamURL: URL(string: "https://sk.cri.cn/am846.m3u8")!)
    }

    func perform() async throws -> some IntentResult {
        AudioPlayer.shared.play(streamURL: streamURL)
        print("Play: Widget isPlaying: \(AudioPlayer.shared.isPlaying)")
        return .result()
    }
}

struct AudioPlaybackWidgetPauseIntent: AudioPlaybackIntent {
    static var title: LocalizedStringResource = "Pause Stream"

    func perform() async throws -> some IntentResult {
        AudioPlayer.shared.pause()
        print("Pause: Widget isPlaying: \(AudioPlayer.shared.isPlaying)")
        return .result()
    }
}
