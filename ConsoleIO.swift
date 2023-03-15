//
//  ConsoleIO.swift
//  ROMSplit
//
//  Created by Clara Smith on 3/13/23.
//

import Foundation

enum OutputType {
  case error
  case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
      switch to {
      case .standard:
        print("\(message)")
      case .error:
        fputs("Error: \(message)\n", stderr)
      }
    }

    
    func getInput() -> String {

      let keyboard = FileHandle.standardInput

      let inputData = keyboard.availableData

      let strData = String(data: inputData, encoding: String.Encoding.utf8)!

      return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
