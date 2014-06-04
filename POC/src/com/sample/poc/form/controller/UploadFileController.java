package com.sample.poc.form.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.DefaultMultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sample.poc.form.UploadItem;

@Controller
public class UploadFileController {
	private String uploadFolderPath;
	ServletConfig config;

	public String getUploadFolderPath() {
		return uploadFolderPath;
	}

	public void setUploadFolderPath(String uploadFolderPath) {
		this.uploadFolderPath = uploadFolderPath;
	}

	@RequestMapping(value = "/uploadfile", method = RequestMethod.GET)
	public String getUploadForm(Model model) {
		String tempdir = System.getProperty("java.io.tmpdir");
		if (!tempdir.endsWith(File.separator)) {
			tempdir = tempdir + File.separator;
		}
		File file=new File(tempdir+"upload\\");
		if(file.mkdir()){
			System.out.println("Directory is created!");
		}
		model.addAttribute(new UploadItem());
		return "uploadfile";
	}

	@RequestMapping(value = "/uploadfile", method = RequestMethod.POST)
	public ModelAndView create(UploadItem uploadItem, BindingResult result, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView modelAndView=new ModelAndView();
		List<String> files=new ArrayList<String>();
		if (result.hasErrors()) {
			for (ObjectError error : result.getAllErrors()) {
				System.err.println("Error: " + error.getCode() + " - " + error.getDefaultMessage());
			}
			modelAndView.setViewName("uploadfile");
			return modelAndView;
		}

		try {
			MultipartFile file = uploadItem.getFileData();
			String fileName = null;
			InputStream inputStream = null;
			OutputStream outputStream = null;
			if (file.getSize() > 0) {
				inputStream = file.getInputStream();
				if (file.getSize() > 10000) {
					System.out.println("File Size:::" + file.getSize());
					modelAndView.setViewName("uploadfile");
					return modelAndView;
				}
				System.out.println("size::" + file.getSize());
				
				String tempdir = System.getProperty("java.io.tmpdir");
				if (!tempdir.endsWith(File.separator)) {
					tempdir = tempdir + File.separator;
				}
				tempdir+="upload\\";
				
				fileName = tempdir + file.getOriginalFilename();
				outputStream = new FileOutputStream(fileName);
				System.out.println("fileName:" + file.getOriginalFilename());

				int readBytes = 0;
				byte[] buffer = new byte[10000];
				while ((readBytes = inputStream.read(buffer, 0, 10000)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();
			}
			files.add(file.getOriginalFilename());
			modelAndView.addObject("files", files);
			modelAndView.setViewName("indexFile");
			return modelAndView;			
		} catch (Exception e) {
			e.printStackTrace();
		}
		modelAndView.setViewName("uploadfile");
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/multipleUpload", method = RequestMethod.GET)
	public String getUploadMultipleForm(Model model) {
		String tempdir = System.getProperty("java.io.tmpdir");
		if (!tempdir.endsWith(File.separator)) {
			tempdir = tempdir + File.separator;
		}
		File file=new File(tempdir+"upload\\");
		if(file.mkdir()){
			System.out.println("Directory is created!");
		}
		return "multipleUpload";
	}
	
	@RequestMapping(value = "/multipleUpload", method = RequestMethod.POST)
	@ResponseBody()
	public ServletOutputStream uploadImage(HttpServletRequest request, HttpServletResponse response) {
		try{
			String fileName = null;
			InputStream inputStream=null;
			OutputStream outputStream = null;
			if (isMultipartContent(request)) {
				
				DefaultMultipartHttpServletRequest multipartHttpServletRequest=(DefaultMultipartHttpServletRequest)request;
				
				MultipartFile multipartFile= multipartHttpServletRequest.getFileMap().get("qqfile");
				inputStream=multipartFile.getInputStream();
				fileName=multipartFile.getOriginalFilename();
				
			}else{
				inputStream = request.getInputStream();
				fileName=request.getParameter("qqfile");
				
			}
				//System.out.println("size::" + file.getSize());
				
				String tempdir = System.getProperty("java.io.tmpdir");
				if (!tempdir.endsWith(File.separator)) {
					tempdir = tempdir + File.separator;
				}
				tempdir+="upload\\";
				
				fileName = tempdir + fileName;
				outputStream = new FileOutputStream(fileName);
				//System.out.println("fileName:" + file.getOriginalFilename());

				int readBytes = 0;
				byte[] buffer = new byte[10000];
				while ((readBytes = inputStream.read(buffer, 0, 10000)) != -1) {
					outputStream.write(buffer, 0, readBytes);
				}
				outputStream.close();
				inputStream.close();
				response.setContentType("text/html");
				response.getWriter().write("{success:true}");
			return response.getOutputStream();	
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
	
	/*private  createMultipartRequest(HttpServletRequest req) throws IOException {
		JakartaMultiPartRequest jak = new JakartaMultiPartRequest();
		long maxSize=getUser().getMaxUploadFileSize()*1024*1024;
		jak.setMaxSize(maxSize+"");
		return new MultiPartRequestWrapper(jak, req, qqfile);
	}
*/
	
	
	/**
	 * Utility method that determines whether the request contains multipart
	 * content.
	 *
	 * Extract from commons-fileupload source.
	 *
	 * @param request
	 *            The servlet request to be evaluated. Must be non-null.
	 *
	 * @return <code>true</code> if the request is multipart; <code>false</code>
	 *         otherwise.
	 */
	public static final boolean isMultipartContent(HttpServletRequest request) {
		if (!"post".equals(request.getMethod().toLowerCase())) {
			return false;
		}
		String contentType = request.getContentType();
		if (contentType == null) {
			return false;
		}
		if (contentType.toLowerCase().startsWith("multipart/")) {
			return true;
		}
		return false;
	}
	
	
}
