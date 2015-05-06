package etc;

import java.sql.Date;

public class DateTest {

	public static void main(String[] args) {
		Date today = Date.valueOf("2015-10-13");
		// year month day
		System.out.println(today);
	}
	
}
