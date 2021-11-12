pub contract HelloWorld {

    pub resource interface IGreeting {
        pub let greeting: String

        access(contract) fun logOtherStuff()
    }

    pub resource Greeting: IGreeting {
        pub let greeting: String
        pub let otherStuff: String

        pub fun logOtherStuff() {
            log(self.otherStuff)
        }

        init() {
            self.greeting = "Hello World"
            self.otherStuff = "cant see"
        }
    }

    pub fun createGreeting(): @Greeting {
        return <- create Greeting()
    }

    pub fun createRestrictedGreeting(): @Greeting{IGreeting} {
        return <- create Greeting()
    }

    pub fun callMe(greetingResource: @Greeting{IGreeting}) {
        greetingResource.logOtherStuff()

        destroy greetingResource
    }

    init() {

    }
}