import java.io.File;
import java.io.FileOutputStream;

import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;

import org.apache.log4j.Logger;

public final class CVGenerator 
{
	private static final Logger logger = Logger.getLogger(CVGenerator.class);
	
	private Transformer transformer;
	
	private enum Language {russian, ukrainian, french, english};
	
	private CVGenerator() throws Exception
	{
 		this.transformer = TransformerFactory.newInstance().newTransformer(new javax.xml.transform.stream.StreamSource("src/xml/styleStatic.xslt"));
	}
	
	public static void main(final String[] args) throws Exception
	{

		logger.info("Generation ProffiCV started.");
		
		CVGenerator cvGenerator = new CVGenerator();

		cvGenerator.generateForLanguage(Language.russian);
		cvGenerator.generateForLanguage(Language.ukrainian);
		cvGenerator.generateForLanguage(Language.french);
		cvGenerator.generateForLanguage(Language.english);
	
		logger.info("Generation ProffiCV finished with success!");
	}

	private void generateForLanguage(final Language language) throws Exception 
	{
		
		
		final String xmlFileName = "cv_"+language.toString()+".xml";
		final String htmlFileName= "index" + this.getFileSuffixe(language)+".html";
		
		logger.info("Generation of '"+htmlFileName+"' starting from '"+xmlFileName+"' ...");
		
		this.transformer.transform(
				new javax.xml.transform.stream.StreamSource("src/xml/"+xmlFileName),
				new javax.xml.transform.stream.StreamResult(new FileOutputStream("web/"+htmlFileName))
			);
		
		long fileSize = getFileSize("web/"+htmlFileName);
		logger.info("Generation of '"+htmlFileName+"' (size : "+fileSize+" bytes) finished with success!");
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
