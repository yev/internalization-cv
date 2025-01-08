import java.util.Date;

import org.apache.log4j.Logger;

public class ParrallelCVGenerator{
	private static final Logger LOGGER = Logger.getLogger(ParrallelCVGenerator.class);
	public static void main(String[] args) {
		long start = new Date().getTime();
		runThreadFor(CVGenerator.FormatCV.HTML,CVGenerator.Language.english);
		runThreadFor(CVGenerator.FormatCV.HTML,CVGenerator.Language.french);
		runThreadFor(CVGenerator.FormatCV.HTML,CVGenerator.Language.russian);
		runThreadFor(CVGenerator.FormatCV.HTML,CVGenerator.Language.ukrainian);
		runThreadFor(CVGenerator.FormatCV.HTML,CVGenerator.Language.italian);

		runThreadFor(CVGenerator.FormatCV.PDF,CVGenerator.Language.english);
		runThreadFor(CVGenerator.FormatCV.PDF,CVGenerator.Language.french);
		runThreadFor(CVGenerator.FormatCV.PDF,CVGenerator.Language.russian);
		runThreadFor(CVGenerator.FormatCV.PDF,CVGenerator.Language.ukrainian);
		runThreadFor(CVGenerator.FormatCV.PDF,CVGenerator.Language.italian);

		long end = new Date().getTime();
		LOGGER.info("Total processing duration is " + (end - start)/1000 +" seconds.");

	}

	private static void runThreadFor( final CVGenerator.FormatCV format, final CVGenerator.Language language ) {
		Thread t1 = new Thread(new ParrallelCVGeneratorJob(format, language));
		t1.start();
	}
}


/**
 * For parallel CV generation, behind it uses a specifiv Thread for each CV
 * Generation
 *
 * @author yev
 *
 */
final class ParrallelCVGeneratorJob implements Runnable {
	private static final Logger LOGGER = Logger.getLogger(ParrallelCVGenerator.class);
	/**
	 * Construction when class initializing, prevent to make getInstance method with slow "syncronized" construct
	 */
	private static final CVGenerator SHARED_GENERATOR_INSTANCE = new CVGenerator();

	private CVGenerator.FormatCV format;
	private CVGenerator.Language language;


	public ParrallelCVGeneratorJob(CVGenerator.FormatCV format, CVGenerator.Language language) {
		super();
		this.format = format;
		this.language = language;
	}

	@Override
	public void run() {
		if (format.compareTo(CVGenerator.FormatCV.PDF) == 0) {
			try {
				SHARED_GENERATOR_INSTANCE.generateNoAnonymousPdfCV(language);
			} catch (Exception e) {
				LOGGER.error(e);
				throw new RuntimeException(e);
			}
		} else if (format.compareTo(CVGenerator.FormatCV.HTML) == 0) {
			try {
				SHARED_GENERATOR_INSTANCE.generateHtmlCVForLanguage(language);
			} catch (Exception e) {
				LOGGER.error(e);
				throw new RuntimeException(e);
			}
		} else
			throw new IllegalArgumentException("format " + format.name()
					+ " is not supported!");
	}

}
