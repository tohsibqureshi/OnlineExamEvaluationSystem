package com.arc.controller;

import java.io.BufferedOutputStream;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import javax.sql.rowset.serial.SerialException;

import org.json.simple.JSONArray;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.arc.model.ContactUs;
import com.arc.model.Feedbackinfo;
import com.arc.model.Student;
import com.arc.model.Testinfo;
import com.arc.model.UploadQuestions;
import com.arc.model.User;
import com.arc.service.ContactService;
import com.arc.service.FeedbackService;
import com.arc.service.TestService;
import com.arc.service.UploadQuestionService;
import com.arc.service.UserService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.arc.service.StudentService;

@Controller
public class CommonController {
	@Autowired
	UserService userService;
	@Autowired
	TestService testService;
	@Autowired
	UploadQuestionService uploadQuestionService;
	@Autowired
	ContactService contactService;
	@Autowired
	StudentService studentService;
	@Autowired
	FeedbackService feedbackService;
	@Autowired
	 HttpServletRequest request;

	@RequestMapping({ "/", "/home" })
	public String index() {
		return "index";
	}

//	@RequestMapping("/admin")
//	public String admin() {
//		return "examiner";
//	}

//	@GetMapping("/user")
//	public String user() {
//		return "<h2>Welcome User!</h2>";
//	}

	@RequestMapping("/loginpage")
	public String login1() {

		return "login";
	}

	@RequestMapping("/signup")
	public String signup() {

		return "signup";
	}

	@RequestMapping(value = "/addrecord", method = RequestMethod.GET)
	public ModelAndView addRecord(User user) {

		userService.addRecord(user);
		// System.out.println(user.getFaculty());
		// System.out.println(user.getEmail());
		// System.out.println(user.getId());
		// System.out.println(user.getPassword());
		ModelAndView m = new ModelAndView("login");
		m.addObject("name", user.getName());
		return m;
	}

	@RequestMapping("/login")
	public ModelAndView login(@RequestParam String email, @RequestParam String password, HttpSession session) {
		// System.out.print(email+password);

		String mail = userService.getEmail(email);
		String pass = userService.getPassword(email);

		// System.out.println("**"+f_id);
		if (mail != null) {
			if (email.equals(mail) && password.equals(pass)) {
				// userService.setLogin(email);
				session.setAttribute("user", userService.getUser(email));
				if (userService.getRole(email).equals("faculty")) {
					ModelAndView m = new ModelAndView("examiner");
					
					
					m.addObject("userClickHome", true);
					m.addObject("dash_title", "Home");
					m.addObject("title", "Dashboard");

					return m;
				} else {
					ModelAndView m = new ModelAndView("examiner");
					m.addObject("userClickHome", true);
					m.addObject("dash_title", "Home");
					m.addObject("title", "Dashboard");
					return m;
				}
			}
		} else {
			ModelAndView m = new ModelAndView("login");
			m.addObject("msg", "Wrong Credencials");
			return m;
		}
		return new ModelAndView("login").addObject("msg", "Wrong Credencials");
	}

