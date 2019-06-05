package pers.wmx.learningcenter.service;

import pers.wmx.learningcenter.domain.Activity;

import java.util.List;

public interface ActivityService {
    int addActivity(Activity activity);

    List<Activity> findActivityList(Integer userId);

    int deleteById(int curId);

    int updateActivity(Activity activity);

    Activity findById(Integer id);

    int takeActivity(Integer id, Integer userId);

    List<Integer> findUsersById(Integer id);
}
