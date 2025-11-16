package main.controller;

public class homeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/index.jsp");
        dispatcher.forward(request, response);

        return;
    }
    }
//}