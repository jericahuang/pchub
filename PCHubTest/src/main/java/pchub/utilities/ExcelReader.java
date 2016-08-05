package pchub.utilities;

import java.io.FileInputStream;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelReader {
	private static XSSFWorkbook ExcelBook;
	private static XSSFSheet ExcelSheet;
	private static XSSFCell Cell;

	public static Object[][] connect(String path, String sheetName ) throws Exception {	
		
		FileInputStream inputStream = new FileInputStream(path);

		ExcelBook = new XSSFWorkbook(inputStream);
	
		ExcelSheet = ExcelBook.getSheet(sheetName);
		
		//number of times the test will be invoked
		int totalRows = ExcelSheet.getLastRowNum() ;//0-based(0, 1, 2...)
				
		//assumes that each row has same number of columns.
		int totalCols = ExcelSheet.getRow(0).getLastCellNum();//1-based(1, 2, 3...)
				
			
		Object[][] cellValue = new String [totalRows][totalCols];
		return cellValue;
	}
	
	//reads the data in each cell
	public static Object[][] read(Object[][] array){
		
		int startRow = 1;
		
		int startCol = 0;
		
		int ci = 0;
		for (int i = startRow; i <= array.length ; i++) {
			int cj = 0;
			for (int j = startCol; j < array[0].length; j++) {
				
				array[ci][cj] = getData(i, j);
				cj++;
			}
			ci++;
		}	
		return (array);
	}
	
	//gets the data in each cell
	private static Object getData(int i, int j) {
		Cell = ExcelSheet.getRow(i).getCell(j);
		if(Cell.getCellType() == 0)
			Cell.getNumericCellValue();
		else if(Cell.getCellType() == 1)
			return Cell.getStringCellValue();
		else if (Cell.getCellType() == 3)
			return "";
		else if(Cell.getCellType() == 4)
			return Cell.getBooleanCellValue();
		return "";
	}
}