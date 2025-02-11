module my_coin::usd ; 

use sui::url::Url;
use std::option::none;
// use sui::tx_context::sender;
use sui::coin::{create_currency};
use sui::transfer::{transfer,public_freeze_object,public_transfer};


public struct USD has drop {}

fun init(usd: USD, ctx: &mut TxContext) {

    let no = none<Url>();
    let (treasuryCap, coin_metadata) = 
      create_currency(usd,8, b"USD",b"USD",b"this is real USD ,trust me ",no, ctx);
    public_freeze_object(coin_metadata);
    public_transfer(treasuryCap, ctx.sender());
}



