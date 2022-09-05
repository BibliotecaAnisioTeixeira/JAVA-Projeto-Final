<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.daoAutor, classes.Autor, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/tabela.css">
        <link href="css/padrao.css" rel="stylesheet" type="text/css"/>
        <title>Autor</title>
    </head>
    <body>
            <div class="topnav">
                <%@include file="menu.jsp"%>
            </div>
            <div class="content">        
            <%
                List<Autor> list = daoAutor.getAutor();
                request.setAttribute("list", list);
            %>
        
            <h1>Autor</h1>
            <table>
            <tr><th>Id</th><th>Nome</th><th colspan="2">Ações</td></tr>
                <c:forEach items="${list}" var="autor">
                <tr>
                    <td>${autor.getId()}</td>
                    <td>${autor.getNome()}</td>
                    <td><a href="autoreditarform.jsp?id=${autor.getId()}"><img src="./imagens/editar.png" alt="Editar Genero"></a></td>
                    <td><a href="autorexcluir.jsp?id=${autor.getId()}"><img src="./imagens/excluir.png" alt="Excluir Genero"></a></td>            
                </tr>
                </c:forEach>
            </table>
        <a href="autorcadastrarform.html"><img src="./imagens/incluir.png" alt="Incluir Autor"></a>
    </div>
    <div class="footer">
    </div>
    </body>
</html>