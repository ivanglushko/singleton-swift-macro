import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

/// Macro for generating static let shared property
/// It produces only one instance of the class
public struct SingletonMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard let classDecl = declaration.as(ClassDeclSyntax.self) else {
            fatalError("Could be applied to classes only")
        }
        let variable = try VariableDeclSyntax("static let shared = \(classDecl.name.trimmed)()")
        let initializer = try InitializerDeclSyntax("private init()") { }
        return [DeclSyntax(variable), DeclSyntax(initializer)]
    }
}

@main
struct SingletonPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        SingletonMacro.self,
    ]
}
