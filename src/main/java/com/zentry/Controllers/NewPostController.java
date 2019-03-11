package com.zentry.Controllers;

import com.zentry.DAO.NewsDAO;
import com.zentry.Models.NewsPost;
import com.zentry.tools.FileSaver;
import com.zentry.tools.Uploader;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.io.*;
import java.util.Date;

@Controller
@RequestMapping("/")
public class NewPostController {

    @Autowired
    private NewsDAO newsDAO;

    @Autowired
    private Uploader uploader;

    @Autowired
    private FileSaver fileSaver;

    @RequestMapping("/newpost")
    public ModelAndView newpost() {
        return new ModelAndView("NewPost");
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    @CacheEvict(value="PostNewsZentry", allEntries=true)
    public ModelAndView post(MultipartFile file, @Valid NewsPost post, RedirectAttributes redirectAttributes) throws IOException {
        Date date = new Date();
        post.setPostDate(date);

//        File absolutePath1 = new File(file.getOriginalFilename());
//        URL url = new URL("ftp://user:password@somewhere.com/" + file.getOriginalFilename());

        File FileConverted = fileSaver.convert(file);

        String image = uploader.upload(FileConverted);

        JSONObject json = new JSONObject(image);
        String link = json.getJSONObject("data").getString("link");

        System.out.println(link);

        post.setImage(link);

        newsDAO.persist(post);

        redirectAttributes.addFlashAttribute("postSuccessful", "Post has been created");

        return new ModelAndView("redirect:/");
    }

    @RequestMapping("/post/{idPost}")
    public ModelAndView details(@PathVariable("idPost") Integer idPost) {
        ModelAndView modelAndView = new ModelAndView("PostsDetails/details");
        NewsPost post = newsDAO.findPost(idPost);

        modelAndView.addObject("post", post);
        return modelAndView;
    }

    @RequestMapping(value = "/post/delete/{idPost}", method = RequestMethod.POST)
    @CacheEvict(value="PostNewsZentry", allEntries=true)
    public ModelAndView delete(@PathVariable Integer idPost, RedirectAttributes redirectAttributes) {

        newsDAO.delete(idPost);

        redirectAttributes.addFlashAttribute("postDeleted", "Post has been deleted");

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/post/edit/{idPost}")
    public ModelAndView editPage(@PathVariable Integer idPost) {
        ModelAndView modelAndView = new ModelAndView("Edit");
        NewsPost post = newsDAO.findPost(idPost);

        modelAndView.addObject("post", post);
        return modelAndView;
    }

    @RequestMapping(value = "/post/edited/{idPost}", method = RequestMethod.POST)
    @CacheEvict(value="PostNewsZentry", allEntries=true)
    public ModelAndView edit(@PathVariable Integer idPost, MultipartFile file, NewsPost post, RedirectAttributes redirectAttributes) {

        System.out.println(post.getTitle());
        System.out.println(post.getDescription());
        System.out.println(post.getImage());
        System.out.println(post.getIdPost());

        try {
            File fileConverted = fileSaver.convert(file);

            String image = uploader.upload(fileConverted);

            System.out.println(image);
            newsDAO.edit(idPost, image, post);
        } catch (IOException e) {
            newsDAO.editWithoutImage(idPost, post);
        }

        redirectAttributes.addFlashAttribute("postEdited", "Post has been edited");

        return new ModelAndView("redirect:/");
    }
}
