package com.muwei.demo.users.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muwei.demo.camp.model.Campsite;
import com.muwei.demo.camp.service.MyCampsiteService;
import com.muwei.demo.users.model.Users;
import com.muwei.demo.users.model.UsersDTO;
import com.muwei.demo.users.service.UsersService;

@Controller
public class UsersController {


	@Autowired
	private UsersService us;
	
	@Autowired
	private MyCampsiteService mCSer;

	@GetMapping("/loginPage")
	public String loginPage(HttpServletRequest r) {
		r.getSession().removeAttribute("userError");
		return "/users/login";
	}


	@GetMapping("/loginPageToBook")
	public String loginPageToBook(HttpServletRequest r,@RequestParam Integer id, Model m,@RequestParam String unitType) {
		r.getSession().removeAttribute("userError");
		m.addAttribute("id", id);
		m.addAttribute("unitType", unitType);
		return "/campsite/loginToBook";
	}

	@PostMapping("loginToBookPost")
	public String userLoginToBook(@RequestParam String email, @RequestParam String pwd, @RequestParam int id,@RequestParam String unitType,
			HttpServletRequest r, Model m) {
		Campsite cs = mCSer.findById(id);
		m.addAttribute(id);
		m.addAttribute("cs",cs);
		m.addAttribute("unitType", unitType);
		r.getSession().removeAttribute("userError");
		Users u = us.checkUser(new Users(email, pwd));
		if (u != null) {
			if (u.getAuth() == false) {
				r.getSession().setAttribute("userError", "account has not been verified, please check your remail");
				return "/campsite/loginToBook";
			}
			r.getSession().setAttribute("loginUser", u);

			
			return "/campsite/bookingpage1";
		}
		r.getSession().setAttribute("userError", "wrong email or password");

		return "/campsite/loginToBook" ;
	}


	@PostMapping("login")
	public String userLogin(@RequestParam String email, @RequestParam String pwd, HttpServletRequest r) {

		r.getSession().removeAttribute("userError");
		Users u = us.checkUser(new Users(email, pwd));
		if (u != null) {
			if (u.getAuth() == false) {
				r.getSession().setAttribute("userError", "account has not been verified, please check your remail");
				return "/users/login";
			}
			r.getSession().setAttribute("loginUser", u);
			
			return "/campsite/00index";
		}
		r.getSession().setAttribute("wrongUserE", email);
		r.getSession().setAttribute("userError", "wrong email or password");
//		System.out.println(email+pwd);

		return "/users/login";
	}
	


