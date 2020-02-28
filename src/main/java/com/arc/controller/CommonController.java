package com.arc.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.arc.model.ContactUs;
import com.arc.model.Testinfo;
import com.arc.model.UploadQuestions;
import com.arc.model.User;
import com.arc.service.ContactService;
import com.arc.service.TestService;
import com.arc.service.UploadQuestionService;
import com.arc.service.UserService;

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
//	@Autowired
	// HttpServletRequest request;

	@RequestMapping({ "/", "/home" })
	public String index() {
		return "index";
	}

	@RequestMapping("/admin")
	public String admin() {
		return "examiner";
	}

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
		ModelAndView m = new ModelAndView("welcome");

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
	//	System.out.println(testlist.get(1).getTestName());
		if(!testlist.isEmpty())
		{	m.addObject("testList", testlist);
			return m;
		}else {
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

}