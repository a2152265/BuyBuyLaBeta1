package manage;



import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class HikariUtil {
	private HikariDataSource ds;
	

	public HikariDataSource openDataSource() {
		HikariConfig config = new HikariConfig();
		config.setJdbcUrl("jdbc:sqlserver://localhost:1433;databaseName=BuyBuy");
		config.setUsername("sa");
		config.setPassword("password");
		config.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		config.setMaximumPoolSize(10);
		
		ds = new HikariDataSource(config);
		
		return ds;
		
		
	}
	
	public void closeDataSource() {
		if(ds!=null) {
			ds.close();
		}
	}
}
