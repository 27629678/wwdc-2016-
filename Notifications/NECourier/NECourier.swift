//
//  NECourier.swift
//  Notifications
//
//  Created by hzyuxiaohua on 16/8/9.
//  Copyright © 2016年 X Co., Ltd. All rights reserved.
//

import Foundation

class Courier {
    
    var groupIdentifier: String! = nil
    
    init(groupIdentifier id: String) {
        self.groupIdentifier = id
    }
    
    func sendmessage(_ message: String, command cmd: String) -> Bool {
        if cmd.characters.count == 0 {
            return false
        }
        
        let directory = messageContainerPath(command: cmd)
        guard directory != nil else {
            return false
        }
        
        let timeStamp = Date(timeIntervalSinceNow: 0).timeIntervalSince1970
        let path = String(format: "%@/%f.msg", directory!, timeStamp)
        do {
            try message.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
        }
        catch {
            print("<Courier.send message:\(message), command:\(cmd) failed with error:\(error)!>")
        }
        
        return true
    }
    
    func receive(messageWithCommand cmd: String) -> [String] {
        let directory = messageContainerPath(command: cmd)
        guard directory != nil else {
            return []
        }
        
        var retMsgs = [String]()
        do {
            let files = try FileManager.default.contentsOfDirectory(atPath: directory!)
            for file in files {
                let path = String(format: "%@/%@", directory!, file)
                let message = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                if message.characters.count > 0 {
                    retMsgs.append(message)
                }
                
                try FileManager.default.removeItem(atPath: path)
            }
        }
        catch {
            print("<Courier.receive message with command:\(cmd) raise error:\(error)>")
        }
        
        return retMsgs
    }
    
    private func messageContainerPath(command cmd: String!) -> String? {
        let groupUrl = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: groupIdentifier)
        guard groupUrl != nil else {
            return nil
        }
        
        let path = groupUrl?.path.appending("/Courier/").appending(cmd)
        if createDirectory(path) {
            return path
        }
        
        return nil
    }
    
    private func createDirectory(_ directory: String!) -> Bool
    {
        var isDir = ObjCBool(false)
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: directory, isDirectory: &isDir) && isDir.boolValue {
            return true
        }
        
        do {
            try fileManager.createDirectory(atPath: directory,
                                            withIntermediateDirectories: true,
                                            attributes: nil)
        }
        catch {
            print("<Courier.create directory:\(directory) raise error:\(error)>")
            return false
        }
        
        return true
    }
}
