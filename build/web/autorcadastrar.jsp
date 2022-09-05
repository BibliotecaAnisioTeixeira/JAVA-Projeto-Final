<%@ page import="dao.daoAutor"%>
<jsp:useBean id="u" class="classes.Autor"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoAutor.cadastrarAutor(u);
    
    if(i>0){
        response.sendRedirect("autorcontrolar.jsp");
    }else{
        response.sendRedirect("generocadastrar-erro.jsp");        
    }
%>