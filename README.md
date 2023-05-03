[![Rust](https://github.com/ngutech21/cashu-rs/actions/workflows/rust.yml/badge.svg?branch=master)](https://github.com/ngutech21/cashu-rs/actions/workflows/rust.yml)
![coverage](https://img.shields.io/codecov/c/github/ngutech21/cashu-rs)



⚠️ **Don't be reckless:** This project is in early development, it does however work with real sats! Always use amounts you don't mind loosing. 

# cashu-rs
cashu-rs is a Chaumian Ecash library written in Rust.

Cashu is an Ecash implementation based on David Wagner's variant of Chaumian blinding. Token logic based
on [minicash](https://github.com/phyro/minicash) ([description](https://gist.github.com/phyro/935badc682057f418842c72961cf096c))
which implements a [Blind Diffie-Hellman Key Exchange](https://cypherpunks.venona.com/date/1996/03/msg01848.html) scheme
written down by Ruben Somsen [here](https://gist.github.com/RubenSomsen/be7a4760dd4596d06963d67baf140406). 
Please read the [Cashu](https://github.com/callebtc/cashu) documentation for more detailed information.

This project aims to replicate the python mint implementation of cashu.

## Progress
Wallet Features:

At the moment the wallet doesn't use a database, but prints the tokens to stdout. 

- [x] connect to mint (load keys)
- [x] request minting tokens
- [x] minting tokens
- [x] sending tokens (get encoded token for chosen value)
- [x] receiving tokens
- [x] melting tokens
- [] check if tokens are spent


Implemented [NUTs](https://github.com/cashubtc/nuts/):

- [x] [NUT-00](https://github.com/cashubtc/nuts/blob/main/00.md)
- [x] [NUT-01](https://github.com/cashubtc/nuts/blob/main/01.md)
- [x] [NUT-02](https://github.com/cashubtc/nuts/blob/main/02.md)
- [x] [NUT-03](https://github.com/cashubtc/nuts/blob/main/03.md)
- [x] [NUT-04](https://github.com/cashubtc/nuts/blob/main/04.md)
- [x] [NUT-05](https://github.com/cashubtc/nuts/blob/main/05.md)
- [x] [NUT-06](https://github.com/cashubtc/nuts/blob/main/06.md)
- [] [NUT-07](https://github.com/cashubtc/nuts/blob/main/07.md)
- [] [NUT-08](https://github.com/cashubtc/nuts/blob/main/08.md)
- [] [NUT-09](https://github.com/cashubtc/nuts/blob/main/09.md)

## Usage
### Setup
```
git clone https://github.com/ngutech21/cashu-rs.git
cargo install just
cargo install typos
cd cashu-rs
```


### Config
```bash
mv .env.example .env
# edit .env file
vim .env
```

### Run mint (server)
```
cargo run --bin cashurs-mint
```


### Run cli-wallet
```
cargo run --bin cashurs-wallet mint 42
```




