import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction(recipient: Address, id: UInt64) {

  prepare(acct: AuthAccount) {
    let collection = acct.borrow<&CryptoPoops.Collection>(from: /storage/Collection)!

    let ref = getAccount(recipient).getCapability(/public/Collection)
      .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
      ?? panic("No collection")

    ref.deposit(token: <- collection.withdraw(withdrawID: id))
  }

  execute {
    log("Transfer NFT")
  }
}
