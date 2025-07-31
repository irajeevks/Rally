//
//  TabItemProvider.swift
//  Rally
//
//  Created by Rajeev on 31/07/25.
//

import SwiftUI

protocol TabItemProvider: CaseIterable, Equatable {
    var image: Image { get }
}
