use std::string::FromUtf8Error;

use lightning_invoice::ParseOrSemanticError;
use reqwest::header::InvalidHeaderValue;
use sqlx::sqlite::SqliteError;
use thiserror::Error;

#[derive(Error, Debug)]
pub enum MokshaWalletError {
    #[error("SerdeJsonError - {0}")]
    Json(#[from] serde_json::Error),

    #[error("ReqwestError - {0}")]
    Reqwest(#[from] reqwest::Error),

    #[error("InvalidHeaderValueError - {0}")]
    InvalidHeaderValue(#[from] InvalidHeaderValue),

    #[error("{0}")]
    MintError(String),

    #[error("{1}")]
    InvoiceNotPaidYet(u64, String),

    #[error("UnexpectedResponse - {0}")]
    UnexpectedResponse(String),

    #[error("MokshaCoreError - {0}")]
    MokshaCore(#[from] moksha_core::error::MokshaCoreError),

    #[error("DB Error {0}")]
    Db(#[from] sqlx::Error),

    #[error("Sqlite Error {0}")]
    Sqlite(#[from] SqliteError),

    #[error("Utf8 Error {0}")]
    Utf8(#[from] FromUtf8Error),

    #[error("Invalid Proofs")]
    InvalidProofs,

    #[error("Not enough tokens")]
    NotEnoughTokens,

    #[error("Failed to decode payment request {0} - Error {1}")]
    DecodeInvoice(String, ParseOrSemanticError),

    #[error("Invalid invoice {0}")]
    InvalidInvoice(String),

    #[error("URLParseError - {0}")]
    Url(#[from] url::ParseError),
}
