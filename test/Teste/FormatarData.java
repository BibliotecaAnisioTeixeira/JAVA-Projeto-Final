package Teste;

import dao.Dao;
import java.util.Calendar;
import java.text.DateFormat;

public class FormatarData{

	public static void main(String[] args) {
            
            
                //Calendar é uma classe abstrata. Não pode ser instanciada.
		Calendar c = Calendar.getInstance();
                
		c.set(2013, Calendar.FEBRUARY, 28);
		System.out.println("Data atual sem formatação: "+c.getTime());

		//Formata a data
		DateFormat formataData = DateFormat.getDateInstance();
		System.out.println("Data atual com formatação: "+ formataData.format(c.getTime()));

		//Formata Hora
                DateFormat hora = DateFormat.getTimeInstance();
		System.out.println("Hora formatada: "+hora.format(c.getTime()));

		//Formata Data e Hora
		DateFormat dtHora = DateFormat.getDateTimeInstance();
		System.out.println(dtHora.format(c.getTime()));
                
	}

}
