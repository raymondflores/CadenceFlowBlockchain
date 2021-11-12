import ResourceStuff from 0x01

transaction {

  prepare(acct: AuthAccount) {}

  execute {
    var bucket: @ResourceStuff.HelloBucket <- ResourceStuff.createHelloBucket()
    bucket.depositHello(hello: <- ResourceStuff.createHello(greeting: "hello"))
    bucket.depositHello(hello: <- ResourceStuff.createHello(greeting: "hello"))
    bucket.depositHello(hello: <- ResourceStuff.createHello(greeting: "hello"))

    log(bucket.hellos.keys)
    destroy bucket
    log("done")
  }
}
