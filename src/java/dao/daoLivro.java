/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import classes.Livro;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author aluno
 */
public class daoLivro {
     public static Connection getConnection(){
    Connection con = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");       
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca1305","root","");
    }catch(Exception erro){
        System.out.println(erro);
    }
        return con;
    
    }
    
     
      public static Livro getLivroById(int id){
        Livro livro = null;      
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("select * from livros where id=?");
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            livro = new Livro();
            livro.setId(rs.getInt("id"));
            livro.setNome(rs.getString("nome"));
            livro.setIsbn(rs.getString("ISBN"));         
            livro.setGenero(rs.getString("Gênero"));   
            livro.setPaginas(rs.getString("Páginas")); 
        }
    }catch(Exception erro){
        System.out.println(erro);
    }      
        return livro;
    }
      
         public static int editarLivro(Livro livros){
       int status = 0;  
   try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE livros SET nome=?, isbn=?, genero=?, paginas=?  WHERE id=?");
        ps.setString(1, livros.getNome());
        ps.setString(2, livros.getIsbn());
        ps.setString(3, livros.getGenero()); 
         ps.setString(4, livros.getPaginas());
        ps.setInt(5, livros.getId());         
        status = ps.executeUpdate();
    }catch(Exception erro){
        System.out.println(erro);
    }      
       return status;
   }
          public static List<Livro> getLivros() {
    List<Livro> list = new ArrayList<Livro>();
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM livros");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Livro livro = new Livro();
            livro.setId(rs.getInt("id"));
            livro.setNome(rs.getString("nome"));
            livro.setIsbn(rs.getString("isbn"));         
            livro.setGenero(rs.getString("genero"));   
            livro.setPaginas(rs.getString("paginas")); 
            list.add(livro);
        }
    }catch(Exception erro){
        System.out.println(erro);
    }
    return list;
    }
    
    
    public static int excluirLivro(Livro livros){
       int status = 0;  
   try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM livros WHERE id=?");
        ps.setInt(1, livros.getId());         
        status = ps.executeUpdate();
    }catch(Exception erro){
        System.out.println(erro);
    }      
       return status;
   }
    
      
   public static int cadastrarLivro(Livro livro){
       int status = 0;  
   try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO LIVROS(NOME,ISBN,GENERO,PAGINAS) VALUES(?,?,?,?)");
        ps.setString(1, livro.getNome());
        ps.setString(2, livro.getIsbn());
        ps.setString(3, livro.getGenero());        
        ps.setString(4, livro.getPaginas());          
        status = ps.executeUpdate();
    }catch(Exception erro){
        System.out.println(erro);
    }      
       return status;
   }
       public static List<Livro> getRelatorio() {
    List<Livro> list = new ArrayList<Livro>();
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM livros");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            Livro livro = new Livro();
            livro.setId(rs.getInt("id"));
            livro.setNome(rs.getString("nome"));
            livro.setIsbn(rs.getString("isbn"));         
            livro.setGenero(rs.getString("genero"));   
            livro.setPaginas(rs.getString("paginas")); 
            list.add(livro);
        }       
    }catch(Exception erro){
        System.out.println(erro);
    }
    return list;
    }
    
    public static int getContagem() {
        int contagem = 0;
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS contagem FROM livros");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                contagem = rs.getInt("contagem");
            }   
        }catch(Exception erro){
            System.out.println(erro);
        }
        return contagem;
    }
    
    
        public static int[] getRelatorioLivros() {

        int[] valores = {0, 0};
        
        try{
            Connection con = getConnection();
            PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS Ficcao FROM livros where genero = 'Ficcao'");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                valores[0] = rs.getInt("Ficcao");
            }   
 
            ps = (PreparedStatement) con.prepareStatement("SELECT count(*) AS NaoFiccao FROM livros where genero = 'NaoFiccao'");
            rs = ps.executeQuery();
            while(rs.next()){
                valores[1] = rs.getInt("NaoFiccao");
            }            
            
        }catch(Exception erro){
            System.out.println(erro);
        }
        return valores;
    }
}

