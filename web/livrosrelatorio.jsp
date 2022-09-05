<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dao.Dao, dao.daoLivro, classes.Livro, java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./css/tabela.css">
        <link href="css/grafico.css" rel="stylesheet" type="text/css"/>
        <link href="css/padrao.css" rel="stylesheet" type="text/css"/>
        <script src="./scripts/filtrar.js"></script>
        <title>Relat�rio de Livros</title>
    </head>
    <body>
        
            <%@include file="acessoadm.jsp"%>
        
            <div class="topnav">
                <%@include file="menu.jsp"%>
            </div>
            <div class="content">        
            <%
                
                List<Livro> list = daoLivro.getRelatorio();
                request.setAttribute("list", list);
               
                int[] valores = daoLivro.getRelatorioLivros();
                request.setAttribute("valores", valores);
                

            %>
        
            <h1>Relat�rio de Livros</h1>
            
            		<input type="text" id="filtrarnomes" onkeyup="filtrar('filtrarnomes', 1)" placeholder="Busca de nomes">
			<input type="text" id="filtrarisbn" onkeyup="filtrar('filtrarisbn', 2)" placeholder="Busca de isbn">

            <table id="myTable">
            <tr><th>Id</th><th>Nome</th><th>Isbn</th><th>G�nero</th><th>Paginas</th></tr>
                <c:forEach items="${list}" var="livro">
                <tr>
                    <td>${livro.getId()}</td>
                    <td>${livro.getNome()}</td>
                    <td>${livro.getIsbn()}</td>               
                    <td>${livro.getGenero()}</td> 
                    <td>${livro.getPaginas()}</td> 
                </tr>
                </c:forEach>
            </table>
 
            <div class="grafico">
                <canvas id="myChart"></canvas>
                <p>Distribui��o de Livros:</p>
                <p>Fic��o: <%=valores[0]%></p>
                <p>N�o Fic��o: <%=valores[1]%></p>
            </div>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js
            "></script>

    <script type="text/javascript">
        var ctx = document.getElementById("myChart");
        var valores = [<%=valores[0]%>, <%=valores[1]%>];
        var tipos = ["Ficcao", "Nao Ficcao"];

        var myChart = new Chart(ctx, {
          type: "pie",
          data: {
            labels: tipos,
            datasets: [
              {
                label: "Livros",
                data: valores,
                backgroundColor: [
                  "rgba(255, 99, 132, 0.2)",
                  "rgba(54, 162, 235, 0.2)",
                  "rgba(255, 206, 86, 0.2)",
                  "rgba(75, 192, 192, 0.2)",
                  "rgba(153, 102, 255, 0.2)",
                ]
              }
            ]
          }
        }); 
    </script>           
    </div>

    <div class="footer">
        <%@include file="rodape.jsp"%>
    </div>
    </body>
</html>

