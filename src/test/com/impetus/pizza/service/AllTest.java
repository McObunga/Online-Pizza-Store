package test.com.impetus.pizza.service;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

/**
 * The Class AllTest.
 */
@ContextConfiguration(locations = {"file:src/test/com/impetus/pizza/service/application-context.xml"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager")
@RunWith(Suite.class)
@Suite.SuiteClasses({
        IngredientServiceImplTest.class,
        ProductServiceImplTest.class,
        SchemeServiceTest.class,
        UserinfoDAOImplTest.class,
        UserinfoServiceImplTest.class})

public class AllTest {

}


