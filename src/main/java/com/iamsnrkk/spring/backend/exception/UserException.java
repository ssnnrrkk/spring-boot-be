package com.iamsnrkk.spring.backend.exception;

public class UserException extends BaseException {

    public UserException(String code) {
        super("user." + code);
    }

    // user.request.null
    public static UserException requestNull() {
        return new UserException("request.null");
    }

    // user.register.email.null
    public static UserException emailNull() {
        return new UserException("register.email.null");
    }
}
