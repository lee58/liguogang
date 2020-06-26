package com.itor.common.util;

import com.itor.entity.Menu;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ExcelUtl {
    public static void main(String[] args) throws Exception {
        File file = new File("C:\\Users\\95205\\Desktop\\文件\\testExcel.xls");
        List<Menu> list = new ArrayList<>();
        list.add(new Menu(0, "name2", "methodPath2", "desc2"));
        saveAsExcel(list, file);
        List<Menu> list2 = readAsExcel(file);
        list2.forEach(menu -> System.out.println(menu.toString()));
    }

    private static List<Menu> readAsExcel(File file) throws IOException {
        Workbook wb = WorkbookFactory.create(file);
        List<Menu> list = new ArrayList<>();
        for (Sheet sheet : wb) {
            for (Row row : sheet) {
                Double parentId = row.getCell(0).getNumericCellValue();
                String name = row.getCell(1).getStringCellValue();
                String methodPath = row.getCell(2).getStringCellValue();
                String desc = row.getCell(3).getStringCellValue();
                list.add(new Menu(parentId.intValue(), name, methodPath, desc));
            }
        }
        return list;
    }

    private static void saveAsExcel(List<Menu> list, File file) throws Exception {
        Workbook wb = new HSSFWorkbook();
        Sheet sheet = wb.createSheet();
        for (int i = 0; i < list.size(); i ++) {
            Menu menu = list.get(i);
            Row row = sheet.createRow(i);
            row.createCell(0).setCellValue(menu.getParentId());
            row.createCell(1).setCellValue(menu.getName());
            row.createCell(2).setCellValue(menu.getMethodPath());
            row.createCell(3).setCellValue(menu.getDesc());
        }
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        wb.write(fileOutputStream);
        fileOutputStream.close();
        wb.close();
    }
}
