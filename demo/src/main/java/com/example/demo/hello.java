package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class hello {

    @GetMapping({"","/"})
    public String helloWorld(){

        return "index";
    }
}
