import CryptoPoops from 0x01
import NonFungibleToken from 0x02

transaction(recipient: Address) {

  prepare(acct: AuthAccount) {
    let nftMinter = acct.borrow<&CryptoPoops.NFTMinter>(from: /storage/Minter)!

    let ref = getAccount(recipient).getCapability(/public/Collection)
      .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
      ?? panic("No collection")

    ref.deposit(token: <- nftMinter.createNFT())
  }

  execute {
    log("Mint NFT and Store")
  }
}
