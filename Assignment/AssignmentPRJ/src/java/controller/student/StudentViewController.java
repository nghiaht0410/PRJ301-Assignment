package controller.student;

import dal.AssessmentDBContext;
import dal.CourseDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Exam;

@WebServlet(name = "StudentViewController", urlPatterns = {"/student/view"})
public class StudentViewController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int sid = Integer.parseInt(request.getParameter("sid"));

        request.setAttribute("courses", new CourseDBContext().filterByStudentID(sid));
        request.getRequestDispatcher("../view/student/view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        AssessmentDBContext db = new AssessmentDBContext();
        ArrayList<Exam> exams = db.getRelatedExamsGrade(cid, sid);
        request.setAttribute("exams", exams);
        request.getRequestDispatcher("../view/student/view.jsp").forward(request, response);

    }

}
