package ujm.wi.write;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import ujm.wi.enums.JCMFile;
import ujm.wi.enums.Paths;

public class WriteInFile {
	
	public static void main(String[] args) {
		//writeFile();
	}
	
	
	
	public static boolean writeFile(HashMap<String, List<String>> hashMap){
		
		try {

			/* fisrt line in th jcm file */
			String line = JCMFile.MAS + " " + JCMFile.PROJECT_NAME + " {\n";

			/* open file */
			File file = new File(Paths.ASL.toString());

			/* if file doesn't exists, then create it */ 
			if (!file.exists()) {
				file.createNewFile();
			}

			FileWriter fw = new FileWriter(file.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			
			bw.write(line);
			
			Set<String> keys = hashMap.keySet();
			
			for (String s : keys) {
				line = "	"+JCMFile.AGENT+" : ag"+s+" "+JCMFile.ASL_FILE_NAME + " {\n"; 
				bw.write(line);
				line = "		"+JCMFile.BELIEFS+": "+ JCMFile.NEIGHBORS+"([";
				//System.out.print(s + " : [");
				for (String ss : hashMap.get(s)) {
					line += "ag"+ss+",";
					System.out.print(ss + " ");
				}
				line = line.substring(0, line.lastIndexOf(","))+"])\n";
				bw.write(line);
				//System.out.print("]\n");
			}
			
			
			
			bw.close();

			System.out.println("Done");

		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} 
		
		return true;
	}
}
