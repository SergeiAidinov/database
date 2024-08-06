package test;

import main.Utils;
import org.junit.jupiter.api.Assertions;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.Month;

class UtilsTest {

    @org.junit.jupiter.api.Test
    void findAppropriateDay() {
        Assertions.assertEquals(LocalDate.of(2024, Month.AUGUST, 9), Utils.findAppropriateDay(LocalDate.of(2024, Month.AUGUST, 11)));
        Assertions.assertEquals(LocalDate.of(2024, Month.AUGUST, 6), Utils.findAppropriateDay(LocalDate.of(2024, Month.AUGUST, 6)));
    }

    @org.junit.jupiter.api.Test
    void bigDecimalToString() {
       Assertions.assertEquals("123.45", Utils.bigDecimalToString(new BigDecimal("123.446123")));
       Assertions.assertEquals("123.44", Utils.bigDecimalToString(new BigDecimal("123.443784")));
    }
}