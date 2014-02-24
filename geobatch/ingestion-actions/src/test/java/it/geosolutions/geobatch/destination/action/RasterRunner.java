package it.geosolutions.geobatch.destination.action;

import it.geosolutions.geobatch.destination.datamigration.RasterMigration;
import it.geosolutions.geobatch.destination.rasterize.TargetRasterizeProcess;
import it.geosolutions.geobatch.flow.event.ProgressListenerForwarder;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;

public class RasterRunner {
	public static void main(String[] args) {
		/*ClassLoader classLoader = RasterRunner.class.getClassLoader();

		String shpName = "RP_BU-PRES_C_20131024_02";
		String outputFilePath = "D:\\Develop\\destination\\rasters_out\\RP\\popolazione_residente.tif";
		File configDir = new File("D:\\Develop\\destination\\geobatch_config_dir\\temp\\targetrunner\\");
		File outputDir = new File("D:\\Develop\\destination\\rasters_out");
		File xmlFile = new File("D:\\rasterizeBU.xml");

		//Create rasterizeBU.xml file content
		String xmlSource = "" +
				"<GdalRasterize>" +
				"	<shapefilename>"+shpName+"</shapefilename>" +
				"	<shapefilepath>"+configDir.getAbsolutePath()+"\\"+shpName+"\\</shapefilepath>" +
				"	<baseOutputPath>"+outputDir.getAbsolutePath()+"\\</baseOutputPath>" +
				"	<attributeToNormalize>RESIDENTI</attributeToNormalize>" +
				"</GdalRasterize>";

		try {
			writeXmlConfig(xmlSource,xmlFile);
			TargetRasterizeProcess targetRasterizeProcess = new TargetRasterizeProcess(
					shpName, new ProgressListenerForwarder(null),
					null, null);
			targetRasterizeProcess.execute(configDir,new File(System.getProperty("java.io.tmpdir")),outputDir,xmlFile, null);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		RasterMigration migration = new RasterMigration("ALL", "D:\\Develop\\destination\\rasters_out",
				"D:\\Develop\\destination\\rasters_prod", new ProgressListenerForwarder(null));
        try {
			migration.execute();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		
	}
	
	private static void writeXmlConfig(String xmlSource, File output) throws Exception{
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document doc = builder.parse(new InputSource(new StringReader(xmlSource)));

		// Write the parsed document to an xml file
		TransformerFactory transformerFactory = TransformerFactory.newInstance();
		Transformer transformer = transformerFactory.newTransformer();
		transformer.setOutputProperty(OutputKeys.INDENT, "yes");
		transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
		DOMSource source = new DOMSource(doc);

		StreamResult result =  new StreamResult(output);
		transformer.transform(source, result);
	}
}