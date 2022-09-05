<%@ page import="dao.daoGenero"%>
<jsp:useBean id="u" class="classes.Genero"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoGenero.excluirGenero(u);
    response.sendRedirect("generocontrolar.jsp");
%>