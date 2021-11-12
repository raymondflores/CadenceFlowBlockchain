import HelloWorld from 0x01

transaction {

  prepare(acct: AuthAccount) {
    let myGreeting = acct.borrow<&HelloWorld.Greeting>(from: /storage/MyGreeting)
        ?? panic("we could not borrow")

    log(myGreeting.greeting)
  }

  execute {
    log("looked")
  }
}
