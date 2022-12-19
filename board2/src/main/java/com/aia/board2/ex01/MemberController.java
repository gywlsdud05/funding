package com.aia.board2.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
    @RequestMapping("/hi")
    public String index() {
        return "index.html";
    }


    //    private final MemberService memberService;
//
    @GetMapping("/member/save")
    public String saveForm() {
        return "/user/save";
    }
//
//    @PostMapping("/member/save")
//    public String save(@ModelAttribute UserDTO userDTO) {
//        System.out.println("MemberController.save");
//        System.out.println("userDTO = " + userDTO);
//        memberService.save(userDTO);
//        return "redirect:/";
//    }


//    private final MemberService memberService;
//
//    @GetMapping("/member/")
//    public String findAll(Model model) {
//        List<UserDTO> memberDTOList = memberService.findAll();
//        model.addAttribute("memberList", memberDTOList);
//        return "list";
//    }


}
