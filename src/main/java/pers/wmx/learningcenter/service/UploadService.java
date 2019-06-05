package pers.wmx.learningcenter.service;

import org.csource.common.MyException;
import org.csource.fastdfs.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * @author: wang ming xin
 * @create: 2019-04-09 20:24
 */

@Service
public class UploadService {

    static {
        try {
            //加载FastDFS配置文件
            ClientGlobal.initByProperties("config/fastdfs-client.properties");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MyException e) {
            e.printStackTrace();
        }
    }

    public String uploadDFS(MultipartFile file) throws IOException, MyException {
        //创建TrackerClient
        TrackerClient trackerClient = new TrackerClient();

        //连接tracker
        TrackerServer trackerServer = trackerClient.getConnection();

        //获取storage
        StorageServer storageServer = trackerClient.getStoreStorage(trackerServer);

        //创建TrackerClient
        StorageClient1 storageClient1 = new StorageClient1(trackerServer,storageServer);

        byte[] bytes = file.getBytes();
        //文件名
        String fileName = file.getOriginalFilename();
        //文件扩展名
        String extName = fileName.substring(fileName.lastIndexOf(".") + 1);

        //上传文件
        String fileId = storageClient1.upload_file1(bytes, extName, null);  //上传成功后得到的id

        System.out.println("fileId : "+fileId);

        return fileId;

    }

}
