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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        super.doGet(request, response);

        String categoryIdParam = request.getParameter("categoryId");
        String searchTerm = request.getParameter("searchTerm");

        TourDao tourDao = DatabaseDao.getInstance().getTourDao();
        List<Tours> toursList = new ArrayList<>();

        try {
            int categoryId = (categoryIdParam != null && !categoryIdParam.isEmpty()) ?
                    Integer.parseInt(categoryIdParam) : 0;

            if (searchTerm != null && !searchTerm.trim().isEmpty()) {
                // Search by both category and search term
                if (categoryId > 0) {
                    toursList = tourDao.findByCategoryAndSearchTerm(categoryId, searchTerm);
                } else {
                    toursList = tourDao.findBySearchTerm(searchTerm);
                }
            } else {
                // Search by category only
                if (categoryId == 0) {
                    toursList = tourDao.findAll();
                } else {
                    toursList = tourDao.findBySearchTerm(categoryIdParam);
                }
            }
        } catch (NumberFormatException e) {
            toursList = tourDao.findAll();
        }

        request.setAttribute("toursList", toursList);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}