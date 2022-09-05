<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.daoLivro, classes.Livro, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/tabela.css">
        <link href="css/padrao.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Livros</title>
    </head>
    <body>
            <div class="topnav">
                <%@include file="menu.jsp"%>
            </div>
            <div class="content">        
            <%
                List<Livro> list = daoLivro.getLivros();
                request.setAttribute("list", list);
            %>
        
            <h1>Lista de Livros</h1>
            <table>
            <tr><th>Id</th><th>Nome</th><th>ISBN</th><th>Gênero</th><th>Páginas</th><th colspan="2">Ações</td></tr>
                <c:forEach items="${list}" var="livro">
                <tr>
                    <td>${livro.getId()}</td>
                    <td>${livro.getNome()}</td>
                    <td>${livro.getIsbn()}</td>            
                    <td>${livro.getGenero()}</td>    
                    <td>${livro.getPaginas()}</td> 
                    <td><a href="livroseditarform.jsp?id=${livro.getId()}"><img src="./imagens/editar.png" alt="Editar Livro"></a></td>
                    <td><a href="livrosexcluir.jsp?id=${livro.getId()}"><img src="./imagens/excluir.png" alt="Excluir Livro"></a></td>            
                </tr>
                </c:forEach>
            </table>
        <a href="livroscadastrarform.html"><img src="./imagens/incluir.png" alt="Incluir Livro"></a>
    </div>
    <div class="footer">
    </div>
    </body>
</html>