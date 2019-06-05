package pers.wmx.learningcenter.service;

import org.csource.common.MyException;
import org.csource.fastdfs.*;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * @author: wang ming xin
 * @create: 2019-05-13 18:07
 */
@Service
public class DownloadService {

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

    public void downloadDFS(String filePath) throws IOException, MyException {
        //创建TrackerClient
        TrackerClient trackerClient = new TrackerClient();

        //连接tracker
        TrackerServer trackerServer = trackerClient.getConnection();

        //获取storage
        StorageServer storageServer = trackerClient.getStoreStorage(trackerServer);

        //创建TrackerClient
        StorageClient1 storageClient1 = new StorageClient1(trackerServer,storageServer);

        byte[] bytes = storageClient1.download_file1(filePath);

        String[] filePath_split = filePath.split("\\/");
        String filename = filePath_split[filePath_split.length-1];

        File file = new File("d:/"+filename);
        file.createNewFile();
        FileOutputStream fileOutputStream = new FileOutputStream(file);
        fileOutputStream.write(bytes);

    }

}
