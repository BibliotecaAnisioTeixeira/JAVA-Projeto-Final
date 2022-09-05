<%@ page import="dao.daoGenero"%>
<jsp:useBean id="u" class="classes.Genero"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
    
<%
    int i = daoGenero.cadastrarGenero(u);
    
    if(i>0){
        response.sendRedirect("generocontrolar.jsp");
    }else{
        response.sendRedirect("generocadastrar-erro.jsp");        
    }
%>