<%@ page import="dao.daoAutor"%>
<jsp:useBean id="u" class="classes.Autor"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoAutor.excluirAutor(u);
    response.sendRedirect("autorcontrolar.jsp");
%>