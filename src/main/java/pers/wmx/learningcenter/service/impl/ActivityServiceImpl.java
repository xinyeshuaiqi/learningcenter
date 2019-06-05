package pers.wmx.learningcenter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.wmx.learningcenter.dao.ActivityDao;
import pers.wmx.learningcenter.domain.Activity;
import pers.wmx.learningcenter.service.ActivityService;

import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-12 17:57
 */

@Service
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    ActivityDao activityDao;

    @Override
    public int addActivity(Activity activity) {
        return activityDao.add(activity);
    }

    @Override
    public List<Activity> findActivityList(Integer userId) {
        return activityDao.findActivityList(userId);
    }

    @Override
    public int deleteById(int curId) {
        return activityDao.deleteById(curId);
    }

    @Override
    public int updateActivity(Activity activity) {
        return activityDao.updateActivity(activity);
    }

    @Override
    public Activity findById(Integer id) {
        return activityDao.findById(id);
    }

    @Override
    public int takeActivity(Integer id, Integer userId) {
        return activityDao.takeActivity(id,userId);
    }

    @Override
    public List<Integer> findUsersById(Integer id) {
        return activityDao.findUsersById(id);
    }
}
