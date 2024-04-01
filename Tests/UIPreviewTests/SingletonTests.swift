import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

#if canImport(SingletonMacros)
import SingletonMacros

let testMacros: [String: Macro.Type] = [
    "Singleton": SingletonMacro.self
]

final class SingletonTests: XCTestCase {

    func testSingletonMacro() throws {
        assertMacroExpansion(
            """
            @Singleton
            final class MyClass {
            }
            """,
            expandedSource:
            """

            final class MyClass {

                static let shared = MyClass()

                private init() {
                }
            }
            """,
            macros: testMacros
        )
    }
}

#endif
