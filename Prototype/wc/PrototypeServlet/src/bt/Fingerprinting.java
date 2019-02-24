package bt;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/Fingerprinting")
public class Fingerprinting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Fingerprinting() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*** get ***");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		String hash = request.getParameter("hash");
		String method = request.getParameter("method");
		
		String filePath;
		switch(method) {
		case "canvas":
			filePath = "C:\\Users\\mayer.LAPTOP-T80OEI65\\Desktop\\CanvasPrints.json";
			break;
		case "browser":
			filePath = "C:\\Users\\mayer.LAPTOP-T80OEI65\\Desktop\\BrowserPrints.json";
			break;
		default:
			filePath = "C:\\Users\\mayer.LAPTOP-T80OEI65\\Desktop\\BrowserPrints.json";
		}
		
		
		String firstVisit = "";
		boolean existingUser = false;

		try {
			JSONParser parser = new JSONParser();
			JSONObject jsonRoot = (JSONObject) parser.parse(new FileReader(filePath));
			JSONArray userArray = (JSONArray) jsonRoot.get("users");
					
			for (Object user : userArray) {
			    JSONObject jsonUser = (JSONObject) user;
			    String tmpHash = (String) jsonUser.get("hash");
			    
			    
			    if(tmpHash.equals(hash)) {
			    	existingUser = true;
			    	System.out.println("existing user");
			    	firstVisit = (String) jsonUser.get("firstVisit");
			    }	
		     }
			
			if (!existingUser) {
				String currDate = new SimpleDateFormat("dd.MM.yyyy (hh:mm)").format(Calendar.getInstance().getTime()).toString();
				
				JSONObject object = new JSONObject();
		        object.put("hash", hash);
		        object.put("firstVisit", currDate);
		        userArray.add(object);
		        jsonRoot.put("users", userArray);
		        
		        FileWriter fileWriter = new FileWriter(filePath);
	            fileWriter.write(jsonRoot.toJSONString());
	            fileWriter.close();
			}
			
		} catch (Exception e) {
			System.out.println("error occured - " + e + ".");
		} finally {
			
		}

		// OUTPUT FOR USER
		PrintWriter out = response.getWriter();
		if(existingUser) {
			out.print("You first visited this prototype on: " + firstVisit);
		}
		else {
			out.print("This is your first visit!");
		}		
	}
}
