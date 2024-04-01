# ⚙️ Sigleton Macro for Swift classes

This repository contains a simple implementation of a swift macro that allows you to create singletons in a more concise way.

Usage:

In order to apply a macro use @Singleton annotation before the class definition. Like this:

```swift
@Singleton
class MyClass {
	// class contents...
}
```

The macro will expand the class definition to a singleton implementation like this:

```swift

class MyClass {
	static let shared = MyClass()

	private init() {
	}
}
```

Thus making a shared instance of the class available out of the box.
