//special thanks to Derek Banas' tutorial, mkyong's recursive file copying, and Oracle's documentation 

import java.awt.event.*; 
import javax.swing.*; 
import java.nio.file.*;
import java.awt.BorderLayout; 
import java.io.IOException;
import java.nio.file.attribute.BasicFileAttributes;

public class wizard extends JFrame implements ActionListener
{

	private JMenu menu; 
	private JMenuItem itemHelp; 
	private JMenuItem installMod;
	private JMenuItem removeMod;
	private JMenuItem exitProgram;
	private JMenuBar jvBar; 
	private JLabel readMeLabel; 
	private JPanel panel; 
	private JFileChooser selectInstall; 
	private Path currentPath; 
	private Path testPath;

	public static void main(String[] args){
	//launches the application windows
		new wizard(); 
	}


	public wizard(){
		instantiateFields(); 
		//set a layout and basic size and window properties. 
		panel.setLayout(new BorderLayout()); 
		this.setSize(960,540); 
		this.setLocationRelativeTo(null); 
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
		this.setTitle("Age of Empires 3: Overhauled");
		//add the components to each other, then to the panel
		jvBar.add(menu, BorderLayout.PAGE_START); 
		panel.add(jvBar, BorderLayout.PAGE_START); 
		menu.add(itemHelp); 
		menu.add(installMod); 
		menu.add(removeMod); 
		menu.add(exitProgram);
		itemHelp.addActionListener(this); 
		installMod.addActionListener(this); 
		removeMod.addActionListener(this);
		exitProgram.addActionListener(this);
		this.add(panel);
		this.setVisible(true);
	}

	public void instantiateFields(){ 
		//labels and instantiates the buttons
		menu = new JMenu("Menu"); 
		itemHelp = new JMenuItem("READ ME");
		installMod = new JMenuItem("Install Mod"); 
		removeMod = new JMenuItem("Remove Mod"); 
		exitProgram = new JMenuItem("Exit"); 
		jvBar = new JMenuBar(); 
		selectInstall = new JFileChooser("Browse Install Location"); 
		setDefaultOSDirectory(selectInstall); 
		readMeLabel = new JLabel("<html> This is the setup program for Age of Empires 3 Overhauled Edition. <br> <br> This DOES NOT work for retail copies, only Steam versions. This program WILL NOT work if you move the files from the mod's path or have a non-standard AoE3 install, you will need to do a manual install then. <br> <br> Clicking on \"Install Mod\" will create a backup of your Age Of Empires 3 data files in \"./Age of Empires 3/bin/data\" in the \"./Age of Empires 3/bin/databak\" folder. <br> <br> Clicking on \"Remove Mod\" will override your data files with the backup created earlier. <br> <br> Default Installation Paths. WIN: C:\\Program Files (x86)\\Steam\\Steamapps\\common\\Age Of Empires 3\\ LINUX: ~/.local/.share/Steam/steamapps/common/Age Of Empires 3/ </html>");
		panel = new JPanel();
}

