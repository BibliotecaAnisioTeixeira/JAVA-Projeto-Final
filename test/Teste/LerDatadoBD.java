package Teste;

import static dao.Dao.getConnection;
import java.sql.*;
public class LerDatadoBD {
    public static void main(String[] args) {
     
    try{
        Connection con = getConnection();
        PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM usuarios");
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            System.out.println(rs.getInt("id"));
            System.out.println(rs.getDate("Data").toString());
        }       
    }catch(Exception erro){
        System.out.println(erro);
    }

    }
    
}
