# ⚙️ Sigleton Macro for Swift classes

This repository contains a simple implementation of a swift macro that allows you to create singletons in a more concise way.

## Usage:

1. Add a package dependecy to your project
2. In order to apply a macro use `@Singleton` annotation before the class definition. Like this:

```swift
import Singleton

@Singleton
class MyClass {
    // class contents...
}
```

3. The macro will expand the class definition to a singleton implementation like this:

```swift
import Singleton


class MyClass {

    static let shared = MyClass()

    private init() {
    }
}
```

4. Thus making a `MyClass.shared` instance of the class available out of the box.
