package toan.dev;

import toan.dev.data.dao.*;
import toan.dev.data.model.Banner;
import toan.dev.data.model.Blogposts;
import toan.dev.data.model.Category;
import toan.dev.data.model.Products;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public abstract class BaseServlet extends HttpServlet implements DataProvider {
    protected DatabaseDao databaseDao;
    protected CategoryDao categoryDao;
    protected ProductsDao productsDao;
    protected BannerDao bannerDao;
    protected BlogpostsDao blogpostsDao;

    @Override
    public void init() throws ServletException {
        super.init();
        databaseDao = DatabaseDao.getInstance();
        categoryDao = databaseDao.getCategoryDao();
        productsDao = databaseDao.getProductDao();
        bannerDao = databaseDao.getBannerDao();
        blogpostsDao = databaseDao.getBlogDao();
    }
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        super.service(request, response);
    }
    @Override
    public List<Banner> getBanners() {
        try {
            return bannerDao.findAll();
        }catch(Exception e) {
            return null;
        }
    }

    @Override
    public List<Category> getCategories() {
        try {
            return categoryDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Products> getProducts() {
        try {
            return productsDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Products> getHotProducts() {
        try {
            return productsDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public List<Products> getNewProducts() {
        try {
            return productsDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }
    @Override
    public List<Category> getHotCategories() {
        try {
            return categoryDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }
    @Override
    public List<Blogposts> getBlog() {
        try {
            return blogpostsDao.findAll();
        } catch (Exception e) {
            return null;
        }
    }
    protected void setDataAttributes(HttpServletRequest request) {
        request.setAttribute("categoryList", getCategories());
        request.setAttribute("categories", getCategories());  
        request.setAttribute("productList", getProducts());
        request.setAttribute("hotProductsList", getHotProducts());
        request.setAttribute("newProductsList", getNewProducts());
        request.setAttribute("hotcategoryList", getHotCategories());
        request.setAttribute("bannerList", getBanners());
        request.setAttribute("blogpostsList", getBlog());
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, HttpServletResponse response)
            throws javax.servlet.ServletException, IOException {
    }

    protected abstract void doPost(javax.servlet.http.HttpServletRequest request, HttpServletResponse response)
            throws javax.servlet.ServletException, IOException;
}
