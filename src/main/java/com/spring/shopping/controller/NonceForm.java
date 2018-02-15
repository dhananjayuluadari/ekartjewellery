package com.spring.shopping.controller;

/**
 * NonceForm is a model object representing the payment form submission.
 */
public class NonceForm {
    private String nonce;

    public String getNonce() {
        return nonce;
    }

    public void setNonce(String nonce) {
        this.nonce = nonce;
    }
}
