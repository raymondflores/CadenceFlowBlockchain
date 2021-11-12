import HelloWorld from 0x01

pub fun main(account: Address) {
  let publicMyGreeting = getAccount(account).getCapability(/public/MyGreetingPublic)
                            .borrow<&HelloWorld.Greeting{HelloWorld.IGreeting}>()
                            ?? panic("couldnt borrow")

  log(publicMyGreeting.greeting)
}
