package moo;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

import org.apache.commons.io.FileUtils;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.intuit.karate.cucumber.CucumberRunner;
import com.intuit.karate.cucumber.KarateStats;

import cucumber.api.CucumberOptions;

/**
 * 
 * @author mkoduri
 *
 * This class is configured in POM.
 * 
 * When you run project using POM then, it should look for this class.
 * 
 * The tag argument in the below @CucumberOptions is automatically ignored for, because we have mentioned it in POM under <cucumber.options>. 
 * 
 * As project grows it is viable to have multiple test runner classes that focusing bunch of scenarios.
 * 
 * 
 */
@CucumberOptions(features = "classpath:moo/users") 
public class TestRunner {

	
	    @BeforeClass
	    public static void beforeClass() throws Exception {    	
	    	// no use for now.
	    }

	    @AfterClass
	    public static void afterClass() {
	      //  TestBase.afterClass(); no use for now.
	    }

	    @Test
	    public void testParallel() {
	        String karateOutputPath = "target/surefire-reports";
	        KarateStats stats = CucumberRunner.parallel(getClass(), 1, karateOutputPath);
	        generateReport(karateOutputPath);
	        assertTrue("there are scenario failures", stats.getFailCount() == 0);
	    }

	    private static void generateReport(String karateOutputPath) {
	        Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
	        List<String> jsonPaths = new ArrayList(jsonFiles.size());
	        for (File file : jsonFiles) {
	            jsonPaths.add(file.getAbsolutePath());
	        }
	        Configuration config = new Configuration(new File("target"), "JSON PLACE HOLDER API Tests");
	        ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
	        reportBuilder.generateReports();
	    }
}
