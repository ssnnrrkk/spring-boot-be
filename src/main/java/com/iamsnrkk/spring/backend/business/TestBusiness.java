package com.iamsnrkk.spring.backend.business;

import com.iamsnrkk.spring.backend.exception.BaseException;
import com.iamsnrkk.spring.backend.exception.UserException;
import com.iamsnrkk.spring.backend.model.RegisterRequest;
import org.springframework.stereotype.Service;

import java.util.Objects;

@Service
public class TestBusiness {

    public String register(RegisterRequest request) throws BaseException {

        if (request == null) {
            throw UserException.requestNull();
        }

        if (Objects.isNull(request.getEmail())) {
            throw UserException.emailNull();
        }

        return "Received " + request;
    }
}
