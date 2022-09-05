<%@ page import="dao.daoLivro, classes.Livro, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/estilo.css">
        <title>Editar Livro</title>
    </head>
    <body>
         <%
            String id = request.getParameter("id");
            Livro livros = daoLivro.getLivroById(Integer.parseInt(id));
        %>
        <form action="livroseditar.jsp" method="post">
            <h3>Editar Livro<br>Id: <%=livros.getId()%></h3>
            <input type="hidden" name="id" value="<%=livros.getId()%>">
            <input type="text" name="nome" value="<%=livros.getNome()%>" placeholder="Novo nome" required>	
            <input type="text" name="isbn" value="<%=livros.getIsbn()%>" placeholder="Novo ISBN" required>
            <input type="text" name="genero" value="<%=livros.getGenero()%>" placeholder="Novo gênero" required>
            <input type="text" name="paginas" value="<%=livros.getPaginas()%>" placeholder="Novas páginas" required>
        <?php?>      
            <input type="submit" value="Editar">
        </form>
    </body>
</html>
