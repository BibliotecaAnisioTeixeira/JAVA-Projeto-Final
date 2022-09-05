<%@ page import="dao.daoGenero"%>
<jsp:useBean id="u" class="classes.Genero"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoGenero.editarGenero(u);
    response.sendRedirect("generocontrolar.jsp");
%>
