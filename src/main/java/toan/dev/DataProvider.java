package toan.dev;

import toan.dev.data.model.Banner;
import toan.dev.data.model.Category;
import toan.dev.data.model.Products;

import java.util.List;

public interface DataProvider {
    /**
     * Lấy danh sách categories
     * @return List<Category>
     */
    List<Category> getCategories();

    /**
     * Lấy danh sách banners
     * @return List<Banner>
     */
    List<Banner> getBanners();
    /**
     * Lấy danh sách products
     * @return List<Products>
     */
    List<Products> getProducts();

    /**
     * Lấy danh sách hot products (sản phẩm nổi bật)
     * @return List<Products>
     */
    List<Products> getHotProducts();

    /**
     * Lấy danh sách new products (sản phẩm mới)
     * @return List<Products>
     */
    List<Products> getNewProducts();

    /**
     * Lấy danh sách hot categories (danh mục nổi bật)
     * @return List<Category>
     */
    List<Category> getHotCategories();
}
