package com.spring.shopping.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.shopping.model.Category;
import com.spring.shopping.model.Product;
import com.spring.shopping.model.UploadForm;
import com.spring.shopping.service.AdminManageProductService;
import com.spring.shopping.service.ProductConfigService;
import com.spring.shopping.util.AmazonFileUploadUtility;

@Controller
public class AdminManageProductController {
	@Autowired
	ServletContext servletContext;
	@Autowired
	private AdminManageProductService adminManageProductService;
	@Autowired
	private ProductConfigService productConfigService;
	
	private String manageProduct = "template/manageProduct";
	private String viewProducts = "template/viewProducts";
	private String editProducts = "template/editProduct";
	
	@RequestMapping(value = "/manageProduct", method = RequestMethod.GET)
	public String viewDetails(Model model, @RequestParam(value = "type") String type,HttpServletRequest request) {
		List<Category> CategoryList = adminManageProductService
				.getAllCategories();
		model.addAttribute("type", type);
		model.addAttribute("CategoryList", CategoryList);
		return manageProduct;
	}
	
	
	@RequestMapping(value="/fetchSubCategories", method=RequestMethod.GET ,produces="application/json")
	public @ResponseBody List<String> fetchSubCategories(@RequestParam(value = "Category", required = true) String CategoryName,
			HttpServletRequest req,
			HttpServletResponse resp) {
		System.out.println("chekicng fetchSubCategories controller"+CategoryName);
		return adminManageProductService.fetchSubCategories(CategoryName);
	}
	
	@RequestMapping(value = "/insertnewproduct", method = RequestMethod.POST,headers ="content-type=multipart/form-data")
	public String insertnewproduct(
			@RequestParam(value = "categoryName", required = true) String categoryName,
			@RequestParam(value = "subCategoryName", required = true) String subCategoryName,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "price", required = true) Double price,
			@RequestParam(value = "available", required = true) Integer available,
			@RequestParam(value = "description", required = true) String description,
			@RequestParam(value = "type", required = true) String type,
			@ModelAttribute UploadForm form,
			@RequestParam("files") MultipartFile sfile,
			RedirectAttributes redir, HttpServletRequest request) throws IOException, ServletException {
		System.out.println("categoryName"+categoryName+"subCategoryName"+subCategoryName+"name"+name+"price"+price+"description"+description+"type"+type);
		Product p=new Product();
		p.setName(name);
		p.setPrice(price);
		p.setDescription(description);
		p.setAvailable(available);
		Long productId=	adminManageProductService.insertNewProduct(categoryName,subCategoryName,p,type);
		/*String filename=AmazonFileUploadUtility.fileUpload(sfile,productId);
		System.out.println("chekicng "+filename);
		List<MultipartFile> files=new ArrayList<MultipartFile>();
		for (MultipartFile file : form.getFiles()) {

            if (file.isEmpty()) {
                continue; //next pls
            }else{
            System.out.println("chekicng file name"+file.getOriginalFilename());
            files.add(file);
            String fileName = file.getOriginalFilename();
            int index = fileName.lastIndexOf('.');
            String lastString = (fileName.substring(index + 1));
            String productname=productId+"."+lastString;
            System.out.println("chekicng file name"+productname);
            String relativeWebPath = "E:/springs/SpringHibernateShopping/src/main/webapp/resources/images/home/"+ productname;
            System.out.println("relativeWebPath"+relativeWebPath);
            
            File imageFile = new File(relativeWebPath);
            
           
            try {
				file.transferTo(imageFile);
				System.out.println("chekcing nect mee");
				System.out.println(imageFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            
            }
            
		} */
		return "redirect:home";

	}

	@RequestMapping(value = "/insertcategory", method = RequestMethod.POST)
	public String insertCategory(Model model, 
			@RequestParam(value = "categoryName", required = true) String categoryName,
			HttpServletRequest request) {
		Long categoryId=adminManageProductService.insertNewCategory(categoryName);
		
		return "redirect:/manageProduct?type=NA";
	}
	    // Here, you can save the product details in database
	
	@RequestMapping(value = "/viewProductsinfo", method = RequestMethod.GET)
	public String viewCart(Model model, HttpServletRequest request) {
		System.out.println("chekicng vie wproducstss");
		List<Product> productsList =productConfigService.getAllProducts();
		System.out.println("productsList size in vie wprosutcss"+productsList.size());
		model.addAttribute("productsList", productsList);
		return viewProducts;
	}

	@RequestMapping(value ="/productedit", method = RequestMethod.GET)
	public String manageProductEdit(@RequestParam(value = "productId", required = true) Long id,Model model) {
		System.out.println("productedit"+id);
		Object productinfo=productConfigService.getAllProductInfoById(id);
		
		model.addAttribute("productinfo", productinfo);
		return editProducts;	
		
	}
	
	@RequestMapping(value = "/editexistingproduct",method = RequestMethod.POST)
	public String manageProductEdit(Model model, 
			@RequestParam(value = "productId") Long productId,
			@RequestParam(value = "categoryId") Long categoryId,
			@RequestParam(value = "subcategoryId") Long subcategoryId,
			@RequestParam(value = "featured") Integer featured,
			@RequestParam(value = "name", required = true) String name,
			@RequestParam(value = "manufacturer", required = true) String manufacturer,
			@RequestParam(value = "description", required = true) String description,
			@RequestParam(value = "price", required = true) Double price,
			@RequestParam(value = "available", required = true) Integer quantity,
			@RequestParam(value = "offerPrice", required = true) Double offerPrice,
			@RequestParam(value = "discountPercent", required = true) Double discountPercent,
			@RequestParam(value = "discountAmount", required = true) Double discountAmount,
			HttpServletRequest request) {
		Product p=new Product();
		p.setProductId(productId);
		p.setDescription(description);
		p.setAvailable(quantity);
		p.setPrice(price);
		p.setCategoryId(categoryId);
		p.setSubCategoryId(subcategoryId);
		p.setFeatured(featured);
		p.setName(name);
		p.setManufacturer(manufacturer);
		p.setOfferPrice(offerPrice);
		p.setDiscountPercent(discountPercent);
		p.setDiscountAmount(discountAmount);
		productConfigService.editProductInformation(p);
		
		model.addAttribute("productinfo", p);
		return "redirect:/viewProductsinfo";
		
	}
	
	 
}
