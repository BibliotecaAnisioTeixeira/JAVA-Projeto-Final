
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import="dao.Dao, dao.UsuariosDao, classes.Usuario, java.util.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import = "java.util.Properties, javax.mail.*, 
javax.mail.internet.*, javax.activation.*, 
java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ page import = "javax.mail.Authenticator.*" %>
<%@ page import = "javax.mail.PasswordAuthentication.*" %>
<%@ page import = "javax.mail.Authenticator .*" %>
<%@ page import = "classes.SmtpAuthenticator.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.Connection.*"%>
<%@ page import="java.sql.PreparedStatement.*"%>
<%@ page import="java.sql.ResultSet.*"%>
<%@ page import="java.util.ArrayList.*"%>
<%@ page import="java.util.List.*"%>

<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/biblioteca1305"
         user = "root" password = ""/>
         <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from usuarios;
      </sql:query>
       <table border = "1" width = "100%">
         <tr>
            <th>ID</th>
            <th>Email</th>
            <th>Status</th>
         </tr>
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td> <c:out value = "${row.idCliente}"/></td>
               <td> <c:out value = "${row.email}"/></td>
               <td> Email enviado</td>
            </tr>
         </c:forEach>
      </table>
         
    
<%
    
    Usuario usuario = null;   
         try{
        Connection con = con=DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca1305","root","");
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from usuarios");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
    
     final String fromEmail = "projetolivraria1305@gmail.com"; //requires valid gmail id
		  final String password = "enbtipdftamteivq"; // correct password for gmail id
    
 Authenticator auth = new Authenticator() {
				//override the getPasswordAuthentication method
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
		  };
    
Properties props = new Properties();
		  props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		  props.put("mail.smtp.port", "587"); //TLS Port
	      props.put("mail.smtp.auth", "true"); //enable authentication
		  props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS
			
		  Session sessao = Session.getInstance(props, auth); 
		  MimeMessage msg = new MimeMessage(sessao);
		  
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");

	      msg.setFrom(new InternetAddress("projetolivraria1305@gmail.com", "Biblioteca Anisio Teixeira"));

	      msg.setReplyTo(InternetAddress.parse("projetolivraria1305@gmail.com", false));

	      msg.setSubject(request.getParameter("assunto"), "UTF-8");

	      msg.setText(request.getParameter("comenta"), "UTF-8");


	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse((rs.getString("email")), false));
    	  Transport.send(msg);  
 
System.out.println("Email enviado!!!");
	    }
		
         }catch (Exception e) {
	      e.printStackTrace();
	    }

%>