	@RequestMapping("/loginfailed")
	public String lp() {
		return "loginpage";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
//		userService.setLogout();

		if (session != null) {
			session.removeAttribute("user");
			session.invalidate();
			session = null;
		}
		return "index";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView creatTest(HttpSession session) {
		if (session != null) {
			ModelAndView m = new ModelAndView("examiner");
			User user = (User) session.getAttribute("user");
			m.addObject("F_id", user.getUserId());
			// System.out.println("sessss"+session.getAttribute("F_id"));
			m.addObject("userClickCreateTest", true);
			m.addObject("dash_title", "Create Custom Test");
			m.addObject("title", "Test Creation");
			return m;
		} else {
			ModelAndView m = new ModelAndView("loginpage");
			return m;
		}
	}

	@RequestMapping(value = "/addtest", method = RequestMethod.GET)
	public ModelAndView addTest(Testinfo info) {
		// System.out.println("ttststts"+info.getF_id());
		testService.addTest(info);
//	int test_id=info.getTestId();
		ModelAndView m = new ModelAndView("UploadQuestions");
//	m.addObject("test_id",test_id);
		m.addObject("totalques", info.getnQuestions());
		m.addObject("testid", info.getTestId());
		return m;
	}

//@RequestMapping("/UploadQuestions")
	public ModelAndView UploadQuestions() {
		ModelAndView m = new ModelAndView("UploadQuestions");

		return m;
	}

	@RequestMapping(value = "/addQuestion", method = RequestMethod.GET)
	public ModelAndView addQuestion(@RequestParam String jsonobj, @RequestParam int testId) throws ParseException {
		System.out.println(jsonobj + testId);
		uploadQuestionService.addQuestion(jsonobj, testId);
//	System.out.println("questuonnnss"+uploadQuestions.getQuestion());
		ModelAndView m = new ModelAndView("examiner");

		return m;
	}

	@RequestMapping("/addquery")
	public ModelAndView contactUs(ContactUs contact) {
		contactService.addContact(contact);
		ModelAndView m = new ModelAndView("index");
		m.addObject("msg", "<div id=\"message\">\n" + 
				"    <div style=\"padding: 5px;\">\n" + 
				"        <div id=\"inner-message\" class=\"alert alert-success alert-dismissible\">\n" + 
				"            <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n" + 
				"            <strong>Success!   </strong>We will contact you soon.\n" + 
				"        </div>\n" + 
				"    </div>\n" + 
				"</div>");
		return m;
	}

	@RequestMapping("/updatepage")
	public ModelAndView updatepage(@RequestParam int id) {

		ModelAndView m = new ModelAndView("examiner");

		UploadQuestions question = uploadQuestionService.getQuestion(id);
		System.out.println(question.getQuestion());
		m.addObject("que", question);
		m.addObject("userClickUpdateQuePage", true);
		m.addObject("dash_title", "Update Que Form");
		m.addObject("title", "Update Question");
		return m;
	}

	@RequestMapping("/updatequestion")
	public ModelAndView updateQue(HttpSession session, UploadQuestions que) {
		ModelAndView m = new ModelAndView("questiontable");
		uploadQuestionService.updateQue(que);

		User user = (User) session.getAttribute("user");

		System.out.println("User in update que " + user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(que.getTestId());
		System.out.println("que list in update que " + quelist);

		if (quelist != null) {
			m.addObject("queList", quelist);
		} else
			m.addObject("msg", "No data found");
		return m;
	}

	@RequestMapping("/testtable")
	public ModelAndView showTable(HttpSession session) {
		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		
		

		
		 Gson gson = new GsonBuilder().create();
		 JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		System.out.println(array);
		
		
		m.addObject("json",array);
		//m.addObject("size",testlist.size());
		
		
	

		
		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			m.addObject("userClickCreatedTest", true);
			m.addObject("dash_title", "My Test");
			m.addObject("title", "My Tests");
			return m;
		} else {
			m.addObject("msg", "No Record found");
			m.addObject("userClickCreatedTest", true);
			m.addObject("dash_title", "My Test");
			m.addObject("title", "My Tests");
			return m;
		}
	}

	@RequestMapping("/alltest")
	public ModelAndView showallTest(HttpSession session) {
		ModelAndView m = new ModelAndView("examiner");
		List<Testinfo> testlist = testService.getalltest();
		// System.out.println(testlist.get(1).getTestName());
		 Gson gson = new GsonBuilder().create();
		 JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		
		
		m.addObject("json",array);
		m.addObject("size",testlist.size());
		
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			m.addObject("userClickAvailableTest", true);
			m.addObject("dash_title", "Available Test");
			m.addObject("title", "Available Tests");
			return m;
		} else {
			m.addObject("msg", "No Record found");
			return m;
		}
	}

