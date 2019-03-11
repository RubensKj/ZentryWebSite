package com.zentry.Controllers;

import com.zentry.DAO.NewsDAO;
import com.zentry.Models.NewsPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private NewsDAO newsDAO;

    @RequestMapping("/")
    @Cacheable(value = "PostNewsZentry")
    public ModelAndView Home() {
        List<NewsPost> posts = newsDAO.postList();
        Collections.reverse(posts);
        ModelAndView modelAndView = new ModelAndView("Home");
        modelAndView.addObject("listPost", posts);

        return modelAndView;
    }

}
