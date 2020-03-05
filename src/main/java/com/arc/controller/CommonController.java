package com.arc.controller;

import java.io.BufferedOutputStream;

import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
					m.addObject("createtest", "Create Test");
					m.addObject("createdbyme", "Test Created By Me");

					return m;
				} else {
					ModelAndView m = new ModelAndView("examiner");

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
			ModelAndView m = new ModelAndView("createtest");
			User user = (User) session.getAttribute("user");
			m.addObject("F_id", user.getUserId());
			// System.out.println("sessss"+session.getAttribute("F_id"));

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
		m.addObject("msg", ":- Successfully Recorded");
		return m;
	}

	@RequestMapping("/updatepage")
	public ModelAndView updatepage(@RequestParam int id) {

		ModelAndView m = new ModelAndView("updateform");

		UploadQuestions question = uploadQuestionService.getQuestion(id);
		System.out.println(question.getQuestion());
		m.addObject("que", question);
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
		ModelAndView m = new ModelAndView("testtable");
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			return m;
		} else {
			m.addObject("msg", "No Record found");
			return m;
		}
	}

	@RequestMapping("/alltest")
	public ModelAndView showallTest(HttpSession session) {
		ModelAndView m = new ModelAndView("alltest");
		List<Testinfo> testlist = testService.getalltest();
		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			return m;
		} else {
			m.addObject("msg", "No Record found");
			return m;
		}
	}

	@RequestMapping("/showque")
	public ModelAndView showQue(HttpSession session, @RequestParam int id) {

		ModelAndView m = new ModelAndView("questiontable");

		User user = (User) session.getAttribute("user");

		System.out.println(user);

		List<UploadQuestions> quelist = uploadQuestionService.getList(id);

		if (quelist != null) {
			m.addObject("queList", quelist);
		} else
			m.addObject("msg", "No data found");
		return m;
	}

	@RequestMapping("/updatetestpage")
	public ModelAndView updateTestPage(@RequestParam int id) {

		ModelAndView m = new ModelAndView("updatetestform");

		Testinfo test = testService.getTest(id);
		System.out.println(test.getTestName());
		m.addObject("test", test);
		return m;
	}

	@RequestMapping("/updatetest")
	public ModelAndView updateTest(HttpSession session, Testinfo test) {
		ModelAndView m = new ModelAndView("testtable");
		testService.addTest(test);

		User user = (User) session.getAttribute("user");
		System.out.println(user);
		List<Testinfo> testlist = testService.getList(user.getUserId());
		// System.out.println(testlist.get(1).getTestName());
		if (!testlist.isEmpty()) {
			m.addObject("testList", testlist);
			return m;
		} else {
			m.addObject("msg", "No Record found");
			return m;
		}

	}

	@RequestMapping("/getlink")
	public ModelAndView getLink(@RequestParam int id, HttpSession session) {

		ModelAndView m = new ModelAndView("linkpage");
		User user = (User) session.getAttribute("user");
		String link = "localhost:8080/testhosted?AcRfg=" + id + "&arcDz=" + user.getEmail();

		m.addObject("link", link);
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
	public ModelAndView editProfile(HttpSession session) {

		ModelAndView m = new ModelAndView("profile");

		return m;
	}
	
	@RequestMapping(value="/updateprofile",method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView update(User user,@RequestParam MultipartFile file) {
		String filename=file.getOriginalFilename();
		String realPath=request.getRealPath("/");
		String finalPath=realPath+"upload";
		System.out.println("-========="+realPath);
		System.out.println("-========="+realPath);
		System.out.println("==============="+finalPath);
		System.out.println("================"+finalPath+"/"+filename);
		String p=finalPath+"/"+filename;
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
		
		userService.addRecord(user);
		
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
	
	
}