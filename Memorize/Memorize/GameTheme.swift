//
//  GameTheme.swift
//  Memorize
//
//  Created by Will on 1/6/21.
//
// VIEW-MODEL Theme

import Foundation
import SwiftUI

struct GameTheme {
    var name: String
    var emojis: [String]
    var primaryColor: Color
    var accentColor: Color
    
    static let halloween = GameTheme(name: "Halloween", emojis: ["👻", "🕷", "🎃", "👺", "💀", "👿", "🤡", "😡", "🤖", "👁", "🕸", "🖤"], primaryColor: .orange, accentColor: .blue)
    static let animals = GameTheme(name: "Animals", emojis: ["🐱", "🐰", "🐼", "🐇", "🐔", "🐢", "🦍", "🦉", "🐳", "🦜", "🦨", "🐪"], primaryColor: .green, accentColor: .gray)
    static let sports = GameTheme(name: "Sports", emojis: ["⚽️", "🏓","🎳","🏒","🏉","🏊","🥊","🏅","🏎","🏂","🥋","🏄‍♂️"],
        primaryColor: .red, accentColor: .blue)
    static let faces = GameTheme(name: "Faces", emojis: ["🥺","🥳","🤩","🥴","🤭","🥵","🤓","🥱","🥸","🥶","🥰","😭"],
        primaryColor: .gray, accentColor: .blue)
    static let shapes = GameTheme(name: "Shapes", emojis: ["◉","☐","❖","▲","•","☞","✩","✺","✿","❤︎","﹅","☆"],
        primaryColor: .pink, accentColor: .green)
    static let objects = GameTheme(name: "Objects", emojis: ["☎️","📀","🕹","📟","⏱","⏰","⌛️","💡","💰","🧲","💣","💈"],
        primaryColor: .red, accentColor: .black)
    static var themes = [halloween, animals, sports, faces, shapes, objects]
}

