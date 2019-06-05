package pers.wmx.learningcenter.utils;

import org.joda.time.DateTime;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: wang ming xin
 * @create: 2019-04-10 10:16
 */
public class TimeUtil {

    //给一个起始时间和结束时间，生成之间的所有时间
    public static List<DateTime> getDateRange(DateTime start, DateTime end) {
        List<DateTime> ret = new ArrayList<DateTime>();
        DateTime tmp = start;
        while(tmp.isBefore(end) || tmp.equals(end)) {
            ret.add(tmp);
            tmp = tmp.plusDays(1);
        }
        return ret;
    }

    public static Date nDays(Date start, int n) {
        DateTime startTime = new DateTime(start);
        DateTime ret =  startTime.plusDays(n);
        return ret.toDate();
    }


}