	public void actionPerformed(ActionEvent e)
	{
		Path backupData = Paths.get(currentPath + "/bin/databak");
		Path dataPath = Paths.get(currentPath + "/bin/data"); 
		Path modPath = Paths.get(FileSystems.getDefault().getPath(".").toAbsolutePath() + "/bin");
		Path binPath = Paths.get(currentPath +"/bin");

		if (e.getSource() == itemHelp)
			//show the read me once the user clicks on the menu button
			JOptionPane.showMessageDialog(null, readMeLabel, "READ ME", JOptionPane.INFORMATION_MESSAGE);
		else if (e.getSource() == installMod)
		{
			//show the file navigator once the user clicks on the install mod button in the menu
			int returnVal = selectInstall.showOpenDialog(wizard.this); 
			System.out.println("This current path is:" + currentPath);
			System.out.println("Test path is:" + testPath);

			if (returnVal == JFileChooser.APPROVE_OPTION)
			{
				//make sure that the user is in the right path to copy the files, and not somewhere else
				if (currentPath.toString().equals(testPath.toString()) == false)
					System.out.println("it didn't work! You're probably not in the right directory."); 

				else if(currentPath.toString().equals(testPath.toString()) == true)
				{
					System.out.println("modpath is: " + modPath); 
					System.out.println("backup path is: " + backupData);
					System.out.println("data path is: "+ dataPath); 
					try
					{
						//backup files before we do anything else
						copyDirectoryFileVisitor(dataPath.toString(), backupData.toString());
						copyDirectoryFileVisitor(modPath.toString(), binPath.toString()); 
						JOptionPane.showMessageDialog(null, "File Copy has completed", "Message", JOptionPane.INFORMATION_MESSAGE); 

					}
					catch(IOException ex)
					{
					System.out.println(ex.toString()); 
					}


				}		
			}

	}
	else if(e.getSource() == removeMod)
	{
		System.out.println("This current path is:" + currentPath);
		System.out.println("Test path is:" + testPath);
			//make sure that the user is in the right path to copy the files, and not somewhere else
			if (currentPath.toString().equals(testPath.toString()) == false)
				System.out.println("it didn't work! You're probably in the wrong directory!"); 
			else if(currentPath.toString().equals(testPath.toString()) == true)
			{
				System.out.println("modpath is: " + modPath); 
				System.out.println("backup path is: " + backupData);
				System.out.println("data path is: "+ dataPath); 
				try
				{
					//delete the modified directory and replace it with the default one
            				deleteDirectoryJava7(dataPath.toString());
					copyDirectoryFileVisitor(backupData.toString(), dataPath.toString());
					JOptionPane.showMessageDialog(null, "File Restore has completed", "Message", JOptionPane.INFORMATION_MESSAGE); 

				}
				catch(IOException ex)
				{
					System.out.println(ex.toString()); 
				}


			}		
	}
	else if(e.getSource() == exitProgram)
		System.exit(0);
	

}


	private void setDefaultOSDirectory(JFileChooser fileChooser)
	{
		//method to see what OS the user is on. Due to AoE3 being deprecated on MacOS, it's not a supported platform. And given that the game is no longer sold in retail stores, only Steam is being currently supported for now
		String thisOS = System.getProperty("os.name"); 
		if (thisOS.contains("Windows") || thisOS.contains("windows"))
		{
			System.out.println("User's current OS is a Windows variant, setting default directory");
			fileChooser.setCurrentDirectory(new java.io.File("C:/Program Files (x86}/Steam/Steamapps/Common/Age of Empires 3/")); 
			currentPath = Paths.get("C:/Program Files (x86}/Steam/Steamapps/Common/Age of Empires 3/");
			testPath = Paths.get("C:/Program Files (x86}/Steam/Steamapps/Common/Age of Empires 3/");
		}
		else if (thisOS.contains("Linux") || thisOS.contains("linux"))
		{
			System.out.println("User's current OS is a Linux variant, setting default directory"); 
			String home = System.getProperty("user.home");
			fileChooser.setCurrentDirectory(new java.io.File(home + "/.local/share/Steam/steamapps/common/Age Of Empires 3/"));
			currentPath = Paths.get(home + "/.local/share/Steam/steamapps/common/Age Of Empires 3/"); 
			testPath = Paths.get(home + "/.local/share/Steam/steamapps/common/Age Of Empires 3/"); 


		}
		fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY); 
		fileChooser.setDialogTitle("Mod Install Location"); 
		}


	//recursive copy method taken from mkyong.com. See included MIT license file 
	public static void copyDirectoryFileVisitor(String source, String target) throws IOException 
	{

        	TreeCopyFileVisitor fileVisitor = new TreeCopyFileVisitor(source, target);
        	Files.walkFileTree(Paths.get(source), fileVisitor);

    	}
	

	//recursive directory delete taken from mkyong.com. See included MIT license file
	public static void deleteDirectoryJava7(String filePath) throws IOException 
	{

        Path path = Paths.get(filePath);

        Files.walkFileTree(path,
            new SimpleFileVisitor<>() {

                // delete directories or folders
                @Override
                public FileVisitResult postVisitDirectory(Path dir,
                                                          IOException exc)
                                                          throws IOException {
                    Files.delete(dir);
                    System.out.printf("Directory is deleted : %s%n", dir);
                    return FileVisitResult.CONTINUE;
                }

                // delete files
                @Override
                public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
                    Files.delete(file);
                    System.out.printf("File is deleted : %s%n", file);
                    return FileVisitResult.CONTINUE;
                }
            }
        );

    }

}






