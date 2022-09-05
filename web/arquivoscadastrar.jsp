<%@page import="dao.daoArquivo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="u" class="classes.Arquivo"></jsp:useBean>
<jsp:setProperty property="*" name="u" />
<%@include file="acessoadm.jsp"%>

<%
    int i = daoArquivo.cadastrarArquivo(u);
       if(i>0){
           response.sendRedirect("principal.jsp");
       }
%>