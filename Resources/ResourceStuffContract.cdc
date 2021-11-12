pub contract ResourceStuff {

    pub resource HelloBucket {
        pub var hellos: @{UInt64: Hello}

        pub fun depositHello(hello: @Hello) {
            self.hellos[hello.uuid] <-! hello

            
            //var oldHello <- self.hellos[hello.uuid] <- hello
            //destroy oldHello
        }

        init() {
            self.hellos <- {}
        }

        destroy() {
            destroy self.hellos
        }
    }

    pub resource Hello {
        pub let greeting: String

        init(_greeting: String) {
            self.greeting = _greeting
        }
    }

    pub fun createHelloBucket(): @HelloBucket {
        var testHelloBucket: @HelloBucket <- create HelloBucket()
        
        return <- testHelloBucket
    }

    pub fun createHello(greeting: String): @Hello {
        var testResource: @Hello <- create Hello(_greeting: greeting)

        return <- testResource
    }
}