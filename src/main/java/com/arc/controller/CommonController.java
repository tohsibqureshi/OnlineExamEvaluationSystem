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
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
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
import com.arc.model.Result;
import com.arc.model.Student;
import com.arc.model.StudentLogin;
import com.arc.model.Testinfo;
import com.arc.model.UploadQuestions;
import com.arc.model.User;
import com.arc.service.ContactService;
import com.arc.service.FeedbackService;
import com.arc.service.ResultService;
import com.arc.service.StudentLoginService;
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
	@Autowired
	ResultService resultService;
	@Autowired
	StudentLoginService studentLoginService;

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

	@RequestMapping(value = "/addrecord", method = RequestMethod.POST)
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

	@RequestMapping(value = "/login", method = RequestMethod.POST)
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
					User user = (User) session.getAttribute("user");
					//int noOFtest = studentService.noofTest(user.getEmail());
					//List<Student> student = studentService.getTestDetails(user.getEmail());
					// System.out.print(student.get(0).getFirstname());
					//List<Testinfo> testdetail = testService.getTestDetail(student);
					List<Testinfo> testlist = testService.getList(user.getUserId());
					Gson gson = new GsonBuilder().create();
					JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
					int noOFtest =array.size();
					System.out.println(array);
					if (!testlist.isEmpty()) {
						m.addObject("noOftest", noOFtest);
						m.addObject("testList", testlist);
						m.addObject("json", array);
					}
					m.addObject("userClickHome", true);
					m.addObject("dash_title", "Home");
					m.addObject("title", "Dashboard");

					return m;
				} else {

					User user = (User) session.getAttribute("user");
					//int noOFtest = studentService.noofTest(user.getEmail());
					//List<Student> student = studentService.getTestDetails(user.getEmail());
					// System.out.print(student.get(0).getFirstname());
				//	List<Testinfo> testdetail = testService.getTestDetail(student);
					List<StudentLogin> student = studentLoginService.getTestDetails(user.getUserId());
					Gson gson = new GsonBuilder().create();
					JsonArray array = gson.toJsonTree(student).getAsJsonArray();
					System.out.println(array);
					int noOFtest =array.size();
					
					ModelAndView m = new ModelAndView("student");
					if (!student.isEmpty()) {
						m.addObject("noOftest", noOFtest);
						m.addObject("testList", student);
						m.addObject("json", array);
					}
					m.addObject("userClickStudentDashboard", true);
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
		System.out.println("ttststts" + info.getfId());
		testService.addTest(info);
//	int test_id=info.getTestId();
		ModelAndView m = new ModelAndView("examiner");
		m.addObject("userClickAddTest", true);
		m.addObject("dash_title", "Enter Questions");
		m.addObject("title", "Upload Question Form");
		
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
	public ModelAndView addQuestion(@RequestParam String jsonobj, @RequestParam int testId,HttpSession session) throws ParseException {
		System.out.println(jsonobj + testId);
		uploadQuestionService.addQuestion(jsonobj, testId);
//	System.out.println("questuonnnss"+uploadQuestions.getQuestion());
		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());

		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		// System.out.println(array);

		m.addObject("json", array);
		// m.addObject("size",testlist.size());

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

	@RequestMapping("/addquery")
	public ModelAndView contactUs(ContactUs contact) {
		contactService.addContact(contact);
		ModelAndView m = new ModelAndView("index");
		m.addObject("msg", "<div id=\"message\">\n" + "    <div style=\"padding: 5px;\">\n"
				+ "        <div id=\"inner-message\" class=\"alert alert-success alert-dismissible\">\n"
				+ "            <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n"
				+ "            <strong>Success!   </strong>We will contact you soon.\n" + "        </div>\n"
				+ "    </div>\n" + "</div>");
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

	@RequestMapping("/deleteque")
	public ModelAndView deleteQue(HttpSession session, @RequestParam int id) {

		ModelAndView m = new ModelAndView("examiner");
		UploadQuestions question = uploadQuestionService.getQuestion(id);
		uploadQuestionService.delete(id);
		User user = (User) session.getAttribute("user");

		// System.out.println(user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(question.getTestId());
		System.out.println(quelist);
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(quelist).getAsJsonArray();

		m.addObject("json", array);
		m.addObject("size", quelist.size());

		System.out.println("User in update que " + user);
		m.addObject("userClickShowQUes", true);
		m.addObject("dash_title", "Questions");
		m.addObject("title", "Questions");
		return m;
	}

	@RequestMapping("/updatequestion")
	public ModelAndView updateQue(HttpSession session, UploadQuestions que) {
		ModelAndView m = new ModelAndView("examiner");
		uploadQuestionService.updateQue(que);

		User user = (User) session.getAttribute("user");

		System.out.println("User in update que " + user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(que.getTestId());
		System.out.println("que list in update que " + quelist);

		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(quelist).getAsJsonArray();
		System.out.println(array);

		m.addObject("json", array);
		m.addObject("userClickShowQUes", true);
		m.addObject("dash_title", "Questions");
		m.addObject("title", "Questions");
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
		// System.out.println(array);

		m.addObject("json", array);
		// m.addObject("size",testlist.size());

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

		m.addObject("json", array);
		m.addObject("size", testlist.size());

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

	@RequestMapping("/available_test")
	public ModelAndView showAllTest(HttpSession session) {
		ModelAndView m = new ModelAndView("student");
		List<Testinfo> testlist = testService.getalltest();
		// System.out.println(testlist.get(1).getTestName());
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();

		m.addObject("json", array);
		m.addObject("size", testlist.size());

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

		// ModelAndView m = new ModelAndView("questiontable");
		ModelAndView m = new ModelAndView("examiner");
		// User user = (User) session.getAttribute("user");

		// System.out.println(user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(id);
		System.out.println(quelist);
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(quelist).getAsJsonArray();

		m.addObject("json", array);
		m.addObject("size", quelist.size());

		if (quelist != null) {
			m.addObject("queList", quelist);
			m.addObject("userClickShowQUes", true);
			m.addObject("dash_title", "Questions");
			m.addObject("title", "Questions");
		}
		return m;
	}

	@RequestMapping("/showawailableque")
	public ModelAndView showawailableque(HttpSession session, @RequestParam int id) {

		// ModelAndView m = new ModelAndView("questiontable");
		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");

		// System.out.println(user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(id);
		System.out.println(quelist);
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(quelist).getAsJsonArray();

		m.addObject("json", array);
		m.addObject("size", quelist.size());

		if (quelist != null) {
			m.addObject("queList", quelist);
			m.addObject("userClickshowawailableque", true);
			m.addObject("dash_title", "Available Questions");
			m.addObject("title", "Available Questions");
		}
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

	@RequestMapping("/delete")
	public ModelAndView updateTest(HttpSession session, @RequestParam int id) {
		ModelAndView m = new ModelAndView("examiner");

		testService.deleteTest(id);
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		// System.out.println(array);

		m.addObject("json", array);
		m.addObject("size", testlist.size());
		m.addObject("userClickAfterUpdatetest", true);
		m.addObject("dash_title", "Updated tests");
		m.addObject("title", "Your Tests");

		return m;

	}

	@RequestMapping("/updatetest")
	public ModelAndView updateTest(HttpSession session, Testinfo test) {
		ModelAndView m = new ModelAndView("examiner");
		testService.addTest(test);

		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		// System.out.println(array);

		m.addObject("json", array);
		m.addObject("size", testlist.size());
		m.addObject("testList", testlist);
		m.addObject("userClickAfterUpdatetest", true);
		m.addObject("dash_title", "Updated tests");
		m.addObject("title", "Your Tests");

		return m;
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

			e.printStackTrace();
		}

		Date currentDate = null;
		try {
			currentDate = format.parse(cDate);
		} catch (java.text.ParseException e) {

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

		// User u = userService.getUser(email);

		studentService.addStudentDetails(student);

		ModelAndView m = new ModelAndView("instruction");

		// System.out.println();
		Testinfo test = testService.getTest(testId);
		m.addObject("test", test);
		m.addObject("testId", testId);
		m.addObject("sId", student.getId());
		return m;
	}

	@RequestMapping("/addstudent")
	public ModelAndView addStudentDetail(@RequestParam int id, HttpSession session) {

		// User u = userService.getUser(email);
		User user = (User) session.getAttribute("user");
		studentLoginService.addStudent(id, user.getUserId());

		ModelAndView m = new ModelAndView("instruction");

		// System.out.println();
		Testinfo test = testService.getTest(id);
		m.addObject("test", test);
		m.addObject("testId", id);
		m.addObject("sId", user.getUserId());
		return m;
	}

	// add student method

	@RequestMapping("/editprofile")
	public ModelAndView editProfile() {

		ModelAndView m = new ModelAndView("examiner");
		m.addObject("userClickEditProfile", true);
		m.addObject("dash_title", "Edit Profile");
		m.addObject("title", "Profile");
		return m;
	}

	@RequestMapping("/edit_profile")
	public ModelAndView editSProfile() {

		ModelAndView m = new ModelAndView("student");
		m.addObject("userClickEditProfile", true);
		m.addObject("dash_title", "Edit Profile");
		m.addObject("title", "Profile");
		return m;
	}

	@RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
	public ModelAndView update(User user, @RequestParam MultipartFile file, HttpSession session) {
		String filename = file.getOriginalFilename();
		String realPath = request.getRealPath("/");
		String finalPath = realPath + "upload";
		System.out.println("-=========" + realPath);
		System.out.println("-=========" + realPath);
		System.out.println("===============" + finalPath);
		System.out.println("================" + finalPath + "/" + filename);
		String p = finalPath + "/" + filename;
		if (filename.isEmpty()) {
			filename = "pp.png";
		}
		try {

			BufferedOutputStream b = new BufferedOutputStream(new FileOutputStream(p));
			b.write(file.getBytes());
			b.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (filename.isEmpty()) {
			filename = "pp.png";
		}
		user.setImageName(filename);

		userService.updateRecord(user);
		session.setAttribute("user", userService.getUser(user.getEmail()));
		ModelAndView m;
		if (user.getRoles().equals("student")) {
			m = new ModelAndView("student");
			m.addObject("userClickStudentDashboard", true);
			m.addObject("dash_title", "Home");
			m.addObject("title", "Dashboard");
		} else {
			m = new ModelAndView("examiner");
			m.addObject("userClickHome", true);
			m.addObject("dash_title", "Home");
			m.addObject("title", "Dashboard");
		}

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
		ModelAndView m = new ModelAndView("thanks");

		return m;
	}

	@RequestMapping(value = "/starttest", method = RequestMethod.GET)
	public ModelAndView startTest(@RequestParam int id, @RequestParam long sId) {

		List<com.arc.model.UploadQuestions> list = uploadQuestionService.getList(id);

		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(list).getAsJsonArray();
		System.out.println(array);
		ModelAndView m = new ModelAndView("testlive");

		m.addObject("json", array);
		m.addObject("size", list.size());
		m.addObject("sId", sId);
		m.addObject("testId", id);
		return m;
	}

	@RequestMapping(value = "/submittest", method = RequestMethod.GET)
	public ModelAndView submitTest(@RequestParam String jsonobj, @RequestParam long sId, @RequestParam int testId)
			throws Exception {

		System.out.println("helowwww" + sId);
		System.out.println("helowwww" + jsonobj);
		System.out.println("helowwww" + testId);
		resultService.addresultDetails(jsonobj, sId);
		Testinfo test = testService.getTest(testId);
		Gson g = new Gson();
		JSONParser parser = new JSONParser();
		JSONArray array = (JSONArray) parser.parse(jsonobj);
		int marks = 0;
		int correct = Integer.parseInt(test.getCorrect());
		int incorrect = Integer.parseInt(test.getIncorrect());
        String testname=test.getTestName();
		for (int i = 0; i < array.size(); i++) {
			JSONObject objects = (JSONObject) array.get(i);
			String str = g.toJson(objects);
			Result res = g.fromJson(str, Result.class);
			if (res.getCorrectOpt().equals(res.getSelectedOpt())) {
				marks = marks + correct;
			}
			else {
				marks = marks - incorrect;
			}

		}
		System.out.print("the marks for test is " + marks);
		String result = "FAIL";
		if (marks >= Integer.parseInt(test.getCutoff())) {
			result = "PASS";
		}
		
		System.out.println(result);
		Object student;
		if (userService.getUserById(sId) != null) {
			studentLoginService.updateMarks(sId, marks, result,testname);
			student = studentLoginService.getStudentById(sId);
		} else {
			studentService.updateMarks(sId, marks, result);
			student = studentService.getStudentById(sId);
		}
		// System.out.println(video);
//
//		byte[] decodedByte = org.apache.tomcat.util.codec.binary.Base64.decodeBase64(video);
//
//		Blob b = new SerialBlob(decodedByte);
//		System.out.println(b.length());
//
//		Student s = new Student();
//		s.setBranch("cse");
//		s.setVideo(b);
//		s.setEmail("a@b.fd");
//		// s.setfId(12);
//		s.setFirstname("Rahul");
//		s.setGender("male");
//		s.setInstitute("asd");
//		s.setLastname("fds");
//		s.setPhone("5665555545");

		// studentService.addStudentDetails(s);
		// Student student = studentService.getStudentById(sId);
		ModelAndView m = new ModelAndView("feedbackform");
		m.addObject("student", student);

		return m;
	}

	@RequestMapping("/dashboard")
	public ModelAndView showDashboard(HttpSession session) {

		ModelAndView m = new ModelAndView("examiner");
		User user = (User) session.getAttribute("user");
		int noOFtest = testService.noOfTest(user.getUserId());
		List<Testinfo> testlist = testService.getList(user.getUserId());
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(testlist).getAsJsonArray();
		// System.out.println(array);

		m.addObject("json", array);
		// m.addObject("size",testlist.size());

		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			m.addObject("userClickHome", true);
			m.addObject("dash_title", "Home");
			m.addObject("noOftest", noOFtest);
			m.addObject("title", "Dashboard");
			return m;
		} else {
			m.addObject("msg", "No Record found");
			m.addObject("userClickHome", true);
			m.addObject("dash_title", "Home");
			m.addObject("noOftest", noOFtest);
			m.addObject("title", "Dashboard");
			return m;
		}

	}

	@RequestMapping("/showresult")
	public ModelAndView showresult(@RequestParam int testId, HttpSession session) {

		ModelAndView m = new ModelAndView("examiner");
		List<Student> result = studentService.getResult(testId);
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(result).getAsJsonArray();
		System.out.print(array);
		m.addObject("json", array);
		m.addObject("size", result.size());

		m.addObject("testId", testId);
		m.addObject("userClickShowResult", true);
		m.addObject("dash_title", "Test RESULT");
		m.addObject("title", "Test Result");
		return m;

	}

	@RequestMapping("/dashboard_student")
	public ModelAndView dashboard_student(HttpSession session) {
		ModelAndView m = new ModelAndView("student");
		User user = (User) session.getAttribute("user");
		
		List<StudentLogin> student = studentLoginService.getTestDetails(user.getUserId());
		// System.out.print(student.get(0).getFirstname());
		
		Gson gson = new GsonBuilder().create();
		JsonArray array = gson.toJsonTree(student).getAsJsonArray();
		System.out.println(array);
		int noOFtest = array.size();

		if (!student.isEmpty()) {
			m.addObject("testList", student);
			m.addObject("json", array);
			m.addObject("userClickStudentDashboard", true);
			m.addObject("dash_title", "Home");
			m.addObject("noOftest", noOFtest);
			m.addObject("title", "Dashboard");
			return m;
		} else {
			m.addObject("msg", "No Record found");
			m.addObject("userClickStudentDashboard", true);
			m.addObject("dash_title", "Home");
			m.addObject("noOftest", noOFtest);
			m.addObject("title", "Dashboard");
			return m;
		}

	}

	@RequestMapping("/about")
	public ModelAndView about() {
		ModelAndView m = new ModelAndView("examiner");

		m.addObject("userClickAbout", true);
		m.addObject("dash_title", "About");

		m.addObject("title", "About Us");
		return m;
	}

	@RequestMapping("/contact")
	public ModelAndView contact() {
		ModelAndView m = new ModelAndView("examiner");

		m.addObject("userClickContact", true);
		m.addObject("dash_title", "Contact");

		m.addObject("title", "Contact Details");
		return m;
	}

	@RequestMapping("/policy")
	public ModelAndView policy() {
		ModelAndView m = new ModelAndView("examiner");

		m.addObject("userClickPolicy", true);
		m.addObject("dash_title", "Privacy and Policy");

		m.addObject("title", "Privacy and Policy");
		return m;
	}

	@RequestMapping("/about_student")
	public ModelAndView aboutStudentt() {
		ModelAndView m = new ModelAndView("student");

		m.addObject("userClickAbout", true);
		m.addObject("dash_title", "About");

		m.addObject("title", "About Us");
		return m;
	}

	@RequestMapping("/contact_student")
	public ModelAndView contactStudent() {
		ModelAndView m = new ModelAndView("student");

		m.addObject("userClickContact", true);
		m.addObject("dash_title", "Contact");

		m.addObject("title", "Contact Details");
		return m;
	}

	@RequestMapping("/policy_student")
	public ModelAndView policyStudent() {
		ModelAndView m = new ModelAndView("student");

		m.addObject("userClickPolicy", true);
		m.addObject("dash_title", "Privacy and Policy");

		m.addObject("title", "Privacy and Policy");
		return m;
	}

}