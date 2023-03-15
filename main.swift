//
//  main.swift
//  ROMSplit
//
//  Created by Clara Smith on 3/13/23.
//

import Foundation

let romsplit = ROMSplit()
if CommandLine.argc < 2 {
    if romsplit.interactiveMode() == true {
        romsplit.SplitROM(whichROM: "High")
        romsplit.SplitROM(whichROM: "Low")
    }
}
