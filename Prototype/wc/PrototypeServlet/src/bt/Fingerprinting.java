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

	private static Scanner x;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("*** post ***");
		
		response.setContentType("text/plain");
		String hash = request.getParameter("hash");
		
		String firstVisit = "";
		boolean existingUser = false;

		try {
			JSONParser parser = new JSONParser();
			JSONArray userArray = (JSONArray) parser.parse(new FileReader("C:\\Users\\mayer.LAPTOP-T80OEI65\\Desktop\\CanvasPrints.json"));
					
			for (Object user : userArray) {
			    JSONObject jsonUser = (JSONObject) user;
			    String tmpHash = (String) jsonUser.get("hash");
			    firstVisit = (String) jsonUser.get("firstVisit");
			    
			    System.out.println("* " + tmpHash + " - " + firstVisit);
			    if(tmpHash.equals(hash)) {
			    	existingUser = true;
			    	System.out.println("old user");
			    	firstVisit = (String) jsonUser.get("firstVisit");
			    }	
		     }
			
			if (!existingUser) {
				// add to json!
				String currDate = new SimpleDateFormat("dd.MM.yyyy (hh:mm)").format(Calendar.getInstance().getTime()).toString();
				
				//userArray.add({"hi", "there"});
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
