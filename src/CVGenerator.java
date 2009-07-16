import java.io.FileOutputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;

import org.apache.log4j.Logger;

public class CVGenerator 
{
	private static Logger logger = Logger.getLogger(CVGenerator.class);
	
	private TransformerFactory tFactory;
	private Transformer transformer;
	
	private enum Language {russian, ukrainian, french, english};
	
	private CVGenerator() throws Exception
	{
		this.tFactory = TransformerFactory.newInstance();
		System.out.println(tFactory.getClass().getCanonicalName());
 
		String s = System.setProperty("javax.xml.transform.TransformerFactory", "org.apache.xalan.xsltc.trax.TransformerFactoryImpl");
		System.out.println(s);
		logger.info("javax.xml.transform.TransformerFactory system property = "+System.getProperty("javax.xml.transform.TransformerFactory "));
		this.transformer = tFactory
				.newTransformer(new javax.xml.transform.stream.StreamSource(
						"src/xml/styleStatic.xslt"));
	}
	
	public static void main(String[] args) throws Exception
	{

		logger.info("Generation starting");
		
		CVGenerator cvGenerator = new CVGenerator();

		cvGenerator.generateForLanguage(Language.russian);
		cvGenerator.generateForLanguage(Language.ukrainian);
		cvGenerator.generateForLanguage(Language.french);
		cvGenerator.generateForLanguage(Language.english);
	
		logger.info("Generating finished with success!");
	}

	private void generateForLanguage(final Language language) throws Exception 
	{
		
		
		final String xmlFileName = "cv_"+language.toString()+".xml";
		final String htmlFileName= "index" + this.getFileSuffixe(language)+".html";
		
		logger.info("Generation of '"+htmlFileName+"' starting from '"+xmlFileName+"' ...");
		
		this.transformer.transform(new javax.xml.transform.stream.StreamSource(
				"src/xml/"+xmlFileName),
				new javax.xml.transform.stream.StreamResult(
						new FileOutputStream("web/"+htmlFileName)));
		
		logger.info("Generation of '"+htmlFileName+"' finished with success!");
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
}
