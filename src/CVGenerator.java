import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.apache.log4j.Logger;
import org.xml.sax.SAXException;

public final class CVGenerator 
{
	private static final Logger LOGGER = Logger.getLogger(CVGenerator.class);
	
	private Transformer transformer;
	
	FopFactory fopFactory = FopFactory.newInstance();
	
	public static enum Language {russian, ukrainian, french, english, italian};
	public static enum FormatCV {HTML, PDF};
	
	public CVGenerator()
	{
		try{
			this.transformer = TransformerFactory.newInstance().newTransformer(new javax.xml.transform.stream.StreamSource("src/xml/styleStatic.xslt"));
			configureDependingOnRunningOS();
				
		}
		catch(Exception ex){
			ex.printStackTrace();
		}
	}

	private void configureDependingOnRunningOS() throws SAXException,
			IOException {
		final String currentOsName = System.getProperty("os.name").toLowerCase();			
		LOGGER.info("os.name ="+currentOsName);
		//use a configuration file, where Fonts directory path is specified. 
		if (currentOsName.contains("windows")){
			this.fopFactory.setUserConfig(new File("src/fop_Windows.xconf"));
		}
		else if (currentOsName.contains("mac")){
			this.fopFactory.setUserConfig(new File("src/fop_Mac.xconf")); 
		}
		else{
			throw new RuntimeException("The Os "+currentOsName+" is not supported!");
		}
	}
	
	public static void main(final String[] args) throws Exception
	{
		long start = new Date().getTime();
		LOGGER.info("Generation ProffiCV started.");
		
		CVGenerator cvGenerator = new CVGenerator();
		
		cvGenerator.generateHtmlCVForLanguage(Language.russian);
		cvGenerator.generateHtmlCVForLanguage(Language.ukrainian);
		cvGenerator.generateHtmlCVForLanguage(Language.french);
		cvGenerator.generateHtmlCVForLanguage(Language.english);
		cvGenerator.generateHtmlCVForLanguage(Language.italian);
	
		cvGenerator.generateNoAnonymousPdfCV(Language.french);
		cvGenerator.generateNoAnonymousPdfCV(Language.english);
		cvGenerator.generateNoAnonymousPdfCV(Language.russian);
		cvGenerator.generateNoAnonymousPdfCV(Language.ukrainian);
		cvGenerator.generateNoAnonymousPdfCV(Language.italian);
		
		cvGenerator.generateAnonymousPdfCV(Language.french);// anonymous CV only for English & French
	
		LOGGER.info("Generation ProffiCV finished with success!");
		long end = new Date().getTime();
		LOGGER.info("Total processing duration is " + (end - start)/1000 +" seconds.");
	}

	public void generateHtmlCVForLanguage(final Language language) throws Exception 
	{
		final String xmlFileName = "cv_"+language.toString()+".xml";
		final String htmlFileName= "index" + this.getFileSuffixe(language)+".html";
		
		LOGGER.info("Generation of : '"+htmlFileName+"' starting from '"+xmlFileName+"' ...");
		
		this.transformer.transform(
				new javax.xml.transform.stream.StreamSource("src/xml/"+xmlFileName),
				new javax.xml.transform.stream.StreamResult(new FileOutputStream("web/"+htmlFileName))
			);
		
		long fileSize = getFileSize("web/"+htmlFileName);
		LOGGER.info("Generation of'"+htmlFileName+"' (size : "+fileSize+" bytes) finished with success!");
	}
	/**
	 * Generate the anonymous version of CV - without any personal information.
	 * The miscelania section is omitted.
	 * The modification was made after Natalya need to have my non-personalized CV for some projects. 
	 * @param language
	 * @throws Exception
	 */
	public void generateAnonymousPdfCV(final Language language) throws Exception {
		this.generatePdfCV(language, true);
	}
	public void generateNoAnonymousPdfCV(final Language language) throws Exception {
		this.generatePdfCV(language, false);
	}
	
	private void generatePdfCV(final Language language, boolean isAnonym) throws Exception 
	{
		final String xmlFileName = "cv_"+language.toString()+".xml";
		String pdfFileName = "cv_voronetskyy" + this.getFileSuffixe(language)+".pdf";
		String xslFilerelativePath = "src/xml/style-fo.xml";
		String generatedPdfFileName = "web/pdf/"+pdfFileName;
		
		if (isAnonym){
			pdfFileName= "cv_yevgen" + this.getFileSuffixe(language)+".pdf";
			xslFilerelativePath = "src/xml/style-fo-anonyme.xml";
			generatedPdfFileName = "web/pdf/anonymous/"+pdfFileName;
		}
		
		
		
		OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(generatedPdfFileName)));
		
		LOGGER.info("Generation of : '"+pdfFileName+"' starting from '"+xmlFileName+"' ...");
		
		try {
			  // Step 3: Construct fop with desired output format
			  Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);

			  // Step 4: Setup JAXP using identity transformer
			  TransformerFactory factory = TransformerFactory.newInstance();
			  Transformer transformer = factory.newTransformer(new javax.xml.transform.stream.StreamSource(xslFilerelativePath)); // identity transformer
			           
			  // Step 5: Setup input and output for XSLT transformation 
			  // Setup input stream
			  Source src = new StreamSource(new File("src/xml/"+xmlFileName));

			  // Resulting SAX events (the generated FO) must be piped through to FOP
			  Result res = new SAXResult(fop.getDefaultHandler());
			            
			  // Step 6: Start XSLT transformation and FOP processing
			  transformer.transform(src, res);
			  
			  
			} finally {
			  //Clean-up
			  out.close();
			}
		
		long fileSize = getFileSize("web/pdf/"+pdfFileName);
		LOGGER.info("Generation of'"+pdfFileName+"' (size : "+fileSize+" bytes) finished with success!");
	}
	
	private String getFileSuffixe(final Language language)
	{
		switch (language) 
		{
			case russian:
				return "_ru";
			case ukrainian:
				return "_ua";
			case french:
				return "";
			case italian:
				return "_it";
			case english:
				return "_en";
			default:
				throw new IllegalArgumentException("The language "+language+" is not supported!");
		}
	}
	
	private static long getFileSize(final String filePath)
	{
		final File file = new File(filePath);
		return file.length();
	}
	
	
}
