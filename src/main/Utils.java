package main;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.DayOfWeek;
import java.time.LocalDate;

public final class Utils {

    public static LocalDate findAppropriateDay(LocalDate date) {
        DayOfWeek day;
        while (true) {
            day = date.getDayOfWeek();
            if (day == DayOfWeek.SATURDAY || day == DayOfWeek.SUNDAY)
                date = date.minusDays(1);
            else break;
        }
        return date;
    }

    public static String bigDecimalToString(BigDecimal bigDecimal) {
        return String.valueOf(bigDecimal.setScale(2, RoundingMode.HALF_UP));
    }
}
