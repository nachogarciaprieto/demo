package eu.vptech.demo.runners.pet;

import com.privalia.qa.utils.BaseGTest;
import io.cucumber.testng.CucumberOptions;


/**
 * This is the runner class responsible of running the included *.feature files in the project.
 * Glue files can be specified in the {@link CucumberOptions} annotation
 *
 * Here you can also create your own TestNG hooks or even configure parallel tests execution.
 * For more info on these topics check:
 * https://testng.org/doc/documentation-main.html#annotations
 * https://cucumber.io/docs/guides/parallel-execution/#testng
 */
@CucumberOptions(plugin = {
                "json:target/GetAllPetApi.json",
                "html:target/GetAllPetApi.html",
                "junit:target/GetAllPetApi.xml"
        }, features =
        {
                "src/test/resources/features/pet/get_all_pet_api.feature"
        },
        glue = "classpath:eu.vptech.demo.glue")
public class GetAllPetApi extends BaseGTest {


}
