
module my_nft::my_nft;
use std::string::String;
use std::string;
use sui::transfer::transfer;
use sui::tx_context::sender;


public struct MyNFT has key {
    id:UID,
    name:String,
    image_url:String,
}

fun init(ctx:&mut TxContext){
    let my_nft = MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"My NFT"),
        image_url:string::utf8(b"https://pic1.zhimg.com/v2-d1fb3b707a1dfaae70ea38780e725cd4_1440w.jpg")
    };

    transfer(my_nft, sender(ctx));
}

public entry fun mint(url:String, ctx:&mut TxContext){
        let my_nft = MyNFT{
        id:object::new(ctx),
        name:string::utf8(b"My NFT"),
        image_url: url,
    };

    transfer(my_nft, sender(ctx));
}

public struct Sword has key {
    id:UID,
    magic:u64,
    strength:u64,
}

#[test]
fun test_sword_create() {
    // Create a dummy TxContext for testing
    let mut ctx = tx_context::dummy();

    // Create a sword
    let sword = Sword {
        id: object::new(&mut ctx),
        magic: 42,
        strength: 7,
    };
    // print('');

    // Check if accessor functions return correct values
    assert!(sword.magic == 42 && sword.strength == 7);

}