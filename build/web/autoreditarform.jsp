<%@ page import="dao.daoAutor, classes.Autor, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/estilo.css">
        <title>Editar Autor</title>
    </head>
    <body>
         <%
            String id = request.getParameter("id");
            Autor autor = daoAutor.getAutorById(Integer.parseInt(id));
        %>
        <form action="autoreditar.jsp" method="post">
            <h3>Editar Autor<br>Id: <%=autor.getId()%></h3>
            <input type="hidden" name="id" value="<%=autor.getId()%>">
            <input type="text" name="nome" value="<%=autor.getNome()%>" placeholder="Novo nome" required>    
            <input type="submit" value="Editar">
        </form>
    </body>
</html>
