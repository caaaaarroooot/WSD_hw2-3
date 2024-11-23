package org.example.hw22;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import org.example.hw22.bean.PlayerVO;
import org.example.hw22.dao.PlayerDAO;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public PlayerVO uploadFile(HttpServletRequest request) throws IOException {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024; // 파일 최대 용량 지정
        int cnt = 1;

        // 실제 업로드 디렉토리 경로
        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if (!dir.exists()) {
            dir.mkdirs(); // 디렉토리가 없으면 생성
        }

        PlayerVO one = new PlayerVO();  // PlayerVO 객체를 새로 생성하여 초기화

        try {
            // MultipartRequest 객체 생성 (파일 업로드 처리)
            MultipartRequest multipartRequest = new MultipartRequest(
                    request,
                    realPath,               // 파일 업로드 경로
                    sizeLimit,              // 파일 최대 크기
                    "UTF-8",                // 문자 인코딩
                    new DefaultFileRenamePolicy() // 중복 파일명 처리 정책
            );

            // 폼 데이터 추출
            one.setName(multipartRequest.getParameter("name"));
            one.setBirthyear(multipartRequest.getParameter("birthyear"));
            one.setClub(multipartRequest.getParameter("club"));
            one.setCountry(multipartRequest.getParameter("country"));
            one.setPosition(multipartRequest.getParameter("position"));
            one.setMainfoot(multipartRequest.getParameter("mainfoot"));

            // 파일 이름 추출
            File uploadedFile = multipartRequest.getFile("photo");
            System.out.println("uf: "+uploadedFile);
            if (uploadedFile != null) {
                filename = uploadedFile.getName();
            } else{
                System.out.println("exFilename: "+multipartRequest.getParameter("existingFilename"));
                filename = multipartRequest.getParameter("existingFilename");
                System.out.println(one.getFilename());
                cnt = 0;
            }

            // sid 값 확인 및 업데이트 로직
            String sid = multipartRequest.getParameter("sid");
            if (sid != null && !sid.equals("") && cnt == 1) {
                one.setId(Integer.parseInt(sid)); // 반드시 id 설정
                // 기존 파일 정보 가져오기
                PlayerDAO dao = new PlayerDAO();
                String oldFilename = dao.getPhotoFilename(one.getId());

                // 기존 파일 삭제 로직
                if (filename != null && oldFilename != null) {
                    deleteFile(request, oldFilename);
                } else if (filename == null && oldFilename != null) {
                    filename = oldFilename; // 기존 파일명을 유지
                }
            }


            one.setFilename(filename);  // 파일 이름 설정

        } catch (IOException e) {
            e.printStackTrace();
        }

        return one;
    }

    public static void deleteFile(HttpServletRequest request, String filename) {
        // 파일 삭제 로직 구현
        String realPath = request.getServletContext().getRealPath("upload");
        File file = new File(realPath, filename);
        if (file.exists()) {
            file.delete(); // 파일 삭제
        }
    }
}
