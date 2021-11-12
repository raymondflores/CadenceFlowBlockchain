import CryptoPoops from 0x01
import NonFungibleToken from 0x02

pub fun main(acct: Address): [UInt64] {
  let ref = getAccount(acct).getCapability(/public/Collection)
    .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
    ?? panic("could not borrow")

    return ref.getIDs()
}
