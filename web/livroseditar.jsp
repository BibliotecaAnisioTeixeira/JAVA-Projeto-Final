<%@ page import="dao.daoLivro"%>
<jsp:useBean id="u" class="classes.Livro"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoLivro.editarLivro(u);
    response.sendRedirect("livroscontrolar.jsp");
%>
