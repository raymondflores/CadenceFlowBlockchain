import HelloWorld from 0x01

transaction {

  prepare(acct: AuthAccount) {}

  execute {
  // @Greeting
    let greeting <- HelloWorld.createGreeting()

    log(greeting.otherStuff)

    greeting.logOtherStuff()

    destroy greeting

    // @Greeting{IGreeting}
    let greeting2 <- HelloWorld.createRestrictedGreeting()

    //log(greeting2.otherStuff)
    //greeting2.logOtherStuff()

    HelloWorld.callMe(greetingResource: <- greeting2)
  }
}
