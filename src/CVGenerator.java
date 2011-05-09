import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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

public final class CVGenerator 
{
	private static final Logger LOGGER = Logger.getLogger(CVGenerator.class);
	
	private Transformer transformer;
	
	FopFactory fopFactory = FopFactory.newInstance();
	
	public static enum Language {russian, ukrainian, french, english};
	public static enum FormatCV {HTML, PDF};
	
	public CVGenerator()
	{
		try{
			this.transformer = TransformerFactory.newInstance().newTransformer(new javax.xml.transform.stream.StreamSource("src/xml/styleStatic.xslt"));
			this.fopFactory.setUserConfig(new File("src/fop.xml"));
		}
		catch(Exception ex){
			ex.printStackTrace();
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
	
		cvGenerator.generatePdfCVForLanguage(Language.french);
		cvGenerator.generatePdfCVForLanguage(Language.english);
		cvGenerator.generatePdfCVForLanguage(Language.russian);
		cvGenerator.generatePdfCVForLanguage(Language.ukrainian);
	
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
	
	public void generatePdfCVForLanguage(final Language language) throws Exception 
	{
		final String xmlFileName = "cv_"+language.toString()+".xml";
		final String pdfFileName= "cv_voronetskyy" + this.getFileSuffixe(language)+".pdf";
		OutputStream out = new BufferedOutputStream(new FileOutputStream(new File("web/pdf/"+pdfFileName)));
		
		LOGGER.info("Generation of : '"+pdfFileName+"' starting from '"+xmlFileName+"' ...");
		
		try {
			  // Step 3: Construct fop with desired output format
			  Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, out);
			  fop.getUserAgent().setBaseURL("Voronetskyy Yevgen");
			  fop.getUserAgent().setCreationDate(new Date());
			  fop.getUserAgent().setCreator("Apache XSL FOP engine");
			  fop.getUserAgent().setTitle("Voronetskyy Yevgen - Software Engineer - CV");
			  fop.getUserAgent().setFontBaseURL("file:///C:/WINDOWS/Fonts/");
			  

			  // Step 4: Setup JAXP using identity transformer
			  TransformerFactory factory = TransformerFactory.newInstance();
			  Transformer transformer = factory.newTransformer(new javax.xml.transform.stream.StreamSource("src/xml/style-fo.xml")); // identity transformer
			           
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
				return "_fr";
			case english:
				return "";
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