	@RequestMapping("/showque")
	public ModelAndView showQue(HttpSession session, @RequestParam int id) {

		//ModelAndView m = new ModelAndView("questiontable");
		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");

		System.out.println(user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(id);

		 Gson gson = new GsonBuilder().create();
		 JsonArray array = gson.toJsonTree(quelist).getAsJsonArray();
		
		
		m.addObject("json",array);
		m.addObject("size",quelist.size());
		
		if (quelist != null) {
			m.addObject("queList", quelist);
			m.addObject("userClickShowQUes", true);
			m.addObject("dash_title", "Show QUes");
			m.addObject("title", "Show QUes");
		} else
			m.addObject("msg", "No data found");
		return m;
	}

	@RequestMapping("/updatetestpage")
	public ModelAndView updateTestPage(@RequestParam int id) {

		ModelAndView m = new ModelAndView("examiner");

		Testinfo test = testService.getTest(id);
		System.out.println(test.getTestName());
		m.addObject("test", test);
		m.addObject("userClickUpdateTest", true);
		m.addObject("dash_title", "Update test");
		m.addObject("title", "Update Test");
		
		return m;
	}

	@RequestMapping("/updatetest")
	public ModelAndView updateTest(HttpSession session, Testinfo test) {
		ModelAndView m = new ModelAndView("examiner");
		testService.addTest(test);

		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			m.addObject("userClickAfterUpdatetest", true);
			m.addObject("dash_title", "Updated test");
			m.addObject("title", "after Update Test");
			
			return m;
		} else {
			m.addObject("msg", "No Record found");
			return m;
		}

	}

	@RequestMapping("/getlink")
	public ModelAndView getLink(@RequestParam int id, HttpSession session) {

		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");
		String link = "localhost:8080/testhosted?AcRfg=" + id + "&arcDz=" + user.getEmail();

		m.addObject("link", link);
		m.addObject("userClickgetLink", true);
		m.addObject("dash_title", "Test Link is Ready");
		m.addObject("title", "Get Test Link");
		
		return m;
	}

