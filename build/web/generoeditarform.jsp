<%@ page import="dao.daoGenero, classes.Genero, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/estilo.css">
        <title>Editar Genero</title>
    </head>
    <body>
         <%
            String id = request.getParameter("id");
            Genero generos = daoGenero.getGeneroById(Integer.parseInt(id));
        %>
        <form action="generoeditar.jsp" method="post">
            <h3>Editar Genero<br>Id: <%=generos.getId()%></h3>
            <input type="hidden" name="id" value="<%=generos.getId()%>">
            <input type="text" name="nome" value="<%=generos.getNome()%>" placeholder="Novo nome" required>    
            <input type="submit" value="Editar">
        </form>
    </body>
</html>
