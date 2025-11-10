package toan.dev.data.model;

import java.sql.Timestamp;

public class Blogposts {
    public int post_id;
    public int author_id;
    public String title;
    public String content;
    public String cover_image;
    public Timestamp created_at;

    public Blogposts(int post_id, int author_id, String title, String content, String cover_image, Timestamp created_at) {
        super();
        this.post_id = post_id;
        this.author_id = author_id;
        this.title = title;
        this.content = content;
        this.cover_image = cover_image;
        this.created_at = created_at;
    }

    public Blogposts(int id, int postId, int authorId, String title, String content, String coverImage, Timestamp createdAt) {
        super();
        this.author_id = id;
        this.post_id = postId;
        this.author_id = authorId;
        this.title = title;
        this.content = content;
        this.cover_image = coverImage;
        this.created_at = createdAt;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getAuthor_id() {
        return author_id;
    }

    public void setAuthor_id(int author_id) {
        this.author_id = author_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
