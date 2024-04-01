/// A macro that produces a private init() and a shared property
///
/// Could be used with classes only
@attached(member, names: named(shared), named(init))
public macro Singleton() = #externalMacro(module: "SingletonMacros", type: "SingletonMacro")
