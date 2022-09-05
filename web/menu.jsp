<head>
<meta charset="utf-8">
<style>
a {
  color: #000;
  text-transform: uppercase;
  text-decoration: none;
  transition: 0.3s;
}

nav a::after {
  content: "";
  width: 0;
  height: 3px;
  background-color: #f04e23;
  margin: auto;
  display: block;
}

a:hover {
  color: #f04e23;
}

a:hover::after {
  width: 100%;
  transition: width 0.3s linear;
}

.logo {
  font-size: 34px;
  letter-spacing: 3px;
}

nav {
  z-index: 4;
  position: fixed;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #fffafa;
  height: 8vh;
  width: 100vw;
}

.nav-list {
  font-size: 20px;
  list-style: none;
  display: flex;
}

.navbar-login {
  font-size: 20px;
}

.nav-list li {
  margin-left: 20px;
}

li a, .dropbtn {
  display: inline-block;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}


li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}

/* Style the content */
.content {
  background-color: #ddd;
  padding: 10px;
  
}

/* Style the footer */
.footer {
  background-color: #f1f1f1;
  padding: 10px;
}

 </style>
</head>
<body>
<ul class="nav-list">
  <li><a href="principal.jsp">Principal</a></li>
   <li><a href="generocontrolar.jsp">Gêneros</a></li>
  <li><a href="autorcontrolar.jsp">Autor</a></li>
  <li><a href="arquivoscadastrarform.jsp">Arquivos</a></li>
  <li><a href="escreveremail.jsp">Email</a></li>
  
    <%
      String adm = (String) request.getSession().getAttribute("acesso");
 
       if (adm.equals("admin")) {
          %>
            
<li class='dropdown'><a href='javascript:void(0)' class='dropbtn'>Usuários</a>
<div class='dropdown-content'><a href='usuariosrelatorio.jsp'>Relatório de Usuários</a><a href='usuarioscontrolar.jsp?pag=1'>Controlar Usuários</a><a href='usuariocadastrarform.jsp'>Cadastrar Usuário</a></div></li>
<li class='dropdown'><a href='javascript:void(0)' class='dropbtn'>Livros</a>
<div class='dropdown-content'><a href='livrosrelatorio.jsp'>Relatório de Livros</a><a href="livroscontrolar.jsp">Controlar Livros</a><a href="criarrelatorio.jsp">Gerar relatório</a></div>
            <%
          
        }
   %>  
  

 <li class="dropdown" style="float:right">
     <a href="javascript:void(0)" class="dropbtn">Usuário: <%=request.getSession().getAttribute("usuario")%></a>
    <div class="dropdown-content">
      <a href="#">Alterar Dados</a>
      <a href="#">Alterar Senha</a>
      <a href="deslogar.jsp">Deslogar</a>
    </div>
  </li>

</ul>

</body>