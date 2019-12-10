package com.buba.hospital_back;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@MapperScan("com.buba.hospital_back.mapper")
@EnableScheduling
public class HospitalBackApplication {

    public static void main(String[] args) {
        SpringApplication.run(HospitalBackApplication.class, args);
    }

}
