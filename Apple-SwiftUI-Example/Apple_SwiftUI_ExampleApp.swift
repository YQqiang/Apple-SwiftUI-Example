//
//  Apple_SwiftUI_ExampleApp.swift
//  Apple-SwiftUI-Example
//
//  Created by qiang on 2020/10/29.
//

import SwiftUI

@main
struct Apple_SwiftUI_ExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserData())
                .onAppear {
                    print("ContentView appear")
                }
                .onDisappear {
                    print("ContentView disappear")
                }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .active {
               print("active")
            } else if phase == .background {
                print("background")
            } else if (phase == .inactive) {
                print("inactive")
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(#function)
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        print(#function)
    }
}