	@RequestMapping("/testhosted")
	public ModelAndView hostTest(@RequestParam int AcRfg, @RequestParam String arcDz) {

		ModelAndView m = null;

		User u = userService.getUser(arcDz);

		if (u == null) {
			m = new ModelAndView("403");
			m.addObject("msg", "Please check url");
			return m;
		}

		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm");
		LocalDateTime now = LocalDateTime.now();

		String cDate = df.format(now);

		String[] splitTime = tf.format(now).split(":");

		String cTimeHour = splitTime[0];
		String cTimeMinute = splitTime[1];

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String eDate = testService.getExpiryDate(AcRfg);
		String eTime = testService.getExpiryTime(AcRfg);

		String[] splitDbTime = eTime.split(":");

		String eTimeHour = splitDbTime[0];
		String eTimeMinute = splitDbTime[1];

		System.out.println(cTimeHour + " " + cTimeMinute + " " + eTimeHour + " " + eTimeMinute + " ");

		Date dbDate = null;
		try {
			dbDate = format.parse(eDate);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Date currentDate = null;
		try {
			currentDate = format.parse(cDate);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Date < 0");
		System.out.println(currentDate.compareTo(dbDate));

		if (currentDate.compareTo(dbDate) < 0) {

			m = new ModelAndView("getlink");
			m.addObject("testId", AcRfg);
			m.addObject("email", arcDz);
			return m;

		} else if (currentDate.compareTo(dbDate) == 0) {
			System.out.println("Date == 0");
			System.out.println(currentDate.compareTo(dbDate) == 0);
			if (Integer.parseInt(eTimeHour) > Integer.parseInt(cTimeHour)) {
				System.out.println("ehour > chour");
				System.out.println(Integer.parseInt(eTimeHour) > Integer.parseInt(cTimeHour));
				m = new ModelAndView("getlink");
				m.addObject("testId", AcRfg);
				m.addObject("email", arcDz);
				return m;
			} else if (Integer.parseInt(eTimeHour) == Integer.parseInt(cTimeHour)) {
				System.out.println("ehour == chour");
				System.out.println(Integer.parseInt(eTimeHour) == Integer.parseInt(cTimeHour));
				if (Integer.parseInt(eTimeMinute) > Integer.parseInt(cTimeMinute)) {
					System.out.println("eminute > cminute");
					System.out.println(Integer.parseInt(eTimeMinute) > Integer.parseInt(cTimeMinute));
					m = new ModelAndView("getlink");
					m.addObject("testId", AcRfg);
					m.addObject("email", arcDz);
					return m;
				} else {
					m = new ModelAndView("linkexpire");
					return m;
				}
			} else {
				m = new ModelAndView("linkexpire");
				return m;
			}
		} else {
			m = new ModelAndView("linkexpire");
			return m;
		}

//		Testinfo test = testService.getTest(id);
//		System.out.println(test.getTestName());

	}

	@RequestMapping("/addstudentdetails/{testId}/{email}")
	public ModelAndView addStudentDetail(Student student, @PathVariable(value = "testId") int testId,
			@PathVariable(value = "email") String email) {

		User u = userService.getUser(email);

		student.setfId(u.getUserId());
		studentService.addStudentDetails(student);

		ModelAndView m = new ModelAndView("instruction");

		System.out.println();
		Testinfo test = testService.getTest(testId);
		m.addObject("test", test);
		m.addObject("testId", testId);
		return m;
	}

	@RequestMapping("/editprofile")
	public ModelAndView editProfile() {

		ModelAndView m = new ModelAndView("examiner");
		m.addObject("userClickEditProfile", true);
		m.addObject("dash_title", "Edit Profile");
		m.addObject("title", "Profile");
		return m;
	}
	
	@RequestMapping(value="/updateprofile",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView update(User user,@RequestParam MultipartFile file,HttpSession session) {
		String filename=file.getOriginalFilename();
		String realPath=request.getRealPath("/");
		String finalPath=realPath+"upload";
		System.out.println("-========="+realPath);
		System.out.println("-========="+realPath);
		System.out.println("==============="+finalPath);
		System.out.println("================"+finalPath+"/"+filename);
		String p=finalPath+"/"+filename;
		if(filename.isEmpty())
		{
			filename="pp.png";
		}
		try {
		
			BufferedOutputStream b=new BufferedOutputStream(new FileOutputStream(p));
		b.write(file.getBytes());
		b.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(filename.isEmpty())
		{
			filename="pp.png";
		}
		user.setImageName(filename);
		
		userService.updateRecord(user);
		session.setAttribute("user", userService.getUser(user.getEmail()));
		
		ModelAndView m = new ModelAndView("examiner");
	

		return m;
	}
	@RequestMapping("/feedbackform")
	public ModelAndView feedback() {
		ModelAndView m = new ModelAndView("feedbackform");
		
		
		
		return m;
	}
	@RequestMapping(value = "/addfeedback", method = RequestMethod.GET)
	public ModelAndView addFeedback(Feedbackinfo feedbackinfo) {

		feedbackService.addRecord(feedbackinfo);
		// System.out.println(user.getFaculty());
		// System.out.println(user.getEmail());
		// System.out.println(user.getId());
		// System.out.println(user.getPassword());
		ModelAndView m = new ModelAndView("welcome");
		
		return m;
	}
	
	@RequestMapping(value = "/starttest", method = RequestMethod.GET)
	public ModelAndView startTest(@RequestParam int id) {


		 List<com.arc.model.UploadQuestions> list = uploadQuestionService.getList(id);
		
		 Gson gson = new GsonBuilder().create();
		 JsonArray array = gson.toJsonTree(list).getAsJsonArray();
		System.out.println(array);
		 ModelAndView m = new ModelAndView("testlive");
		
		m.addObject("json",array);
		m.addObject("size",list.size());
		
		
		return m;
	}
	
	
	@RequestMapping(value = "/submittest", method = RequestMethod.GET)
	public ModelAndView submitTest(@RequestParam String video) throws Exception {

			System.out.println(video);
			
			byte[] decodedByte = org.apache.tomcat.util.codec.binary.Base64.decodeBase64(video);
		
			Blob b = new SerialBlob(decodedByte);
			System.out.println(b.length());
			
			Student s=new Student();
			s.setBranch("cse");
			s.setVideo(b);
			s.setEmail("a@b.fd");
			s.setfId(12);
			s.setFirstname("Rahul");
			s.setGender("male");
			s.setInstitute("asd");
			s.setLastname("fds");
			s.setPhone("5665555545");
			
			
			
		//	studentService.addStudentDetails(s);
			
			
			
		ModelAndView m = new ModelAndView("testlive");
		
		return m;
	}	
	
	@RequestMapping("/dashboard")
	public ModelAndView showDashboard(){

		
			
		ModelAndView m = new ModelAndView("examiner");
		
		
		m.addObject("userClickHome", true);
		m.addObject("dash_title", "Home");
		m.addObject("title", "Dashboard");
		return m;
	}
}