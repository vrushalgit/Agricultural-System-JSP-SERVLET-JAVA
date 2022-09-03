package com.admin;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.connection.DatabaseConnection;

/**
 * Servlet implementation class AdminAddInsecticides
 */
@SuppressWarnings("serial")
@WebServlet("/AdminAddInsecticides")
public class AdminAddInsecticides extends HttpServlet {
	private final String UPLOAD_DIRECTORY = "E:\\Projects\\E-Agriculture-System-BK\\E-Agriculture-System\\WebContent\\uploads\\";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				@SuppressWarnings("unchecked")
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String imageName = null;
				String insecticideId = null;
				String insecticideName = null;
				String insecticideCostPrice = null;
				String insecticideDescription = null;
				

				for (FileItem item : multiparts) {
					if (!item.isFormField()) {
						imageName = new File(item.getName()).getName();
						item.write(new File(UPLOAD_DIRECTORY + File.separator + imageName));

						FileItem iId = (FileItem) multiparts.get(0);
						insecticideId = iId.getString();

					
						FileItem iName = (FileItem) multiparts.get(1);
						insecticideName = iName.getString();

						FileItem iDescription = (FileItem) multiparts.get(2);
						insecticideDescription = iDescription.getString();
						
						FileItem iCostRange = (FileItem) multiparts.get(3);
						insecticideCostPrice = iCostRange.getString();


					}
				}
				try {
					String imagePath = UPLOAD_DIRECTORY + imageName;
					int i = DatabaseConnection.insertUpdateFromSqlQuery(
							"insert into tblinsecticide(id,insecticide_name,description,insecticide_cost_range,insecticide_image_name,insecticide_image) values('"
									+ insecticideId + "','" + insecticideName + "','" + insecticideDescription + "','" + insecticideCostPrice
									+ "','" + imageName + "','" + imagePath + "')");
					if (i > 0) {
						String success = "Insecticide added successfully.";
						session.setAttribute("message", success);
						response.sendRedirect("admin-manage-insecticides.jsp");
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception ex) {
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}

}
