package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.dto.Styles;
import com.mycompany.viewport_mini_web.dto.Users;
import com.mycompany.viewport_mini_web.service.PagerService;
import com.mycompany.viewport_mini_web.service.ProductService;
import com.mycompany.viewport_mini_web.service.StylesService;
import com.mycompany.viewport_mini_web.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/styles")
public class StylesController {
	@Autowired
	private StylesService stylesService;
	@Autowired
	private PagerService pagerService;
	@Autowired
	private ProductService productService;
	@Autowired
	private UserService userService;

	@GetMapping("")
	public String stylesPage(@RequestParam(required = false, defaultValue="1") String pageNo, Model model, HttpSession session) {
		int totalRows = stylesService.getStylesTotalRows(); // 전체 수를 가져옵니다.
		Pager pager = pagerService.preparePager(session, pageNo, totalRows, 12, 5,"stylesListPager"); // 페이지당 행 수 12, 그룹당 페이지 수 5
		log.info(pager.toString());
		List<Styles> styles = stylesService.getStylesListByPager(pager);
		List<Product> products = productService.getProductList();

		model.addAttribute("pager", pager);
		model.addAttribute("products", products);
		model.addAttribute("styles", styles);

		return "styles/styles";
	}

	@PostMapping("/createStyles")
	public String createStyles(Styles styles, int stylesPnum, Authentication authentication,
			RedirectAttributes redirectAttributes) throws IOException {
		log.info("styles 실행");

		if (authentication == null) {
			redirectAttributes.addFlashAttribute("errorMessage", "로그인을 필요합니다.");
			return "redirect:/loginForm";
		}

		String uemail = authentication.getName();
		Users user = userService.getUser(uemail);
		log.info(stylesPnum + "");
		styles.setStpnum(stylesPnum);
		log.info(styles.getStpnum() + "pnum 값");
		styles.setStattachoname(styles.getStattach().getOriginalFilename());
		styles.setStattachtype(styles.getStattach().getContentType());
		byte[] stylesData = styles.getStattach().getBytes();
		log.info("" + styles.getStattach().getContentType());

		styles.setStattachsname(UUID.randomUUID().toString() + "-" + styles.getStattach().getOriginalFilename());
		;
		styles.setStattachdata(stylesData);

		stylesService.createStyles(styles, uemail);
		return "redirect:/styles";
	}

	@GetMapping("/attachStylesDownload")
	public void stylesList(HttpServletResponse response, int stid) throws IOException {
		// 스타일즈 데이터 생성
		Styles styles = stylesService.getStyles(stid);
		byte[] data = styles.getStattachdata();
		response.setContentType(styles.getStattachtype());
		String fileName = new String(styles.getStattachsname());
		fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
		OutputStream os = response.getOutputStream();
		os.write(data);
		os.flush();
		os.close();
	}

	@GetMapping("/getStyleDetails")
	public String getStyleDetails(@RequestParam("stid") int stid, @RequestParam("stpnum") int stpnum, @RequestParam("stuserid") int stuserid, Model model) {
		Product product = productService.getProduct(stpnum);
		Styles style = stylesService.getStyles(stid);
		String uemail = userService.getUserByStuserId(stuserid);
		
		model.addAttribute("product", product);
		model.addAttribute("style", style);
		model.addAttribute("uemail", uemail);
		return "styles/stylesModal";
	}

}
