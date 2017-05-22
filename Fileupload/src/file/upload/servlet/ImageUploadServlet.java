package file.upload.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import file.upload.vo.ImgUploadVO;

public class ImageUploadServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext ctx= getServletContext();
		//String imageDir = ctx.getRealPath("/up_images");//up_images의 실제파일경로를 리턴-> 업로드된 파일(이미지)을 저장할 디렉토리
		//String temDir = ctx.getInitParameter("tempdir");//업로드된 파일을 저장할 임시디렉토리
		
		//1.DiskFileItemFactory 객체를 생성 - 임시저장소 정보 설정
		//DiskFileItemFactory factory = new DiskFileItemFactory(1024*1024,new File(temDir));//1mb
		//2. ServletFileupload 객체 생성 - DiskFileItemFactory객체를 전달.
		ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory(1024*1024,new File(ctx.getInitParameter("tempdir"))));
		
		ImgUploadVO vo = new ImgUploadVO();
		List<String> imageName = new ArrayList<>();
		
		try{
			//3. 요청파라미터 조회작업
			List <FileItem> list = upload.parseRequest(request);
			for(FileItem item:list){
				
				String reqName = item.getFieldName();//이름은 다 문자열이니까 
				
				if(item.isFormField()){//일반 요청파라미터(String)
					String reqValue = item.getString("utf-8");//한글이 있을때는 utf-8로 인코딩 설정해줘야함
					
					if(reqName.equals("uploader")){
						vo.setUploader(reqValue);
					}else if(reqName.equals("comment")){
						vo.setComment(reqValue);
					}
					
				}else{//파일 요청 파라미터(input type = "file"
					
					//업로드된 파일명조회
					String fileName = item.getName();
					fileName = UUID.randomUUID().toString();//중복되지 않는 문자열을 만들어서 파일명으로 쓴다.
					
					//업로드된 파일이 있는지 체크 - getSize():long - 업로드된 파일의 크기(byte)
					if(item.getSize()!=0){
						//1.임시경로의 파일을 최종경로로 이동
						item.write(new File(ctx.getRealPath("/up_images"),fileName)); 
						//2.임시경로의 파일을 삭제
						item.delete();
						imageName.add(fileName);	
					}		
				}
			}//for
			vo.setImageNames(imageName);
			
			//-> model call, do business logic
			request.setAttribute("result", vo);
			//응답처리
			request.getRequestDispatcher("/upload_result.jsp").forward(request, response);
			
		}catch(Exception e){
			e.printStackTrace();
			throw new ServletException(e);//예외처리를 톰캣에게 맡긴다.
		}
		
	
	}
}







