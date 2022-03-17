import NonFungibleToken from 0x179b6b1cb6755e31
import ExampleNFT from 0x01cf0e2f2f715450
transaction() {

    // The reference to the Minter resource stored in account storage
    let minterRef: &ExampleNFT.NFTMinter

    prepare(minter: AuthAccount) { 
        // Borrow a capability for the NFTMinter in storage
        self.minterRef = minter.borrow<&ExampleNFT.NFTMinter>(from: ExampleNFT.MinterStoragePath)
            ?? panic("could not borrow minter reference")

        let receiver = getAccount(0xe03daebed8ca0615)
        // Get the owner's collection capability and borrow a reference
        let receiver1Ref = receiver.getCapability<&{NonFungibleToken.CollectionPublic}>(ExampleNFT.CollectionPublicPath)
            .borrow()
            ?? panic("Could not borrow receiver reference")

        // Use the minter reference to mint an NFT, which deposits
        // the NFT into the collection that is sent as a parameter.
        self.minterRef.mintNFT(recipient: receiver1Ref, name: "Nasir", description: "first NFT", thumbnail: "nft", image: "https:madbop.com")
    }

    execute {

    }
}
