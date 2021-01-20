//special thanks to Derek Banas' youtube tutorials, mkyong's recursive file copying, Nambi's image drawing, and Oracle's documentation 
// https://stackoverflow.com/questions/18777893/jframe-background-image for putting on background image. 

import java.awt.event.*; 
import javax.swing.*; 
import java.nio.file.*;
import java.awt.BorderLayout; 
import java.io.IOException;
import java.nio.file.attribute.BasicFileAttributes;
import javax.swing.UIManager.*; 
import java.io.File;
import java.awt.Graphics;
import javax.swing.ImageIcon;
import java.util.Comparator;
import java.util.stream.Stream;

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
	private Path currentPath; 
	private Path testPath;
	private Path sysMapPath;
	private Path sysSavPath;
	private Path sysDocPath;
	private String versionNum; 
	private JLabel background;  

	public static void main(String[] args){
	//launches the application windows
		new wizard(); 
	}


	public wizard(){
		versionNum = "1.2";
		instantiateFields(); 
		//set a layout and basic size and window properties. 
		panel.setLayout(new BorderLayout()); 
		this.setSize(960,540); 
		this.setLocationRelativeTo(null); 
		this.setResizable(false);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); 
		this.setTitle("Age of Empires 3: Overhauled - " + versionNum);
		setUI(); 
		//add the components to each other, then to the panel
		jvBar.add(menu, BorderLayout.PAGE_START); 
		panel.add(background);
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
		this.setSize(960,540); 
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
		background = new JLabel(new ImageIcon("background_wallpaper.jpg")); 
		setDefaultOSDirectory(); 
		readMeLabel = new JLabel("<html> This is the setup program for Age of Empires 3 Overhauled Edition. <br> <br> This DOES NOT work for retail copies, only Steam versions. This program WILL NOT work if you move the files from the mod's path or have a non-standard AoE3 install, you will need to do a manual install then. <br> <br> Clicking on \"Install Mod\" will create a backup of your Age Of Empires 3 data files in \"./Age of Empires 3/bin/data\" in the \"./Age of Empires 3/bin/databak\" folder. <br> <br> Clicking on \"Remove Mod\" will override your data files with the backup created earlier. <br> <br> Default Installation Paths. WIN: C:\\Program Files (x86)\\Steam\\Steamapps\\common\\Age Of Empires 3\\ LINUX: ~/.local/.share/Steam/steamapps/common/Age Of Empires 3/ </html>");
		panel = new JPanel();
	}

	public void setUI()
	{
		try 
		{
   		 for (LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) 
        		if ("Nimbus".equals(info.getName())) 
			{
            			UIManager.setLookAndFeel(info.getClassName());
           			 break;
       			}

		} 
		catch (Exception e) 
		{
    		// If Nimbus is not available, you can set the GUI to another look and feel.
		}

	}

	public void actionPerformed(ActionEvent e)
	{
		Path backupData = Paths.get(currentPath + "/bin/databak");
		Path modMapPath = Paths.get(FileSystems.getDefault().getPath(".").toAbsolutePath() + "/RM3");
		Path modSavPath = Paths.get(FileSystems.getDefault().getPath(".").toAbsolutePath() + "/Savegame");
		Path backupSAV = Paths.get(sysDocPath + "/SavegameBAK");
		Path dataPath = Paths.get(currentPath + "/bin/data"); 
		Path artPath = Paths.get(currentPath + "/bin/art"); 
		Path aiPath = Paths.get(currentPath + "/bin/AI3"); 
		Path backupAI = Paths.get(currentPath + "/bin/AI3BAK"); 
		Path backupART = Paths.get(currentPath + "/bin/ARTBAK");
		Path modPath = Paths.get(FileSystems.getDefault().getPath(".").toAbsolutePath() + "/bin");
		Path binPath = Paths.get(currentPath +"/bin");
		Path deleteCheckPath = Paths.get(currentPath +"/bin/data/civs.xml");
		Path deleteSavFile = Paths.get(sysSavPath +"/sp_Washington_homecity.xml");
		System.out.println("Save file path is: " + deleteSavFile); 
		System.out.println(Files.exists(deleteSavFile));

		if (e.getSource() == itemHelp)
			//show the read me once the user clicks on the menu button
			JOptionPane.showMessageDialog(null, readMeLabel, "READ ME", JOptionPane.INFORMATION_MESSAGE);

		else if (e.getSource() == installMod)
		{
			//show the file navigator once the user clicks on the install mod button in the menu
			System.out.println("This current path is:" + currentPath);
			System.out.println("Test path is:" + testPath);
			
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
						//if the user has already installed the mod and tries to reinstall it, we don't create a backup
						JOptionPane.showMessageDialog(null, "Installation has begun, this may take a little while. \n Click on OK to proceed. \n If installation fails, run the program in cmd.exe or terminal to see any error messages", "Message", JOptionPane.INFORMATION_MESSAGE); 
						if (Files.exists(deleteCheckPath) && Files.isRegularFile(deleteCheckPath))
							System.out.println("Data files have been modified. Skipping backup.");
						//if the user hasn't installed the mod, then we create a backup
						else if(!Files.exists(deleteCheckPath))
						{
							copyDirectoryFileVisitor(dataPath.toString(), backupData.toString());
							copyDirectoryFileVisitor(artPath.toString(), backupART.toString());
							copyDirectoryFileVisitor(aiPath.toString(), backupAI.toString());
							copyDirectoryFileVisitor(sysSavPath.toString(), backupSAV.toString());
						}
						//in either case, we still copy over the mod install files
							copyDirectoryFileVisitor(modPath.toString(), binPath.toString()); 
							copyDirectoryFileVisitor(modMapPath.toString(), sysMapPath.toString()); 
							copyDirectoryFileVisitor(modSavPath.toString(), sysSavPath.toString()); 
							JOptionPane.showMessageDialog(null, "File Copy has completed", "Message", JOptionPane.INFORMATION_MESSAGE); 
						
					}
					catch(IOException ex)
					{
					System.out.println(ex.toString()); 
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
				if (Files.exists(deleteCheckPath) && Files.isRegularFile(deleteCheckPath))
					try
					{
					//delete the modified directory and replace it with the default one
						JOptionPane.showMessageDialog(null, "File Restore has started, this may take a little while. \n Click on OK to proceed.", "Message", JOptionPane.INFORMATION_MESSAGE); 
            					deleteDirectoryJava8(dataPath.toString());
						deleteDirectoryJava8(artPath.toString());
						deleteDirectoryJava8(aiPath.toString());
						copyDirectoryFileVisitor(backupData.toString(), dataPath.toString());
						copyDirectoryFileVisitor(backupART.toString(), artPath.toString());
 						copyDirectoryFileVisitor(backupAI.toString(), aiPath.toString());
						copyDirectoryFileVisitor(backupSAV.toString(), sysSavPath.toString());
						Files.deleteIfExists(deleteSavFile); 
						JOptionPane.showMessageDialog(null, "File Restore has completed", "Message", JOptionPane.INFORMATION_MESSAGE); 

					}
					catch(IOException ex)
					{
						System.out.println(ex.toString()); 
					}
				else if(!Files.exists(deleteCheckPath))
				{
					try
					{
						//since we're trying to delete a file that doesn't exist, we're assuming that the user doesn't have the mod installed and did a misclick. In that case, we back up existing files.
						copyDirectoryFileVisitor(dataPath.toString(), backupData.toString());
						copyDirectoryFileVisitor(artPath.toString(), backupART.toString());
 						copyDirectoryFileVisitor(aiPath.toString(), backupAI.toString());
						copyDirectoryFileVisitor(sysSavPath.toString(), backupSAV.toString());

					}
					catch(IOException ex)
					{
						System.out.println(ex.toString()); 

					}

				}


			}		
		}
		else if(e.getSource() == exitProgram)
			System.exit(0);
	

	
	}


	private void setDefaultOSDirectory()
	{
		//method to see what OS the user is on. Due to AoE3 being deprecated on MacOS, it's not a supported platform. And given that the game is no longer sold in retail stores, only Steam is being currently supported for now
		String thisOS = System.getProperty("os.name"); 
		String home = System.getProperty("user.home");

		if (thisOS.contains("Windows") || thisOS.contains("windows"))
		{
			System.out.println("User's current OS is a Windows variant, setting default directory");
			currentPath = Paths.get("C:/Program Files (x86)/Steam/Steamapps/Common/Age of Empires 3/");
			testPath = Paths.get("C:/Program Files (x86)/Steam/Steamapps/Common/Age of Empires 3/");
			sysMapPath = Paths.get(home + "/Documents/My Games/Age of Empires 3/RM3"); 
			sysSavPath = Paths.get(home + "/Documents/My Games/Age of Empires 3/Savegame");
			sysDocPath = Paths.get(home + "/Documents/My Games/Age of Empires 3/");
		}
		else if (thisOS.contains("Linux") || thisOS.contains("linux"))
		{
			System.out.println("User's current OS is a Linux variant, setting default directory"); 
			currentPath = Paths.get(home + "/.local/share/Steam/steamapps/common/Age Of Empires 3/"); 
			testPath = Paths.get(home + "/.local/share/Steam/steamapps/common/Age Of Empires 3/"); 
			sysMapPath = Paths.get(home +"/.local/share/Steam/steamapps/compatdata/105450/pfx/drive_c/users/steamuser/My Documents/My Games/Age of Empires 3/RM3");
			sysSavPath = Paths.get(home +"/.local/share/Steam/steamapps/compatdata/105450/pfx/drive_c/users/steamuser/My Documents/My Games/Age of Empires 3/Savegame");
			sysDocPath = Paths.get(home + "/.local/share/Steam/steamapps/compatdata/105450/pfx/drive_c/users/steamuser/My Documents/My Games/Age of Empires 3/");
		}
	}


	//recursive copy method taken from mkyong.com. See included MIT license file 
	public static void copyDirectoryFileVisitor(String source, String target) throws IOException 
	{

        	TreeCopyFileVisitor fileVisitor = new TreeCopyFileVisitor(source, target);
        	Files.walkFileTree(Paths.get(source), fileVisitor);

    	}
	//recursive delete method taken from mkyong.com. See included MIT license file
	public static void deleteDirectoryJava8(String dir) throws IOException {

      	Path path = Paths.get(dir);

      // read java doc, Files.walk need close the resources.
      // try-with-resources to ensure that the stream's open directories are closed
     	 try (Stream<Path> walk = Files.walk(path)) {
          walk
                  .sorted(Comparator.reverseOrder())
                  .forEach(wizard::deleteDirectoryJava8Extract);
      }

  }

  // extract method to handle exception in lambda
  public static void deleteDirectoryJava8Extract(Path path) {
      try {
          Files.delete(path);
      } catch (IOException e) {
          System.err.printf("Unable to delete this path : %s%n%s", path, e);
      }
  }
}









