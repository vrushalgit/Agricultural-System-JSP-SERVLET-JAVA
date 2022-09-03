package com.reports;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.DatabaseConnection;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class AllCropSellingsReport
 */
@WebServlet("/AllCropSellingsReport")
public class AllCropSellingsReport extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final ServletContext servletContext = request.getSession().getServletContext();
		final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		final String temperotyFilePath = tempDirectory.getAbsolutePath();
		String fileName = "Customers-Crop-Selling-Report-" + System.currentTimeMillis() + ".pdf";
		response.setContentType("application/pdf");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "max-age=0");
		response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);

		try {
			createPDF(temperotyFilePath + "\\" + fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos = convertPDFToByteArrayOutputStream(temperotyFilePath + "\\" + fileName);
			OutputStream os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private static ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {

		InputStream inputStream = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {

			inputStream = new FileInputStream(fileName);

			byte[] buffer = new byte[1024];
			baos = new ByteArrayOutputStream();

			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				baos.write(buffer, 0, bytesRead);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return baos;
	}

	public static Document createPDF(String file) {
		Document document = null;
		try {
			document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();
			addMetaData(document);
			addTitlePage(document);
			createTable(document);
			document.close();

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return document;

	}

	private static void addMetaData(Document document) {
		document.addTitle("Generate PDF report");
		document.addSubject("Generate PDF report");
		document.addAuthor("Sushil Pawar");
		document.addCreator("Adi Pawar");
	}

	private static void addTitlePage(Document document) throws DocumentException {

		Paragraph preface = new Paragraph();
		creteEmptyLine(preface, 1);
		preface.add(new Paragraph("Customers Crop Selling Report ", TIME_ROMAN));

		creteEmptyLine(preface, 1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		preface.add(
				new Paragraph("Customers Crop Selling Report on " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));

		document.add(preface);

	}

	private static void creteEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

	private static void createTable(Document document) throws DocumentException {

		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(10);
		float[] columnWidths = new float[]{6f, 12f, 15f,16f,10f,10f,15f,8f,15f,10f};
        table.setWidths(columnWidths);

		PdfPCell c1 = new PdfPCell(new Phrase("Sell Id"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Customer Name"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Email Id"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Mobile No"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("Address"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Crop Name"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Crop Description"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Quanitity"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Buyer Name"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("Status"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		

		table.setHeaderRows(1);

		PdfPCell[] cells = table.getRow(0).getCells();
		for (int j = 0; j < cells.length; j++) {
			cells[j].setBorderColor(BaseColor.BLACK);
			cells[j].setBackgroundColor(BaseColor.GRAY);
		}

		try {
			PdfPCell TableCell = null;
			table.setWidthPercentage(100);
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
			ResultSet resultset = DatabaseConnection.getResultFromSqlQuery("select * from tblsellcrops");
			while (resultset.next()) {
				String sellId = resultset.getString("sell_id");
				String cname = resultset.getString("customer_name");
				String email_id = resultset.getString("email_id");
				String mobile_no = resultset.getString("mobile_no");
				String address = resultset.getString("address");
				String cropName= resultset.getString("crop_name");
				String cropDescription = resultset.getString("crop_description");
				String quantity = resultset.getString("crop_quantity");
				String buyerName = resultset.getString("admin_name");
				String status = resultset.getString("status");
				
				
				TableCell = new PdfPCell(new Phrase(sellId));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(cname));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(email_id));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(mobile_no));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(address));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(cropName));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(cropDescription));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(quantity));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(buyerName));
				table.addCell(TableCell);
				TableCell = new PdfPCell(new Phrase(status));
				table.addCell(TableCell);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		document.add(table);
	}
}
