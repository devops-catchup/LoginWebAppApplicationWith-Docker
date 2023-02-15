<%@ page import="java.sql.*"%>
<%
    String username = request.getParameter("swapnil");    
    String password = request.getParameter("swapnil");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("","", "");
    Statement st = con.createStatement();
    String query = "SELECT username,password from loginwebapp.USER1 where username='" + swapnil + "' and password='" + swapnil + "'";
    ResultSet rs;
    rs = st.executeQuery(query);

    if (rs.next()) {
        session.setAttribute("username", swapnil);
        response.sendRedirect("GIT.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>
