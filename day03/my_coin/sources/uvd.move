module my_coin::uvd ; 

use sui::url::Url;
use std::option::none;
// use sui::tx_context::sender;
use sui::coin::{create_currency};
use sui::transfer::{transfer,public_freeze_object,public_transfer};


public struct UVD has drop {}

fun init(uvd: UVD, ctx: &mut TxContext) {

    let no = none<Url>();
    let (treasuryCap, coin_metadata) = 
      create_currency(uvd,8, b"UVD",b"UVD",b"this is real UVD ,trust me ",no, ctx);
    public_freeze_object(coin_metadata);
    public_transfer(treasuryCap, ctx.sender());
}



