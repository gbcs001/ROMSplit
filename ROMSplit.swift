//
//  ROMSplit.swift
//  ROMSplit
//
//  Created by Clara Smith on 3/13/23.
//

import Foundation
var maskedRom = ""
var BINFileName = ""
var StartIndex = 0
let home = FileManager.default.homeDirectoryForCurrentUser
let DesktopDir = home.appendingPathComponent("Desktop/")
var BINPathUrl = DesktopDir

class ROMSplit {
    var ROMData: Data
    var ROMPathUrl = DesktopDir
    var outputFileName = ""
    var yesNo = "Y"
    
    init() {
        ROMData = Data.init()
    }
    
    let consoleIO = ConsoleIO()
    func interactiveMode() -> Bool {
        var Success = false
        consoleIO.writeMessage("WELCOME TO ROMSplit. \nThis program creates the High and Low masked ROM binary files for a vintage 68K processor Macintosh which can be used to program EEPROMs for the Mac's logic board.\n")
        consoleIO.writeMessage("Two binary files (HI_ROM.BIN & LO_ROM.BIN) will be created and placed on the Desktop.\n")
        var shouldQuit = false
        
        while !shouldQuit {
            consoleIO.writeMessage("Type the name of the .ROM source file located on the Desktop or q to quit")
            outputFileName = consoleIO.getInput()
            
            if outputFileName != "q" {
                do {
                    ROMPathUrl = ROMPathUrl.appendingPathComponent(outputFileName)
                    ROMData = try Data(contentsOf: ROMPathUrl)
                    consoleIO.writeMessage("You chose source file at path: " + ROMPathUrl.absoluteString + " Correct? Type Y or N")
                    yesNo = consoleIO.getInput()
                    if yesNo == "Y" {
                        shouldQuit = true
                        Success = true
                    }
                } catch {
                    consoleIO.writeMessage("File: " + ROMPathUrl.absoluteString + " could not be found on the Desktop")
                    ROMPathUrl = DesktopDir
                }
            } else {
                
                shouldQuit = true
                consoleIO.writeMessage("Bye!")
            }
        }
        
        return(Success)
    }
    
    
    func SplitROM(whichROM: String) {
        var BINHexArray = [UInt8]()
        StartIndex = 0
        
        if whichROM == "Low" {
            StartIndex = 2
            BINFileName = "LO_ROM.BIN"
            
        } else {
            BINFileName = "HI_ROM.BIN"
        }
        
        BINPathUrl = DesktopDir.appendingPathComponent(BINFileName)
        FileManager.default.createFile(atPath: BINPathUrl.absoluteString, contents: nil, attributes: nil)
        do {
            let ROMData: Data = try Data(contentsOf: ROMPathUrl)
            let HexArray = [UInt8](ROMData)
            while StartIndex < HexArray.count {
                // Flip the bytes in each word
                BINHexArray.append(HexArray[StartIndex + 1])
                BINHexArray.append(HexArray[StartIndex])
                StartIndex = StartIndex + 4
            }
            
            let data = Data.init(BINHexArray)
            try! data.write(to: BINPathUrl)
            
        } catch {
            fatalError("Can't find .ROM file at:\(ROMPathUrl)")
        }
    }
}
