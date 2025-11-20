package toan.dev.admin.Tours;

import toan.dev.admin.BaseAdminServlet;
import toan.dev.data.dao.DatabaseDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteTourServlet extends BaseAdminServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tourId = Integer.parseInt(request.getParameter("tourId"));
        // Xóa tour theo ID rồi quay lại danh sách tour
        DatabaseDao.getInstance().getTourDao().delete(tourId);

        response.sendRedirect("IndexTourServlet");
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
