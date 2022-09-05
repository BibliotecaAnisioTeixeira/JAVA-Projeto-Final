<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.daoGenero, classes.Genero, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/tabela.css">
        <link href="css/padrao.css" rel="stylesheet" type="text/css"/>
        <title>Gêneros</title>
    </head>
    <body>
            <div class="topnav">
                <%@include file="menu.jsp"%>
            </div>
            <div class="content">        
            <%
                List<Genero> list = daoGenero.getGeneros();
                request.setAttribute("list", list);
            %>
        
            <h1>Gêneros</h1>
            <table>
            <tr><th>Id</th><th>Nome</th><th colspan="2">Ações</td></tr>
                <c:forEach items="${list}" var="genero">
                <tr>
                    <td>${genero.getId()}</td>
                    <td>${genero.getNome()}</td>
                    <td><a href="generoeditarform.jsp?id=${genero.getId()}"><img src="./imagens/editar.png" alt="Editar Genero"></a></td>
                    <td><a href="generoexcluir.jsp?id=${genero.getId()}"><img src="./imagens/excluir.png" alt="Excluir Genero"></a></td>            
                </tr>
                </c:forEach>
            </table>
        <a href="generocadastrarform.html"><img src="./imagens/incluir.png" alt="Incluir Genero"></a>
    </div>
    <div class="footer">
    </div>
    </body>
</html>