import HelloWorld from 0x01

transaction {

  prepare(acct: AuthAccount) {
    let myGreeting <- acct.load<@HelloWorld.Greeting>(from: /storage/MyGreeting)
        ?? panic("we could not load")

    log(myGreeting.greeting)

    destroy myGreeting
  }

  execute {
    log("take out")
  }
}
