//
//  PlayStreamIntent.swift
//  FidoPlayer
//
//  Created by TweakiOS on 5/3/25.
//


import AppIntents

struct PlayStreamIntent: AppIntent {
    static var title: LocalizedStringResource = "Play Stream"
    
    func perform() async throws -> some IntentResult {
        // Trigger play action in your app
        NotificationCenter.default.post(name: .playStream, object: nil)
        return .result()
    }
}

struct PauseStreamIntent: AppIntent {
    static var title: LocalizedStringResource = "Pause Stream"
    
    func perform() async throws -> some IntentResult {
        // Trigger pause action in your app
        NotificationCenter.default.post(name: .pauseStream, object: nil)
        return .result()
    }
}

extension Notification.Name {
    static let playStream = Notification.Name("playStream")
    static let pauseStream = Notification.Name("pauseStream")
}