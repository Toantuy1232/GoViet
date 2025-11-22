package toan.dev;

import toan.dev.data.dao.DatabaseDao;
import toan.dev.data.dao.TourDao;
import toan.dev.data.model.Tours;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class SearchServlet extends BaseServlet {

    private static final int RECORDS_PER_PAGE = 9; // Số tour hiển thị mỗi trang

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        // Lấy tham số tìm kiếm
        String categoryIdParam = request.getParameter("categoryId");
        String searchTerm = request.getParameter("searchTerm");
        String pageParam = request.getParameter("page");

        // Xử lý phân trang
        int currentPage = 1;
        if (pageParam != null && !pageParam.isEmpty()) {
            try {
                currentPage = Integer.parseInt(pageParam);
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        TourDao tourDao = DatabaseDao.getInstance().getTourDao();
        List<Tours> toursList = new ArrayList<>();
        int totalRecords = 0;

        try {
            int categoryId = (categoryIdParam != null && !categoryIdParam.isEmpty())
                    ? Integer.parseInt(categoryIdParam)
                    : 0;

            int offset = (currentPage - 1) * RECORDS_PER_PAGE;

            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                // Tìm kiếm theo từ khóa
                if (categoryId > 0) {
                    // Tìm kiếm theo cả danh mục và từ khóa
                    toursList = tourDao.findByCategoryAndSearchTerm(categoryId, searchTerm);
                } else {
                    // Chỉ tìm kiếm theo từ khóa
                    toursList = tourDao.findBySearchTerm(searchTerm);
                }
            } else {
                // Không có từ khóa tìm kiếm
                if (categoryId > 0) {
                    // Lọc theo danh mục
                    toursList = tourDao.findByCategoryAndSearchTerm(categoryId, "");
                } else {
                    // Lấy tất cả tour
                    toursList = tourDao.findAll();
                }
            }

            // Tính tổng số bản ghi
            totalRecords = toursList.size();

            // Phân trang
            int start = offset;
            int end = Math.min(offset + RECORDS_PER_PAGE, totalRecords);
            if (start < totalRecords) {
                toursList = toursList.subList(start, end);
            } else {
                toursList = new ArrayList<>();
            }

        } catch (NumberFormatException e) {
            // Nếu có lỗi, lấy tất cả tour
            toursList = tourDao.findAll();
            totalRecords = toursList.size();

            // Phân trang
            int start = 0;
            int end = Math.min(RECORDS_PER_PAGE, totalRecords);
            if (totalRecords > 0) {
                toursList = toursList.subList(start, end);
            }
        }

        // Tính tổng số trang
        int totalPages = (int) Math.ceil((double) totalRecords / RECORDS_PER_PAGE);

        // Lấy danh sách danh mục để hiển thị trong dropdown
        request.setAttribute("categories", DatabaseDao.getInstance().getCategoryDao().findAll());
        request.setAttribute("toursList", toursList);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("searchTerm", searchTerm != null ? searchTerm : "");
        request.setAttribute("selectedCategoryId", categoryIdParam != null ? categoryIdParam : "0");

        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}