	@PostMapping("register")
	public String register(@RequestParam String email, @RequestParam String pwd, @RequestParam String username,
			@RequestParam String phone, @RequestParam String birth, @RequestParam String gender,
			Model m, HttpServletRequest r) {


		Users u = us.checkUserEmail(new Users(email, pwd));
		if (u != null) {
			m.addAttribute("duplicated", "email have been used");
			return "/users/register";
		}
		Date birth1 = new Date();
		try {
			birth1 = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Users u1 = new Users(email, pwd, username, phone, birth1, gender);
		u1.setImage("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIIAAACCCAMAAAC93eDPAAAAPFBMVEWoqan///+lpqaio6P4+Pj8/Pzs7OyfoKC8vb3e3t6wsbG0tbWrrKzv7+/y8vLFxsbR0tLm5ubLzMzX2NjSaS4JAAAEGklEQVR4nO2b25qrIAxGaVBBUfHw/u+60c44godCErpv/C/mojNfuxpCjo4Qjx49evTo0aNH2QUAUrof/+vDQTR6moZhsrqBL3OAVGaaq+K1U19bUF+ikLKxY/k606i/YAqAZvK/va8qNwRIO15//A9Ek5FBtvO5/QPNuQwhTR3z+Yt6IzMAQFtHWeCt0vIzqCkBYNHEzCDNzR24UK0YAQCGZABeBmgrDMFyMZgIpEn0gj8NPP4gLRbAieVeyIlA8CobOgFQbOBUkc0AmkbgwgPRJQHvib8qWiIC8jbuRbsVcqYTvAqSDRoGApo3wMfiJEodPk7Tb8OP8EaQPEZwIRJ9EoaJAJ+tcAn6TCMWQXVcCAUWoT0Exi4aKvhLJMHhPpRGShEVLXvXbol+9wIyRkOYpJfUD20EQWlgyS67VwwSIfTGNfPL/vVR/Xr0alfvapwzQJgfWjwCMjBA2DkNKjZrLF/acyUsQmiF0rpoFWEEdwnd2Tf7vgOLcIxMRRTAot5vfJC58nAjCMIicOVJPIJoyGXjJmyqVOmNLDcCS+H4FjI0cToDMkC7VBl9B31VVgfZDN1KyGNkqHSrP4CVVgEoP7RiCZzCt+8EuGR566Zju567V2wQOolDmlhb9buYVWy+v69ZKnwjAWEB+/ZseTn6q8X2YXtTUYYtKijj53d7qEJ3e2s0W8+iPDcitVPBvfwdWAC009jvj7vs5mabuELro5PmwWE3M25dspSt0dpOwzDPw6SN+OufwfqhvaQN3kJvmPdvB6uClYwUYRNW0wYthyhdy1urwsloChueN4X5stLXECD1sdXoqQQnUWA0p0so9+LpTaHPHtVJQC5q2yil4L0QWx1CKTOfhu6SOGsSJ/Hp9627erBWa2OWmzFftlkcA9iTbLUncbr7Pbql9UQau+HHGx7CIWPGi2sfgB8CE3JkIGwZ2bd8izqcO5SMBI4BUUfyncKPkruKmhnA1QCJdsiwp0wbB9cix7ZWSBt5GGXdZAEQy2FM3WeKcsi5uBdSfR7JrgO3fLpKm57INcq9okLUnMsTRHyzTa9SLhW2NpdmyHcU0SvDbATxSTubN8Sew5KlMyHIWAKG9uVcKcOnkfMhkh1CQu1EWtHeIKQsq/KcRNL6eMiBcN/ShKpyOENiCZsDIXEsnoEgtZ/J4I8qsZWgPsNyouPy9l78aSK5r6zZrZD8MMPITSBUIgF/OxdVt3rqmQkSQ+Mi9kSV3t3z58rkjSE3QrorsCMgJj3sCOmPOLH7QvqchxsB8dgjMwJmccscmjCzz443QKfHRvYccb2ZvBb6wbYLBMRjh8wIqUXbIuaSBfPQH3PhhrECNwLCF5g7OsyNYC7iMY9Z8Syl/hAQAZq9m0rPlNwIiJKFfxKdvJSJ/veQf/01LAxOXm1YAAAAAElFTkSuQmCC"
						);
		us.createOrUpdateUser(u1);
		
		return "/users/login";
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest r) {
		System.out.println(((Users) r.getSession().getAttribute("loginUser")).getId());
		r.getSession().removeAttribute("loginUser");
		return "/campsite/00index";
	}

	@ResponseBody
	@GetMapping("/users/api/get/{page}")
	public Page<Users> ajaxG(@PathVariable(name = "page") String page) {
		System.out.println(page);
		return us.getPage(Integer.valueOf(page));
	}

	@ResponseBody
	@PostMapping("/users/api/update")
	public Page<Users> ajax(@RequestBody UsersDTO t) {
		Users u = new Users();
		u.setId(t.getId());
		u.setEmail(t.getEmail());
		u.setPwd(t.getPwd());
		u.setUsername(t.getUsername());
		u.setAuth(t.getAuth());
		u.setPhone(t.getPhone());
		u.setGender(t.getGender());
		u.setBirth(t.getBirth());
		u.setLv(t.getLv());
		u.setImage(t.getImage());
		us.createOrUpdateUser(u);

		return us.getPage(1);
	}

	@GetMapping("/users/getUpdate/{id}")
	public String getUpdateP(@PathVariable(name = "id") String id, Model m) throws ParseException {
		Users u = us.findUserById(Integer.valueOf(id));
//		System.out.println(u.getBirth());
//		
//		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
//		
////		System.out.println(ft.parse(u.getBirth().toString()));
//		u.setBirth(ft.parse(u.getBirth().toString()));

		m.addAttribute("user", u);
		return "/users/getUpdateP";
	}

	@PostMapping("/admin/users/Update")
	public String userUpdate(@RequestParam String id, @RequestParam String email, @RequestParam String pwd,
			@RequestParam String username, @RequestParam Boolean auth, @RequestParam String phone,
			@RequestParam String gender, @RequestParam String birth, @RequestParam String lv,
			@RequestParam String image) {
		Date birth1 = new Date();
		try {
			birth1 = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Users u = new Users();
		u.setId(Integer.valueOf(id));
		u.setEmail(email);
		u.setPwd(pwd);
		u.setUsername(username);
		u.setAuth(auth);
		u.setPhone(phone);
		u.setGender(gender);
		u.setBirth(birth1);
		u.setLv(lv);
		u.setImage(image);

		us.createOrUpdateUser(u);
		return "redirect:/admin/users";
	}
	
	
	@GetMapping("/users/edit")
	public String userEditP(HttpServletRequest r) {
		Users u = (Users) r.getSession().getAttribute("loginUser");
		Users u1 = us.findUserById(u.getId());
		r.getSession().setAttribute("loginUser", u1);
		return "/users/editUser";
	}
	
	@PostMapping("/users/editUser")
	public String userEdit(@RequestParam String email, 
			@RequestParam String username, @RequestParam String phone,
			@RequestParam String gender, @RequestParam String birth,
			@RequestParam String image, HttpServletRequest r) {
		Date birth1 = new Date();
		try {
			birth1 = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Users u = (Users) r.getSession().getAttribute("loginUser");
		u.setEmail(email);
		u.setUsername(username);
		u.setPhone(phone);
		u.setGender(gender);
		u.setBirth(birth1);
		u.setImage(image);

		us.createOrUpdateUser(u);
		return "redirect:/index";
	}
	
	@PostMapping("/admin/users/delete")
	public String userDelete(@RequestParam String id) {

		us.deleteUserById(Integer.valueOf(id));
		return "redirect:/admin/users";
	}

	@PostMapping("/admin/users/create")
	public String userCreate(@RequestParam String email, @RequestParam String pwd, @RequestParam String username,
			@RequestParam Boolean auth, @RequestParam String phone, @RequestParam String gender,
			@RequestParam String birth, @RequestParam String lv, @RequestParam String image) {

		Date birth1 = new Date();
		try {
			birth1 = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Users u = new Users();
//		u.setId(Integer.valueOf(id));
		u.setEmail(email);
		u.setPwd(pwd);
		u.setUsername(username);
		u.setAuth(auth);
		u.setPhone(phone);
		u.setGender(gender);
		u.setBirth(birth1);
		u.setLv(lv);
		u.setImage(image);

		us.createOrUpdateUser(u);
		return "redirect:/admin/users";
	}

	@GetMapping("uesrs/activateMail")
	public String emailVerify(@RequestParam String emailToken) {

		Users u = new Users();
		u.setEmail(emailToken);
		u = us.userVerify(u);
		if (u != null) {
			u.setAuth(true);
		}
		us.createOrUpdateUser(u);
		return ("redirect:/loginPage");
	}
	
	@GetMapping("uesrs/resetP")
	public String emailReset(@RequestParam String emailToken,  HttpServletRequest r) {
		
		Users u = new Users();
		u.setEmail(emailToken);
		u = us.userVerify(u);
		if (u != null) {
			r.getSession().setAttribute("resetEmail", emailToken);
			return "users/resetP";
		}

		return "/users/login";
	}
	
	@PostMapping("reset")
	public String Reset(@RequestParam String pwd,  HttpServletRequest r) {
		String e = (String) r.getSession().getAttribute("resetEmail");
		Users u = new Users();
		u.setEmail(e);
		u = us.userVerify(u);
		u.setPwd(pwd);
		us.createOrUpdateUser(u);
//		r.getSession().setAttribute("userError", "password changed");
		return "redirect:/loginPage";
	}
	
}
