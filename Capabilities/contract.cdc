pub contract HelloWorld {

    pub resource interface IGreeting {
        pub let greeting: String
    }

    pub resource Greeting: IGreeting {
        pub let greeting: String
        pub let otherStuff: String

        init() {
            self.greeting = "Hello World"
            self.otherStuff = "cant see"
        }
    }

    pub fun createGreeting(): @Greeting {
        return <- create Greeting()
    }

    init() {

    }
}