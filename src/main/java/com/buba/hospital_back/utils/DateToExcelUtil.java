package com.buba.hospital_back.utils;

import com.buba.hospital_back.bean.SelectYygl;
import com.buba.hospital_back.service.SecHospitalService;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * <p>TODO</p>
 *
 * @author ran
 * @since 2019/12/30
 **/

public class DateToExcelUtil {
    @Autowired
    private static  SecHospitalService secHospitalService;



    public static String getExcel(List<SelectYygl> list){
        String  url=null;
        //第一步：创建一个workbook对应一个Excel文件
        HSSFWorkbook workbook=new HSSFWorkbook();
        //第二部：在workbook中创建一个sheet对应Excel中的sheet
        HSSFSheet sheet=workbook.createSheet("微信小程序-医院列表");
        //第三部：在sheet表中添加表头第0行，老版本的poi对sheet的行列有限制
        HSSFRow row=sheet.createRow(0);
        //第四部：创建单元格，设置表头

        HSSFCell cell=row.createCell((short) 0);
        cell.setCellValue("序号");

        cell=row.createCell((short) 1);
        cell.setCellValue("id");
        cell=row.createCell((short) 2);
        cell.setCellValue("管理员");
        cell=row.createCell((short) 3);
        cell.setCellValue("医院全称");
        cell=row.createCell((short) 4);
        cell.setCellValue("医院简称");
        cell=row.createCell((short) 5);
        cell.setCellValue("医生数量");



        //第五部：写入实体数据，实际应用中这些 数据从数据库得到，对象封装数据，集合包对象。对象的属性值对应表的每行的值
        for(int i=0;i<list.size();i++){
            HSSFRow row1=sheet.createRow(i+1);
            SelectYygl user=list.get(i);
            //创建单元格设值
            row1.createCell((short)0).setCellValue(user.getId());
            row1.createCell((short)1).setCellValue(user.getId());
            row1.createCell((short)2).setCellValue(user.getUsername());
            row1.createCell((short)3).setCellValue(user.getHospitalName());
            row1.createCell((short)4).setCellValue(user.getHospitalSort());
            row1.createCell((short)5).setCellValue(user.getCount());
        }
        //将文件保存到指定的位置
        try {
            Calendar now = Calendar.getInstance();
            long timeInMillis = now.getTimeInMillis();
            //拼接
           url = "E:\\xiangmu\\"+"医院表"+timeInMillis+".xlsx";
            FileOutputStream fos=new FileOutputStream(url);
            workbook.write(fos);
            System.out.println("写入成功");
            fos.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    return url;
    }


}