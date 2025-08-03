package com.example.products2;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableFeignClients
public class Products2Application {

    public static void main(String[] args) {
        SpringApplication.run(Products2Application.class, args);
    }

}
