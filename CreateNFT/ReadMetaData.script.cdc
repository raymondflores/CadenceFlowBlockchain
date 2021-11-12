import CryptoPoops from 0x01
import NonFungibleToken from 0x02

pub fun main(acct: Address, id: UInt64): String {
  let ref = getAccount(acct).getCapability(/public/Collection)
    .borrow<&CryptoPoops.Collection{CryptoPoops.MyCollectionPublic}>()
    ?? panic("could not borrow")

    return ref.borrowEntireNFT(id: id).name
}
