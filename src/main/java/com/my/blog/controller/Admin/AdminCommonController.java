package com.my.blog.controller.Admin;

import com.my.blog.common.Resp.RetResponse;
import com.my.blog.common.Resp.RetResult;
import com.my.blog.common.upload.MyCommon;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.util.ResourceUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.util.*;

@Controller
public class AdminCommonController {
    @Value("${file.uploadFolder}")
    private String uploadFolder;
    private String staticAccessPath = "/static/upload/img/";

    /*上传单张图片*/
    @ResponseBody
    @RequestMapping(path = "/upload-file")
    public RetResult Upload(MultipartFile file, HttpServletRequest request) throws FileNotFoundException {
        try{
            String domain = MyCommon.domain(request);
            String basePath = ResourceUtils.getURL("classpath:").getPath();
            String fileStr = MyCommon.inputUploadFile(file, uploadFolder);
            JSONObject result = new JSONObject();
            if(StringUtils.isEmpty(fileStr) || fileStr.equals("NOT_IMAGE")){
                return RetResponse.makeRsp(123,"请上传图片--"+fileStr);
            }
            System.out.println("basePath:"+basePath);
            //if (fileStr.equals("NOT_IMAGE")) {
            //    result.put("msg", "上传失败");
            //    result.put("data", fileStr);
            //    result.put("status", 301);
            //} else {
            //    result.put("msg", "上传成功");
            //    result.put("data", domain +this.staticAccessPath + fileStr);
            //    result.put("status", 200);
            //}
            result.put("msg", "上传成功");
            result.put("data", domain +this.staticAccessPath + fileStr);
            result.put("status", 200);

            String url = domain +this.staticAccessPath + fileStr;
            Map<String,String> map=new HashMap<>();
            map.put("url", url);
            return RetResponse.makeRsp(0,"ok",map);
        }catch (Exception e){
            System.out.println(e.getMessage());
            return RetResponse.makeRsp(223,"上传图片失败！");
        }
    }

    /**上传多张图片**/
    //source:https://www.cnblogs.com/zhizou/p/11069498.html
    @ResponseBody
    @PostMapping(path = "/upload-more-img")
    public RetResult uploadImg(@RequestParam("file") List<MultipartFile> files, HttpServletRequest request) throws FileNotFoundException {
        String domain = MyCommon.domain(request);
        String basePath = ResourceUtils.getURL("classpath:").getPath();
        //List<String> filesStr = MyCommon.inputUploadFiles(files, saveImgPath);
        List<String> filesStr = MyCommon.inputUploadFiles(files, staticAccessPath);
        System.out.println("basePath:"+basePath);

        //dataJson = new JSONObject();
        //Object dataJson = new JSONObject();
        //if (filesStr.size() < 1) {
        //    dataJson.put("msg", "上传失败");
        //    dataJson.put("data", filesStr);
        //    dataJson.put("status", 301);
        //} else {
        //    dataJson.put("msg", "上传成功");
        //    dataJson.put("data", filesStr);
        //    dataJson.put("status", 200);
        //}

        //Map<String,String> map=new HashMap<>();
        //map.put("url", filesStr);
        //return dataJson.toJSONString();
        List<String> listFile = new ArrayList<>();
        for (String file : filesStr) {
            listFile.add(domain +this.staticAccessPath + file);
        }
        return RetResponse.makeRsp(0,"ok",listFile);
    }

}
