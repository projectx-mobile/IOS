//
//  SupportInteractorIO.swift
//  Project X
//
//  Created by Alinser Shchurko on 9.11.22.
//
import Foundation
// MARK: Interactor protocols
protocol SupportInteractorInputProtocol: AnyObject {
    init(presenter: SupportInteractorOutputProtocol)
}
protocol SupportInteractorOutputProtocol: AnyObject {
}
