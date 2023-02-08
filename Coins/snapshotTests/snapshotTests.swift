//
//  snapshotTests.swift
//  snapshotTests
//
//  Created by André  Costa Dantas on 06/02/23.
//

import SnapshotTesting
import XCTest
@testable import Coins

class MyViewControllerTests: XCTestCase {

  func testSplashViewController() {
    let vc = SplashViewController()
      assertSnapshot(matching: vc, as: .wait(for: 10
                                             , on: .image))
  }
}
