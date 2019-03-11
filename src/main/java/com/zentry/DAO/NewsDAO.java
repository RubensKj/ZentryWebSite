package com.zentry.DAO;

import com.zentry.Models.NewsPost;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class NewsDAO {

    @PersistenceContext
    private EntityManager manager;

    public void persist(NewsPost post) {
        manager.persist(post);
    }

    public List<NewsPost> postList() {
        return manager.createQuery("select distinct(p) from NewsPost p", NewsPost.class).getResultList();
    }

    public NewsPost findPost(Integer id) {
        return manager.createQuery("select distinct(p) from NewsPost p where p.idPost = :idPost", NewsPost.class).setParameter("idPost", id).getSingleResult();
    }

    public void delete(Integer idPost) {
        manager.createQuery("delete from NewsPost where idPost = :id").setParameter("id", idPost).executeUpdate();
    }

    public void edit(Integer idPost, String image, NewsPost post) {
        manager.createQuery("update NewsPost set title = :title, description = :description, image = :image where idPost = :id")
                .setParameter("title", post.getTitle()).setParameter("description", post.getDescription()).setParameter("image", image)
                .setParameter("id", idPost).executeUpdate();
    }

    public void editWithoutImage(Integer idPost, NewsPost post) {
        manager.createQuery("update NewsPost set title = :title, description = :description, image = :image where idPost = :id")
                .setParameter("title", post.getTitle()).setParameter("description", post.getDescription()).setParameter("image", post.getImage())
                .setParameter("id", idPost).executeUpdate();
    }
}
