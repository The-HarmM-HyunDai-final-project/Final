package com.theharmm.persistence;

import lombok.extern.log4j.Log4j;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.Test;


@Log4j
public class JDBCTests {	
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//end static
	
	@Test
	public void TestConnection() {	
		try {
			Connection con = 
					DriverManager.getConnection(
							"jdbc:log4jdbc:oracle:thin:@Final_high?TNS_ADMIN=C:\\\\Dev\\\\wallet_final\\\\Wallet_Final"
							,"Theharmm","Chlwhdvmfhwprxm12345");
			log.info(con);
		} catch (SQLException e) {
			fail(e.getMessage());			
		}//end try			
	}//end test
}//end class