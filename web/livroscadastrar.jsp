<%@ page import="dao.daoLivro"%>
<jsp:useBean id="u" class="classes.Livro"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoLivro.cadastrarLivro(u);
    
    if(i>0){
        response.sendRedirect("livroscontrolar.jsp");
    }else{
        response.sendRedirect("livroscadastrar-erro.jsp");        
    }
%>