package com.mycompany.viewport_mini_web.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.mycompany.viewport_mini_web.dto.Pager;
import com.mycompany.viewport_mini_web.dto.Photos;
import com.mycompany.viewport_mini_web.dto.Product;
import com.mycompany.viewport_mini_web.service.PagerService;
import com.mycompany.viewport_mini_web.service.ProductService;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/products")
public class ProductsListController {
  @Autowired
  private ProductService productService;
  @Autowired
  private PagerService pagerService;

  @GetMapping("/productsList")
    public String getProductsList(@RequestParam(required = false) String pageNo,
                                  @RequestParam(required = false) String category, 
                                  @RequestParam(required = false) String price,
                                  @RequestParam(required = false) String date, 
                                  @RequestParam(required = false) String shape, 
                                  Model model,
                                  HttpSession session) {

        List<Product> products;
        Pager pager;
        int totalRows;

        if (category != null || price != null || date != null || shape != null) {
            totalRows = productService.getProductTotalRowsByFilter(category, price, date, shape); // 전체 수
            pager = pagerService.preparePager(session, pageNo, totalRows, 9, 5, "productFilteredListPager"); // 페이지당 행 수 9, 그룹당 페이지 수 5
            products = productService.getProductsByFilterAndPager(category, price, date, shape, pager);
        } else {
            totalRows = productService.getProductTotalRows(); // 전체 수
            pager = pagerService.preparePager(session, pageNo, totalRows, 9, 5, "productListPager"); // 페이지당 행 수 9, 그룹당 페이지 수 5
            products = productService.getProductListByPager(pager);
        }
        log.info(products.size()+"");
        model.addAttribute("pager", pager);
        model.addAttribute("products", products);
        model.addAttribute("category", category);
        model.addAttribute("price", price);
        model.addAttribute("date", date);
        model.addAttribute("shape", shape);
        return "products/productsList";
    }

  @GetMapping("/attachProductDownload")
  public void productsList(HttpServletResponse response, int pid) throws IOException {
    // 상품 데이터 생성
    Product product = productService.getProduct(pid);
    byte[] data = product.getPattachdata();
    response.setContentType(product.getPattachtype());
    String fileName = new String(product.getPattachsname());
    fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }

  @GetMapping("/attachPhotosDownload")
  public void photosList(HttpServletResponse response, int ptid) throws IOException {
    // 상품 데이터 생성
    log.info(ptid + "");
    Photos photos = productService.getPhotosByPtid(ptid);
    log.info(photos.getPtattachoname());
    byte[] data = photos.getPtattachdata();
    response.setContentType(photos.getPtattachtype());
    String fileName = new String(photos.getPtattachsname());
    fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
    response.setHeader("content-Disposition", "attachment; filename=\"" + fileName + "\"");
    OutputStream os = response.getOutputStream();
    os.write(data);
    os.flush();
    os.close();
  }

  @GetMapping("/productDetail")
  public String productDetail(int pid, Model model) {
    log.info("productDetail() 실행");

    Product product = productService.getProduct(pid);
    List<Photos> photos = productService.getPhotos(pid);
    List<Integer> ptids = productService.getPtids(product.getPid());
    List<Product> sameModels = productService.getSameModels(product.getPname());

    model.addAttribute("product", product);
    model.addAttribute("photos", photos);
    model.addAttribute("ptids", ptids);
    model.addAttribute("sameModels", sameModels);
    return "products/productDetail";
  }
}
