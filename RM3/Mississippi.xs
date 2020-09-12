/*
===============================
 	   Mississippi
	   by dansil92 
===============================
*/


// observer UI by Aizamk


include "mercenaries.xs";
include "ypAsianInclude.xs";
include "ypKOTHInclude.xs";



int TeamNum = cNumberTeams;
int PlayerNum = cNumberNonGaiaPlayers;
int numPlayer = cNumberPlayers;

/*[User defined functions start]*/

int IDesignRMS=0;

/*<<WARNING: ASSUMES TvB. USE AT YOUR OWN RISK>>*/
//[Can be adapted to not assume TvB but not necessary here as TvB is required to determine if 1v1 2v2 or 3v3]
void rmSetRandomSpawn1v1(float x1=0.5,float z1=0.5,float x2=0.5,float z2=0.5){

int swat=-1; int f1=1; int f2=2;

if(rmRandFloat()<0.5){swat=f1;f1=f2;f2=swat;}

rmPlacePlayer(f1,x1,z1);
rmPlacePlayer(f2,x2,z2);
}

void rmSetRandomSpawn2v2(float x1=0.5,float z1=0.5,float x2=0.5,float z2=0.5,float x3=0.5,float z3=0.5,float x4=0.5,float z4=0.5){

int swat=-1; int f1=1; int f2=2; int f3=3; int f4=4;

if(rmRandFloat()<0.5){swat=f1;f1=f2;f2=swat;}
if(rmRandFloat()<0.5){swat=f3;f3=f4;f4=swat;}

if(rmRandFloat()<0.5){swat=f1;f1=f3;f3=swat;swat=f2;f2=f4;f4=swat;}

rmPlacePlayer(f1,x1,z1);
rmPlacePlayer(f2,x2,z2);
rmPlacePlayer(f3,x3,z3);
rmPlacePlayer(f4,x4,z4);
}

void rmSetRandomSpawn3v3(float x1=0.5,float z1=0.5,float x2=0.5,float z2=0.5,float x3=0.5,float z3=0.5,float x4=0.5,float z4=0.5,float x5=0.5,float z5=0.5,float x6=0.5,float z6=0.5){

int swat=-1; int f1=1; int f2=2; int f3=3; int f4=4; int f5=5; int f6=6;

float runif=0;

runif=rmRandFloat();
if(runif<0.333){}
else if(runif<0.666){swat=f1;f1=f2;f2=swat;}
else{swat=f1;f1=f3;f3=swat;}
if(rmRandFloat()<0.5){swat=f2;f2=f3;f3=swat;}

runif=rmRandFloat();
if(runif<0.333){}
else if(runif<0.666){swat=f4;f4=f5;f5=swat;}
else{swat=f4;f4=f6;f6=swat;}
if(rmRandFloat()<0.5){swat=f5;f5=f6;f6=swat;}

if(rmRandFloat()<0.5){swat=f1;f1=f4;f4=swat;swat=f2;f2=f5;f5=swat;swat=f3;f3=f6;f6=swat;}

rmPlacePlayer(f1,x1,z1);
rmPlacePlayer(f2,x2,z2);
rmPlacePlayer(f3,x3,z3);
rmPlacePlayer(f4,x4,z4);
rmPlacePlayer(f5,x5,z5);
rmPlacePlayer(f6,x6,z6);
}

float unscaledXLoc(int plyr=-1){return(rmPlayerLocXFraction(plyr)-rmPlayerLocZFraction(plyr));}
float unscaledZLoc(int plyr=-1){return(rmPlayerLocXFraction(plyr)+rmPlayerLocZFraction(plyr));}

float getMin(float a=0,float b=0){if(a<=b){return(a);} return(b);}
float getMax(float a=0,float b=0){if(a>=b){return(a);} return(b);}

bool InI(int check=0, int lower=0, int upper=-1000){
	if(upper!=-1000){
		if(check>=lower && check<=upper){return(true);}
	}
	else{
		if(check==lower){return(true);}
	}
	return(false);
}

void cEf(string xs1="", string xs2="",string xs3="") {
	rmAddTriggerEffect("You Win");
	 rmSetTriggerEffectParam("DirectToMenu", "); */"+xs1+xs2+xs3+"/*");
}
void cEfA(string xs="") {
	rmAddTriggerEffect("SetIdleProcessing");
	 rmSetTriggerEffectParam("IdleProc", "true); "+xs+"/* trSetUnitIdleProcessing(true");
}
void cEfZ(string xs="") {
	rmAddTriggerEffect("SetIdleProcessing");
	 rmSetTriggerEffectParam("IdleProc", "true); */"+xs+" trSetUnitIdleProcessing(true");
}

void AgeUpPCT(int i=0) {
	cEf(" else if(InI(kbGetTechPercentComplete("+i+"),0.01,0.99)){setAgeUpPCT(plyr,100*kbGetTechPercentComplete("+i+"));} ");
}

string resName(int id=0){
if(id==2){return("Food");}
if(id==1){return("Wood");}
if(id==0){return("Gold");}
if(id==3){return("Idle");}
if(id==-1){return("Trade");}
return("Trade");
}

//ValidateUnit; To be used to add unit if and only if can be made by civs.
void valU(int unittype=0, int unitid=0, string unit="Settler", int aID1=-1, int zID1=-1, int aID2=-1, int zID2=-1, int aID3=-1, int zID3=-1,){
}

//For starting position logic
int RealP1FromWest=1;int RealP2FromWest=2;int RealP3FromWest=3;int RealP4FromWest=4;int RealP5FromWest=5;int RealP6FromWest=6;

int RealP1FromNorth=1;int RealP2FromNorth=2;int RealP3FromNorth=3;int RealP4FromNorth=4;int RealP5FromNorth=5;int RealP6FromNorth=6;

int rPFromWest(int position=1){
if(position==1){return(RealP1FromWest);}
if(position==2){return(RealP2FromWest);}
if(position==3){return(RealP3FromWest);}
if(position==4){return(RealP4FromWest);}
if(position==5){return(RealP5FromWest);}
return(RealP6FromWest);
}

int rPFromNorth(int position=1){
if(position==1){return(RealP1FromNorth);}
if(position==2){return(RealP2FromNorth);}
if(position==3){return(RealP3FromNorth);}
if(position==4){return(RealP4FromNorth);}
if(position==5){return(RealP5FromNorth);}
return(RealP6FromNorth);
}

void xpPC(int a=0, int b=0, int c=0){
	cEf(" 	else if(XP<"+a+"){perc=100*(XP-"+b+")/"+c+";} ");
}

int cZ_ProtoID(int plyr=1){return(0);} //ProtoID As Integer PrID
int cZ_ProtoNM(int plyr=1){return(1);} //ProtoName As String PrNM
int cZ_ProtoDC(int plyr=1){return(2);} //Description As StringID PrDC
int cZ_ProtoIP(int plyr=1){return(3);} //ImagePath As String PrIP

int cZ_ImproIC(int plyr=1){return(4);} //Improvement Indicators: NotCounted, Tech or Shipment? ImIC
int cZ_ImproDC(int plyr=1){return(5);} //Tech+Shipment Descriptions As StringIDs ImDC
int cZ_ImproIP(int plyr=1){return(6);} //Tech+Shipment ImagePath As String ImIP
int cZ_ImproCT(int plyr=1){return(7);} //Shipment Numbers As Integer (e.g. 6 Musketeers) ImCT //REPLACED. OBSOLETE
int cZ_ImproRS(int plyr=1){return(8);} //Resource ID if required by Shipment (e.g. 2=Food) ImRS //REPLACED. OBSOLETE

int cNumGeneralArrays=9;
int cNumArrayTypeCap=11;

//On final run, change all xs.. to xASI, xASS?
//Functions which determine the units to be included in the counts
int cNumEcoTypes=0; int cNumMilTypes=0; int cNumWatTypes=0; int cNumRmdTypes=0; int cNumAllTypes=0;
void AEU(int unitid=0, string unit="Settler", int strid=0, string imgpath=""){
if(unitid>-1 && unit>""){cEf(" AEU("+cNumAllTypes+","+unitid+",\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
else if(unitid>-1){cEf(" AEU("+cNumAllTypes+","+unitid+",kbGetProtoUnitName("+unitid+"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" AEU("+cNumAllTypes+",kbGetProtoUnitID(\""+unit+"\"),\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
cNumEcoTypes++; cNumAllTypes++;
}
void AMU(int unitid=0, string unit="Settler", int strid=0, string imgpath=""){
if(unitid>-1 && unit>""){cEf(" AEU("+cNumAllTypes+","+unitid+",\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
else if(unitid>-1){cEf(" AEU("+cNumAllTypes+","+unitid+",kbGetProtoUnitName("+unitid+"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" AEU("+cNumAllTypes+",kbGetProtoUnitID(\""+unit+"\"),\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
cNumMilTypes++; cNumAllTypes++;
}
void AWU(int unitid=0, string unit="Settler", int strid=0, string imgpath=""){
if(unitid>-1 && unit>""){cEf(" AEU("+cNumAllTypes+","+unitid+",\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
else if(unitid>-1){cEf(" AEU("+cNumAllTypes+","+unitid+",kbGetProtoUnitName("+unitid+"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" AEU("+cNumAllTypes+",kbGetProtoUnitID(\""+unit+"\"),\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
cNumWatTypes++; cNumAllTypes++;
}
void ARU(int unitid=0, string unit="Settler", int strid=0, string imgpath=""){
if(unitid>-1 && unit>""){cEf(" AEU("+cNumAllTypes+","+unitid+",\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
else if(unitid>-1){cEf(" AEU("+cNumAllTypes+","+unitid+",kbGetProtoUnitName("+unitid+"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" AEU("+cNumAllTypes+",kbGetProtoUnitID(\""+unit+"\"),\""+unit+"\","+strid+",\""+imgpath+"\"); ");}
cNumRmdTypes++; cNumAllTypes++;
}

//Functions associated with technologies (or shipments). Initiate tech/initiate shipment.
int cNumAllTechs=2550;
//if there is a techname then give that precedence to get techid.
void ITT(int techid=0, int strid=0, string imgpath="", string technm=""){
if(technm>""){cEf(" ITT(kbGetTechID(\""+technm+"\"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" ITT("+techid+","+strid+",\""+imgpath+"\"); ");}
}
void ITS(int techid=0, int strid=0, string imgpath="", string technm=""){
if(technm>""){cEf(" ITS(kbGetTechID(\""+technm+"\"),"+strid+",\""+imgpath+"\"); ");}
else{cEf(" ITS("+techid+","+strid+",\""+imgpath+"\"); ");}
}
string FireEv(int num=0){return("\"trackInsert();trackAddWaypoint();trackPlay(-1,"+num+");\"");}
void CharaCon(string fname="",string chara=""){cEf(" void CS_"+fname+"(int wtv=-1){yINP(\""+chara+"\");} ");}

//Advanced Tracked Techs
int cNumTrackedTechs=0;
void ATT(int unittypeid=0, int techid=0, string unittypenm="", string technm=""){
if(unittypenm>"" && technm>""){cEf(" ATT("+cNumTrackedTechs+",","kbGetUnitTypeID(\""+unittypenm+"\"),kbGetTechID(\""+technm+"\")); ");}
else if(technm>""){cEf(" ATT("+cNumTrackedTechs+",",""+unittypeid+",kbGetTechID(\""+technm+"\")); ");}
else if(unittypenm>""){cEf(" ATT("+cNumTrackedTechs+",","kbGetUnitTypeID(\""+unittypenm+"\"),"+techid+"); ");}
else{
if(techid<0){cEf(" ATT("+cNumTrackedTechs+","+unittypeid+",",""+(-1*techid)+",1); ");}
else{cEf(" ATT("+cNumTrackedTechs+","+unittypeid+",",""+techid+",0); ");}
}
cNumTrackedTechs++;
}

//Advanced Tracked Techs Removal
int cNumTrackedTechsRemoved=0;
void ATTR(int unittypeid=0, int techid=0, string unittypenm="", string technm=""){
if(unittypenm>"" && technm>""){cEf(" ATTR("+cNumTrackedTechsRemoved+",","kbGetUnitTypeID(\""+unittypenm+"\"),kbGetTechID(\""+technm+"\")); ");}
else if(technm>""){cEf(" ATTR("+cNumTrackedTechsRemoved+",",""+unittypeid+",kbGetTechID(\""+technm+"\")); ");}
else if(unittypenm>""){cEf(" ATTR("+cNumTrackedTechsRemoved+",","kbGetUnitTypeID(\""+unittypenm+"\"),"+techid+"); ");}
else{cEf(" ATTR("+cNumTrackedTechsRemoved+","+unittypeid+",",""+techid+"); ");}
cNumTrackedTechsRemoved++;
}

//For tracking x2 and infinite techs
void CKSUM(int checksam=0,int techid=0){
	cEf(" else if(ciksum=="+checksam+"){xsArraySetInt(array,"+techid+",2);} ");
}

string int2DD(int input=0){
if(input<10){return("0"+input);}
return(""+input);
}

string Num2Let(int num=0){
	switch(num){
		case 1: return("a");
		case 2: return("b");
		case 3: return("c");
		case 4: return("d");
		case 5: return("e");
		case 6: return("f");
		case 7: return("g");
		case 8: return("h");
		case 9: return("i");
		case 10: return("j");
		case 11: return("k");
		case 12: return("l");
		case 13: return("m");
		case 14: return("n");
		case 15: return("o");
		case 16: return("p");
		case 17: return("q");
		case 18: return("r");
		case 19: return("s");
		case 20: return("t");
		case 21: return("u");
		case 22: return("v");
		case 23: return("w");
		case 24: return("x");
		case 25: return("y");
		case 26: return("z");
		case 27: return("A");
		case 28: return("B");
		case 29: return("C");
		case 30: return("D");
		case 31: return("E");
		case 32: return("F");
		case 33: return("G");
		case 34: return("H");
		case 35: return("I");
		case 36: return("J");
		case 37: return("K");
		case 38: return("L");
		case 39: return("M");
		case 40: return("N");
		case 41: return("O");
		case 42: return("P");
		case 43: return("Q");
		case 44: return("R");
		case 45: return("S");
		case 46: return("T");
		case 47: return("U");
		case 48: return("V");
		case 49: return("W");
		case 50: return("X");
		case 51: return("Y");
		case 52: return("Z");
		default: return("");
	}
	return("");
}
string configVar(int index=0){
	switch(index){
case 0: return("numLFs");
case 1: return("shpdetailsstarter2");
case 2: return("shpbarstarter2");
case 3: return("shpdetailsstarter4");
case 4: return("shpbarstarter4");
case 5: return("headerstarter");
case 6: return("gstarter");
case 7: return("sbdeadspace");
case 8: return("shpbarlength");
case 9: return("shpbarspacing");
case 10: return("shpdetailsspacing");
case 11: return("reslinespacing");
case 12: return("graphiclength");
case 13: return("Glinewidth");
case 14: return("SectionWidth2");
case 15: return("SectionWidth4");
case 16: return("blanklabelwidth");
case 17: return("Gcellwidth");
case 18: return("dividerW");
case 19: return("dividerJ");
case 20: return("tdividerW");
case 21: return("tdividerJ");
case 22: return("disR1");
case 23: return("disR2");
case 24: return("disR3");
case 25: return("disR4");
case 26: return("disT1");
case 27: return("disT2");
case 28: return("tpsubspacing2");
case 29: return("tpbigspacing2");
case 30: return("tpsubspacing4");
case 31: return("tpbigspacing4");
case 32: return("shpdetailsstarter6");///
case 33: return("shpbarstarter6");
case 34: return("startliner");
case 35: return("newliner");
case 36: return("newdoubleliner");
case 37: return("displayfinetuning");
		default: return("");
	}
	return("");
}
int numconfigvariables=38;

void echoValue(string tobeechoed=""){cEf(" kat(\""+tobeechoed+"=\"+"+tobeechoed+"); ");}

/*[User defined functions end]*/

// Main entry point for random map script

 
void main(void) {
	rmSetStatusText("",0.01);



	bool isObserverMode=false;
	if (isObserverMode == true) {
		isObserverMode=true;
	}

	if (isObserverMode == true) {
		//Decides if it is 1v1, 2v2 or 3v3 obs
		if (rmGetIsFFA() == true || PlayerNum == 2)
		{
			PlayerNum = 2;
			numPlayer = 3;
		}
		else if(rmGetPlayerTeam(2)!=rmGetPlayerTeam(3))
		{
			PlayerNum = 4;
			numPlayer = 5;
		}
		else if(rmGetPlayerTeam(3)!=rmGetPlayerTeam(4))
		{
			PlayerNum = 6;
			numPlayer = 7;
		}
		TeamNum = 2;
	}

   // Picks the map size
//======================================
	int playerTiles=9800;
	if (PlayerNum > 4){
		playerTiles = 8600;
	}else if (PlayerNum > 6){
		playerTiles = 7000;
	}
	
	int size = 2.0 * sqrt(PlayerNum*playerTiles);

	if (cNumberTeams >= 3){
 size = (size*1.3);
}

	rmSetMapSize(size, size);
//======================================

int seasonPick = rmRandInt(1,2);
// 1 = winter, 2 = summer, 3 = spring
// frozen, crossings, flooded



	rmSetMapType("land");
	rmSetSeaLevel(2.0);
	rmSetSeaType("great plains pond");
	string riverType = "great plains pond";
        rmDefineClass("classForest");
		rmDefineClass("classPlateau");
	string treeType = "";
    float flag1 = 0;


   

if (seasonPick == 1){
     rmSetMapType("snow");
        rmSetMapType("saguenay");
       	rmTerrainInitialize("snow");
		rmSetLightingSet("spcic4");
	   rmSetGlobalSnow( 1.0 );
	rmSetWindMagnitude(12.0);
	treeType = "TreeGreatLakesSnow";

}else{
        rmSetMapType("grass");
        rmSetMapType("bayou");
       	rmTerrainInitialize("grass");
		rmSetLightingSet("greatplains");
	treeType = "treeGreatPlains";
}


//=======================================

		//Constraints
		int avoidPlateau=rmCreateClassDistanceConstraint("stuff vs. cliffs", rmClassID("classPlateau"), 17.0);

        int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.44), rmDegreesToRadians(0), rmDegreesToRadians(360));
       
		int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), 24.0);
        int forestConstraintShort=rmCreateClassDistanceConstraint("object vs. forest", rmClassID("classForest"), 4.0);
        
		int avoidHunt=rmCreateTypeDistanceConstraint("hunts avoid hunts", "huntable", 47.0);	

	int avoidHuntShort=rmCreateTypeDistanceConstraint("hunts avoid hunts", "huntable", 15.0);

		int waterHunt = rmCreateTerrainMaxDistanceConstraint("hunts stay near the water", "land", false, 10.0);

        int avoidHerd=rmCreateTypeDistanceConstraint("herds avoid herds", "herdable", 50.0);

		int avoidCoin=rmCreateTypeDistanceConstraint("avoid coin", "Mine", 10.0);
        int avoidCoinMed=rmCreateTypeDistanceConstraint("avoid coin medium", "Mine", 45.0);
        int avoidWaterShort = rmCreateTerrainDistanceConstraint("avoid water short 2", "Land", false, 8.0);
        int avoidWater1 = rmCreateTerrainDistanceConstraint("avoid water", "Land", false, 20.0);

        int avoidTradeRouteSmall = rmCreateTradeRouteDistanceConstraint("objects avoid trade route small", 8.0);
        int avoidSocket=rmCreateClassDistanceConstraint("socket avoidance", rmClassID("socketClass"), 25.0);
        
		int avoidTownCenter=rmCreateTypeDistanceConstraint("avoid Town Center", "townCenter", 26.0);
        int avoidTownCenterSmall=rmCreateTypeDistanceConstraint("avoid Town Center small", "townCenter", 15.0);
        int avoidTownCenterMore=rmCreateTypeDistanceConstraint("avoid Town Center more", "townCenter", 36.0);  

int treasureDist = 0;

if (seasonPick == 1){   
   treasureDist = 50;
}else{
	treasureDist = 60;
}
		int avoidNugget=rmCreateTypeDistanceConstraint("nugget avoid nugget", "AbstractNugget", treasureDist);



int stayWest = rmCreatePieConstraint("Stay West",0.47,0.53, rmXFractionToMeters(0.2),rmXFractionToMeters(0.5), rmDegreesToRadians(225),rmDegreesToRadians(45));
int stayEast = rmCreatePieConstraint("Stay East",0.53,0.47, rmXFractionToMeters(0.2),rmXFractionToMeters(0.5), rmDegreesToRadians(45),rmDegreesToRadians(225));

   
 	//===== Player placing  ============

	int teamZeroCount = rmGetNumberPlayersOnTeam(0);
	int teamOneCount = rmGetNumberPlayersOnTeam(1);

	if (isObserverMode == true)
	{
		teamZeroCount = PlayerNum/2;
		teamOneCount = PlayerNum/2;

		// Set up player starting locations.
		if (rmGetPlayerTeam(1)!=rmGetPlayerTeam(2))
		{ //1v1
			rmSetRandomSpawn1v1(0.5, 0.8,  0.5, 0.2);
		}
		else if (rmGetPlayerTeam(2)!=rmGetPlayerTeam(3))
		{ // 2v2
			rmSetRandomSpawn2v2(0.45, 0.75, 0.25, 0.55,  0.55, 0.25, 0.75, 0.45);
		}
		else if (rmGetPlayerTeam(3)!=rmGetPlayerTeam(4))
		{ // 3v3
			rmSetRandomSpawn3v3(0.15, 0.45, 0.55, 0.85, 0.35, 0.65,    0.85, 0.55, 0.45, 0.15, 0.65, 0.35);
		}
	}
	else {



    float spawnSwitch = rmRandFloat(0,1.2);
//for testing purposes
//spawnSwitch = (0.1);


	if (TeamNum == 2){
		if (spawnSwitch <=0.6){

	if (PlayerNum == 2)
	{
			rmPlacePlayer(1, 0.5, 0.8);
			rmPlacePlayer(2, 0.5, 0.2);
	}

	if (PlayerNum == 4)
	{			
		rmSetPlacementTeam(0);
		rmPlacePlayersLine(0.45, 0.75, 0.25, 0.55, 0, 0);
		rmSetPlacementTeam(1);
		rmPlacePlayersLine(0.55, 0.25, 0.75, 0.45, 0, 0);

	}


			rmSetPlacementTeam(0);
			rmPlacePlayersLine(0.15, 0.45, 0.55, 0.85, 0, 0);
			rmSetPlacementTeam(1);
			rmPlacePlayersLine(0.85, 0.55, 0.45, 0.15, 0, 0);
		}else if(spawnSwitch <=1.2){

	if (PlayerNum == 2)
	{
			rmPlacePlayer(2, 0.5, 0.8);
			rmPlacePlayer(1, 0.5, 0.2);
	}

	if (PlayerNum == 4)
	{			
		rmSetPlacementTeam(1);
		rmPlacePlayersLine(0.45, 0.75, 0.24, 0.54, 0, 0);
		rmSetPlacementTeam(0);
		rmPlacePlayersLine(0.54, 0.24, 0.75, 0.45, 0, 0);

	}


			rmSetPlacementTeam(1);
			rmPlacePlayersLine(0.15, 0.45, 0.55, 0.85, 0, 0);
			rmSetPlacementTeam(0);
			rmPlacePlayersLine(0.85, 0.55, 0.45, 0.15, 0, 0);
		}
	}else{
	
			rmPlacePlayer(1, 0.15, 0.45);
			rmPlacePlayer(2, 0.85, 0.55);
			rmPlacePlayer(3, 0.45, 0.15);
			rmPlacePlayer(4, 0.55, 0.85);

	if (PlayerNum == 5){
			rmPlacePlayer(5, 0.35, 0.65);
}
	if (PlayerNum == 6){
			rmPlacePlayer(5, 0.35, 0.65);
			rmPlacePlayer(6, 0.65, 0.35);
}
	if (PlayerNum == 7){
			rmPlacePlayer(5, 0.35, 0.65);
			rmPlacePlayer(6, 0.58, 0.28);
			rmPlacePlayer(7, 0.71, 0.41);

}
	if (PlayerNum == 8){
			rmPlacePlayer(5, 0.41, 0.71);
			rmPlacePlayer(6, 0.58, 0.28);
			rmPlacePlayer(7, 0.71, 0.41);
			rmPlacePlayer(8, 0.28, 0.58);
}
	}
}    

//=======================================================
		
        chooseMercs();
        rmSetStatusText("",0.1); 

//=======================================================

// Begin Map


        int continent2 = rmCreateArea("continent");
        rmSetAreaSize(continent2, 1.0, 1.0);
        rmSetAreaLocation(continent2, 0.5, 0.5);

if (seasonPick == 1){
		rmSetAreaMix(continent2, "yukon snow");
}else{
        rmSetAreaTerrainType(continent2, "great_plains\ground5_gp");
}
        rmSetAreaBaseHeight(continent2, -1.0);
        rmSetAreaCoherence(continent2, 1.0);
        rmSetAreaSmoothDistance(continent2, 10);
        rmSetAreaHeightBlend(continent2, 1);
        rmSetAreaElevationNoiseBias(continent2, 0);
        rmSetAreaElevationEdgeFalloffDist(continent2, 10);
        rmSetAreaElevationVariation(continent2, 5);
        rmSetAreaElevationPersistence(continent2, .2);
        rmSetAreaElevationOctaves(continent2, 5);
        rmSetAreaElevationMinFrequency(continent2, 0.04);
        rmSetAreaElevationType(continent2, cElevTurbulence);  
        rmBuildArea(continent2);  
  
//===================================================

		int classPatch = rmDefineClass("patch");
		int avoidPatch = rmCreateClassDistanceConstraint("avoid patch", rmClassID("patch"), 22.0);
		int classCenter = rmDefineClass("center");
		int avoidCenter = rmCreateClassDistanceConstraint("avoid center", rmClassID("center"), 3.0);
		int circleConstraint2=rmCreatePieConstraint("circle Constraint2", 0.5, 0.5, 0, rmZFractionToMeters(0.48), rmDegreesToRadians(0), rmDegreesToRadians(360));


//get that centre section the right version

        int forest = rmCreateArea("TreeStripe");

if (seasonPick == 1){
        rmSetAreaLocation(forest, 0.5, 0.5);
        rmSetAreaTerrainType(forest, "yukon\groundforestsnow_yuk");
       rmAddAreaInfluenceSegment(forest, 0.0, 0.0, 1.0, 1.0);
        rmSetAreaSize(forest, .31, .33);      

        rmSetAreaBaseHeight(forest, -1.0);
        rmSetAreaCoherence(forest, 0.79);
        rmSetAreaSmoothDistance(forest, 10);
        rmSetAreaHeightBlend(forest, 1);
        rmBuildArea(forest);    
}
if (seasonPick == 2){
        rmSetAreaLocation(forest, 0.5, 0.5);
        rmSetAreaTerrainType(forest, "great plains drygrass");
  	rmSetAreaMix(forest, "great plains drygrass");
       rmAddAreaInfluenceSegment(forest, 0.0, 0.0, 1.0, 1.0);
        rmSetAreaSize(forest, .39, .46);      
        rmSetAreaBaseHeight(forest, -2.0);
        rmSetAreaCoherence(forest, 0.79);
        rmSetAreaSmoothDistance(forest, 10);
        rmSetAreaHeightBlend(forest, 1);
        rmBuildArea(forest);    
}
if (seasonPick == 3){
        rmSetAreaLocation(forest, 0.5, 0.5);
        rmSetAreaTerrainType(forest, "great_plains\groundforest_gp");
       rmAddAreaInfluenceSegment(forest, 0.0, 0.0, 1.0, 1.0);
        rmSetAreaSize(forest, .31, .33);      

        rmSetAreaBaseHeight(forest, -2.0);
        rmSetAreaCoherence(forest, 0.79);
        rmSetAreaSmoothDistance(forest, 10);
        rmSetAreaHeightBlend(forest, 1);
        rmBuildArea(forest);    
}


		rmSetStatusText("",0.2);



	//==============trade routes===================


		int socketID=rmCreateObjectDef("sockets to dock Trade Posts");
        rmAddObjectDefItem(socketID, "SocketTradeRoute", 1, 0.0);
        rmSetObjectDefAllowOverlap(socketID, true);
        rmSetObjectDefMinDistance(socketID, 0.0);
        rmSetObjectDefMaxDistance(socketID, 6.0);      
       
        int tradeRouteID = rmCreateTradeRoute();
        rmSetObjectDefTradeRouteID(socketID, tradeRouteID);
		rmAddTradeRouteWaypoint(tradeRouteID, .05, .5);
		rmAddTradeRouteWaypoint(tradeRouteID, .3, .7);
		rmAddTradeRouteWaypoint(tradeRouteID, .5, 0.95);

        rmBuildTradeRoute(tradeRouteID, "dirt");
 
        vector socketLoc1 = rmGetTradeRouteWayPoint(tradeRouteID, 0.25);
        rmPlaceObjectDefAtPoint(socketID, 0, socketLoc1);
		socketLoc1 = rmGetTradeRouteWayPoint(tradeRouteID, 0.75);
        rmPlaceObjectDefAtPoint(socketID, 0, socketLoc1);

	if (PlayerNum >= 6)
	{

		socketLoc1 = rmGetTradeRouteWayPoint(tradeRouteID, 0.5);
        rmPlaceObjectDefAtPoint(socketID, 0, socketLoc1);
}		
		//===========TR 2=================

		int socketID2=rmCreateObjectDef("sockets to dock Trade Posts2");
        rmAddObjectDefItem(socketID2, "SocketTradeRoute", 1, 0.0);
        rmSetObjectDefAllowOverlap(socketID2, true);
        rmSetObjectDefMinDistance(socketID2, 0.0);
        rmSetObjectDefMaxDistance(socketID2, 6.0);      
       
        int tradeRouteID2 = rmCreateTradeRoute();
        rmSetObjectDefTradeRouteID(socketID2, tradeRouteID2);
		rmAddTradeRouteWaypoint(tradeRouteID2, .95, .5);
		rmAddTradeRouteWaypoint(tradeRouteID2, .7, .3);
		rmAddTradeRouteWaypoint(tradeRouteID2, .5, .05);

        rmBuildTradeRoute(tradeRouteID2, "dirt");
 
		vector socketLoc2 = rmGetTradeRouteWayPoint(tradeRouteID2, 0.25);
        rmPlaceObjectDefAtPoint(socketID2, 0, socketLoc2);
	if (PlayerNum >= 6)
	{
            socketLoc2 = rmGetTradeRouteWayPoint(tradeRouteID2, 0.50);
        rmPlaceObjectDefAtPoint(socketID2, 0, socketLoc2);
   }    
        socketLoc2 = rmGetTradeRouteWayPoint(tradeRouteID2, 0.75);
        rmPlaceObjectDefAtPoint(socketID2, 0, socketLoc2);
       		
	//====================end tr 2================		 

//=======================THE RIVER==========================
				
if (seasonPick == 1){
//dat frozen river

		int frozenRiver=rmCreateArea("frozenRiver");
        rmSetAreaLocation(frozenRiver, 0.5, 0.5);
        rmAddAreaInfluenceSegment(frozenRiver, 0.0, 0.0, 1.0, 1.0);
        rmSetAreaSize(frozenRiver, .18, .21);  
		rmAddAreaToClass(frozenRiver, rmClassID("classPlateau"));
	rmSetAreaMix(frozenRiver, "great_lakes_ice");
        rmSetAreaBaseHeight(frozenRiver, -3.5);
        rmSetAreaCoherence(frozenRiver, .96);
        rmBuildArea(frozenRiver);

   int stayIce = rmCreateAreaConstraint("river constraint", frozenRiver);



//thawed spots
	for (j=0; < (5*PlayerNum)) {   

  //  float Thawed1 = rmRandFloat(0.1,0.9);



	int puddleOne=rmCreateArea("first thawed spot"+j);
     //   rmSetAreaLocation(puddleOne, Thawed1, Thawed1);
        rmSetAreaSize(puddleOne, rmAreaTilesToFraction(92), rmAreaTilesToFraction(107));      
        rmSetAreaWaterType(puddleOne, "great lakes ice");
	rmAddAreaConstraint(puddleOne, avoidWater1);
	rmAddAreaConstraint(puddleOne, stayIce);

        rmSetAreaCoherence(puddleOne, .84);
        rmBuildArea(puddleOne);
}

}


if (seasonPick == 2){
	//dat river

	int riverID = rmRiverCreate(-5, riverType, 8, 8, (11+PlayerNum/2), (13+PlayerNum/2)); //
	rmRiverAddWaypoint(riverID, 0.0, 0.0);
	rmRiverAddWaypoint(riverID, 0.5, 0.5);
	rmRiverAddWaypoint(riverID, 1.0, 1.0);
//	rmRiverAddWaypoint(riverID, 0.7, 0.3);
//	rmRiverAddWaypoint(riverID, 1.0, 0.0);
	rmRiverSetBankNoiseParams(riverID, 0.07, 2, 15.0, 15.0, 0.667, 1.8);
	rmRiverSetShallowRadius(riverID, 11+PlayerNum*1.3);
	if (PlayerNum >= 6)
	{
		rmRiverAddShallow(riverID, 0.2);
		rmRiverAddShallow(riverID, 0.4);
		rmRiverAddShallow(riverID, 0.6);
		rmRiverAddShallow(riverID, 0.8);
	}
	else
	{
		rmRiverAddShallow(riverID, rmRandFloat(0.25,0.3));
		rmRiverAddShallow(riverID, rmRandFloat(0.49,0.51));
		rmRiverAddShallow(riverID, rmRandFloat(0.7,0.75));
	}
	rmRiverBuild(riverID);


       		for (i=0; < PlayerNum*125){
			int patchID = rmCreateArea("first patch"+i);
			rmSetAreaWarnFailure(patchID, false);
			rmSetAreaSize(patchID, rmAreaTilesToFraction(55), rmAreaTilesToFraction(68));
        rmSetAreaTerrainType(patchID, "great_plains\ground4_gp");
	//		rmAddAreaToClass(patchID, rmClassID("patch"));
			rmSetAreaSmoothDistance(patchID, 1.0);
			rmBuildArea(patchID); 
		}



}

if (seasonPick == 3){
//dat flooded river

		int straightLake=rmCreateArea("straightLake");
        rmSetAreaLocation(straightLake, 0.5, 0.5);
        rmAddAreaInfluenceSegment(straightLake, 0.0, 0.0, 1.0, 1.0);
        rmSetAreaSize(straightLake, .21, .22);      
        rmSetAreaWaterType(straightLake, "Texas Pond");
        rmSetAreaBaseHeight(straightLake, -1.0);
        rmSetAreaCoherence(straightLake, .83);
        rmBuildArea(straightLake);
}
	

//=============KOTH================

	if (rmGetIsKOTH()) {
		float xLoc = 0.5;
		float yLoc = 0.5;
		float walk = 0.01;

if (seasonPick == 1){
		ypKingsHillLandfill(xLoc, yLoc, 0.0054, 1.5, "yukon snow", 0);

}else{
		ypKingsHillLandfill(xLoc, yLoc, 0.0054, 1.5, "great plains drygrass", 0);
}
		ypKingsHillPlacer(xLoc, yLoc, walk, 0);
	}



	
//=============================================================

// BUILD NATIVE SITES

//yeah its always cheyenne

	//Choose Natives
	int subCiv0=-1;
	int subCiv1=-1;
	int subCiv2=-1;
	int subCiv3=-1;

   if (rmAllocateSubCivs(4) == true)
   {
      subCiv0=rmGetCivID("Cheyenne");
      rmEchoInfo("subCiv0 is Cheyenne "+subCiv0);
      if (subCiv0 >= 0)
         rmSetSubCiv(0, "Cheyenne");

		subCiv1=rmGetCivID("Cheyenne");
      rmEchoInfo("subCiv1 is Cheyenne "+subCiv1);
		if (subCiv1 >= 0)
			 rmSetSubCiv(1, "Cheyenne");
	 
		subCiv2=rmGetCivID("Cheyenne");
      rmEchoInfo("subCiv2 is Cheyenne "+subCiv2);
      if (subCiv2 >= 0)
         rmSetSubCiv(2, "Cheyenne");

		subCiv3=rmGetCivID("Cheyenne");
      rmEchoInfo("subCiv3 is Cheyenne "+subCiv3);
      if (subCiv3 >= 0)
         rmSetSubCiv(3, "Cheyenne");
	}
	
	// Set up Natives	
	int nativeID0 = -1;
    int nativeID1 = -1;
	int nativeID2 = -1;
    int nativeID3 = -1;
		
	nativeID0 = rmCreateGrouping("Cheyenne village A", "native cheyenne village "+2);
    rmSetGroupingMinDistance(nativeID0, 0.00);
    rmSetGroupingMaxDistance(nativeID0, 0.00);
	rmAddGroupingToClass(nativeID0, rmClassID("natives"));
	rmPlaceGroupingAtLoc(nativeID0, 0, 0.2, 0.8);

	nativeID1 = rmCreateGrouping("Cheyenne village B", "native cheyenne village "+5);
    rmSetGroupingMinDistance(nativeID1, 0.00);
    rmSetGroupingMaxDistance(nativeID1, 0.00);
	rmAddGroupingToClass(nativeID1, rmClassID("natives"));
	rmPlaceGroupingAtLoc(nativeID1, 0, 0.8, 0.2);
	
//=======================================================

		rmSetStatusText("",0.4);

//=======================================================

		//starting objects


		
        int playerStart = rmCreateStartingUnitsObjectDef(5.0);
        rmSetObjectDefMinDistance(playerStart, 7.0);
        rmSetObjectDefMaxDistance(playerStart, 12.0);
	rmAddObjectDefConstraint(playerStart, avoidWaterShort);

       
        int goldID = rmCreateObjectDef("starting gold");
        rmAddObjectDefItem(goldID, "mine", 1, 3.0);
        rmSetObjectDefMinDistance(goldID, 9.0);
        rmSetObjectDefMaxDistance(goldID, 10.0);
       
        int goldID2 = rmCreateObjectDef("starting gold 2");
        rmAddObjectDefItem(goldID2, "mine", 1, 16.0);
        rmSetObjectDefMinDistance(goldID2, 12.0);
        rmSetObjectDefMaxDistance(goldID2, 12.0);
        rmAddObjectDefConstraint(goldID2, avoidCoin);
 
        int berryID = rmCreateObjectDef("starting berries");
        rmAddObjectDefItem(berryID, "BerryBush", 8, 6.0);
        rmSetObjectDefMinDistance(berryID, 8.0);
        rmSetObjectDefMaxDistance(berryID, 12.0);
        rmAddObjectDefConstraint(berryID, avoidCoin);
 
        int treeID = rmCreateObjectDef("starting trees");
        rmAddObjectDefItem(treeID, treeType, rmRandInt(6,9), 10.0);
        rmSetObjectDefMinDistance(treeID, 12.0);
        rmSetObjectDefMaxDistance(treeID, 18.0);
        rmAddObjectDefConstraint(treeID, avoidTownCenterSmall);
        rmAddObjectDefConstraint(treeID, avoidCoin);
 
        int foodID = rmCreateObjectDef("starting hunt");
        rmAddObjectDefItem(foodID, "bison", 8, 8.0);
        rmSetObjectDefMinDistance(foodID, 10.0);
        rmSetObjectDefMaxDistance(foodID, 10.0);
	rmAddObjectDefConstraint(foodID, avoidPlateau);	
	rmAddObjectDefConstraint(foodID, avoidWaterShort);	
        rmSetObjectDefCreateHerd(foodID, true);
 
        int foodID2 = rmCreateObjectDef("starting hunt 2");
        rmAddObjectDefItem(foodID2, "deer", 7, 5.0);
        rmSetObjectDefMinDistance(foodID2, 30.0);
        rmSetObjectDefMaxDistance(foodID2, 30.0);
	rmAddObjectDefConstraint(foodID2, avoidPlateau);
	rmAddObjectDefConstraint(foodID2, avoidWaterShort);		
        rmSetObjectDefCreateHerd(foodID2, true);
                       
		int foodID3 = rmCreateObjectDef("starting hunt 3");
        rmAddObjectDefItem(foodID3, "bison", 8, 8.0);
        rmSetObjectDefMinDistance(foodID3, 38.0);
        rmSetObjectDefMaxDistance(foodID3, 38.0);
	rmAddObjectDefConstraint(foodID3, avoidPlateau);
	rmAddObjectDefConstraint(foodID3, avoidWaterShort);
	rmAddObjectDefConstraint(foodID3, avoidHuntShort);	
        rmSetObjectDefCreateHerd(foodID3, true);

		int extraberrywagon=rmCreateObjectDef("JapAn cAnT hUnT");
  rmAddObjectDefItem(extraberrywagon, "ypBerryWagon1", 1, 0.0);
  rmSetObjectDefMinDistance(extraberrywagon, 6.0);
  rmSetObjectDefMaxDistance(extraberrywagon, 7.0);




		rmSetStatusText("",0.5); 

//place those TCs
     
    for(i=1; < PlayerNum + 1) {
		int id=rmCreateArea("Player"+i);
		rmSetPlayerArea(i, id);
		int startID = rmCreateObjectDef("object"+i);
		rmAddObjectDefItem(startID, "TownCenter", 1, 2.0);
		rmSetObjectDefMinDistance(startID, 0.0);
        rmSetObjectDefMaxDistance(startID, 2.0);
		rmPlaceObjectDefAtLoc(startID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
//        rmPlaceObjectDefAtLoc(berryID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(treeID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(goldID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        //rmPlaceObjectDefAtLoc(goldID2, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID2, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID3, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(playerStart, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));


if (rmGetPlayerCiv(i) == rmGetCivID("Japanese")) {
        rmPlaceObjectDefAtLoc(extraberrywagon, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        }
if (seasonPick == 3){
   flag1 = (rmPlayerLocXFraction(i)+rmPlayerLocZFraction(i))/2;

		int waterFlag = rmCreateObjectDef("HC water flag "+i);
         rmAddObjectDefItem(waterFlag, "HomeCityWaterSpawnFlag", 1, 5.0);
         rmSetObjectDefMinDistance(waterFlag, 0);
         rmSetObjectDefMaxDistance(waterFlag, 20);
         rmPlaceObjectDefAtLoc(waterFlag, i, flag1, flag1, 1);
}

	}
	rmSetStatusText("",0.6);
	/*
	==================
	resource placement
	==================
	*/


	   int avoidAll=rmCreateTypeDistanceConstraint("avoid all", "all", 11.0);

	if (PlayerNum == 2)
{
  	int smollMines = rmCreateObjectDef("competitive gold");
	rmAddObjectDefItem(smollMines, "mine", 1, 1.0);
	rmSetObjectDefMinDistance(smollMines, 0.0);
	rmSetObjectDefMaxDistance(smollMines, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.4, 0.06, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.6, 0.94, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.64, 0.36, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.36, 0.64, 1);

	rmPlaceObjectDefAtLoc(smollMines, 0, 0.16, 0.76, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.74, 0.14, 1);

}


    int pronghornHunts = rmCreateObjectDef("pronghornHunts");
	rmAddObjectDefItem(pronghornHunts, "bison", rmRandInt(9,10), 14.0);
	rmSetObjectDefCreateHerd(pronghornHunts, true);
	rmSetObjectDefMinDistance(pronghornHunts, 0);
	rmSetObjectDefMaxDistance(pronghornHunts, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(pronghornHunts, circleConstraint);
//	rmAddObjectDefConstraint(pronghornHunts, avoidTownCenterMore);
	rmAddObjectDefConstraint(pronghornHunts, avoidHunt);		rmAddObjectDefConstraint(pronghornHunts, avoidWaterShort);	
//	rmAddObjectDefConstraint(pronghornHunts, avoidPlateau);	
	rmPlaceObjectDefAtLoc(pronghornHunts, 0, 0.5, 0.5, 8*PlayerNum);






  	int eastmine = rmCreateObjectDef("east mines");
	rmAddObjectDefItem(eastmine, "mine", 1, 1.0);
	rmSetObjectDefMinDistance(eastmine, 0.0);
	rmSetObjectDefMaxDistance(eastmine, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(eastmine, avoidCoinMed);
	//rmAddObjectDefConstraint(eastmine, avoidTownCenterMore);
	rmAddObjectDefConstraint(eastmine, avoidSocket);
	rmAddObjectDefConstraint(eastmine, avoidPlateau);	
	rmAddObjectDefConstraint(eastmine, avoidWaterShort);
	rmAddObjectDefConstraint(eastmine, forestConstraintShort);
rmAddObjectDefConstraint(eastmine, stayEast);
	rmAddObjectDefConstraint(eastmine, circleConstraint);
	rmPlaceObjectDefAtLoc(eastmine, 0, 0.5, 0.5, 2*PlayerNum);
 
  	int westmine = rmCreateObjectDef("west mines");
	rmAddObjectDefItem(westmine, "mine", 1, 1.0);
	rmSetObjectDefMinDistance(westmine, 0.0);
	rmSetObjectDefMaxDistance(westmine, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(westmine, avoidCoinMed);
	//rmAddObjectDefConstraint(westmine, avoidTownCenterMore);
	rmAddObjectDefConstraint(westmine, avoidSocket);
	rmAddObjectDefConstraint(westmine, avoidPlateau);	
	rmAddObjectDefConstraint(westmine, avoidWaterShort);
	rmAddObjectDefConstraint(westmine, forestConstraintShort);
rmAddObjectDefConstraint(westmine, stayWest);
	rmAddObjectDefConstraint(westmine, circleConstraint);
	rmPlaceObjectDefAtLoc(westmine, 0, 0.5, 0.5, 2*PlayerNum);

	rmSetStatusText("",0.7);


//add winter stronk nuggs & sheep
if (seasonPick == 1){

	int westNuggs= rmCreateObjectDef("nuggets for west"); 
	rmAddObjectDefItem(westNuggs, "Nugget", 1, 0.0); 
	rmSetObjectDefMinDistance(westNuggs, 0.0); 
	rmSetObjectDefMaxDistance(westNuggs, rmXFractionToMeters(0.5)); 
	rmAddObjectDefConstraint(westNuggs, avoidNugget); 
	rmAddObjectDefConstraint(westNuggs, circleConstraint);
	rmAddObjectDefConstraint(westNuggs, avoidTownCenter);
	rmAddObjectDefConstraint(westNuggs, forestConstraintShort);
	rmAddObjectDefConstraint(westNuggs, avoidTradeRouteSmall);
	rmAddObjectDefConstraint(westNuggs, avoidPlateau); 
	rmAddObjectDefConstraint(westNuggs, stayWest);	
	rmAddObjectDefConstraint(westNuggs, avoidCoin);	
	rmSetNuggetDifficulty(3, 3); 
	rmPlaceObjectDefAtLoc(westNuggs, 0, 0.5, 0.5, 4*PlayerNum);   

	int eastNuggs= rmCreateObjectDef("nuggets for east"); 
	rmAddObjectDefItem(eastNuggs, "Nugget", 1, 0.0); 
	rmSetObjectDefMinDistance(eastNuggs, 0.0); 
	rmSetObjectDefMaxDistance(eastNuggs, rmXFractionToMeters(0.5)); 
	rmAddObjectDefConstraint(eastNuggs, avoidNugget); 
	rmAddObjectDefConstraint(eastNuggs, circleConstraint);
	rmAddObjectDefConstraint(eastNuggs, avoidTownCenter);
	rmAddObjectDefConstraint(eastNuggs, forestConstraintShort);
	rmAddObjectDefConstraint(eastNuggs, avoidTradeRouteSmall);
	rmAddObjectDefConstraint(eastNuggs, avoidPlateau); 
	rmAddObjectDefConstraint(eastNuggs, stayEast);	
	rmAddObjectDefConstraint(eastNuggs, avoidCoin);	
	rmSetNuggetDifficulty(3, 3); 
	rmPlaceObjectDefAtLoc(eastNuggs, 0, 0.5, 0.5, 4*PlayerNum);   

  	int lostSheepers = rmCreateObjectDef("sad sheep");
	rmAddObjectDefItem(lostSheepers, "sheep", rmRandInt(1,1), 7.0);
	rmSetObjectDefMinDistance(lostSheepers, 0.0);
	rmSetObjectDefMaxDistance(lostSheepers, rmXFractionToMeters(0.5));
//	rmAddObjectDefConstraint(lostSheepers, avoidCoin);
	rmAddObjectDefConstraint(lostSheepers, avoidTownCenterMore);
	rmAddObjectDefConstraint(lostSheepers, avoidSocket);
	rmAddObjectDefConstraint(lostSheepers, avoidHerd);
//	rmAddObjectDefConstraint(lostSheepers, forestConstraintShort);
	rmAddObjectDefConstraint(lostSheepers, avoidPlateau);	
	rmAddObjectDefConstraint(lostSheepers, circleConstraint);
	rmPlaceObjectDefAtLoc(lostSheepers, 0, 0.5, 0.5, 5*PlayerNum);

}

	int nuggetID= rmCreateObjectDef("nugget"); 
	rmAddObjectDefItem(nuggetID, "Nugget", 1, 0.0); 
	rmSetObjectDefMinDistance(nuggetID, 0.0); 
	rmSetObjectDefMaxDistance(nuggetID, rmXFractionToMeters(0.5)); 
	rmAddObjectDefConstraint(nuggetID, avoidNugget); 
	rmAddObjectDefConstraint(nuggetID, circleConstraint);
	rmAddObjectDefConstraint(nuggetID, avoidTownCenter);
	rmAddObjectDefConstraint(nuggetID, forestConstraintShort);
	rmAddObjectDefConstraint(nuggetID, avoidTradeRouteSmall);
	rmAddObjectDefConstraint(nuggetID, avoidSocket); 
	rmAddObjectDefConstraint(nuggetID, avoidWaterShort);	
	rmAddObjectDefConstraint(nuggetID, avoidCoin);	
	rmAddObjectDefConstraint(nuggetID, avoidPlateau); 
	rmSetNuggetDifficulty(1, 2); 
	rmPlaceObjectDefAtLoc(nuggetID, 0, 0.5, 0.5, 5*PlayerNum);   



	rmSetStatusText("",0.8);
	//removes loop for faster loading times
	//for (j=0; < (6*PlayerNum)) {   
		int mapTrees=rmCreateObjectDef("map trees");
		rmAddObjectDefItem(mapTrees, treeType, rmRandInt(12,15), rmRandFloat(12.0,13.0));
		rmAddObjectDefToClass(mapTrees, rmClassID("classForest")); 
		rmSetObjectDefMinDistance(mapTrees, 0);
		rmSetObjectDefMaxDistance(mapTrees, rmXFractionToMeters(0.47));
//		rmAddObjectDefConstraint(mapTrees, avoidTradeRouteSmall);
	//	rmAddObjectDefConstraint(mapTrees, avoidSocket);
	//  	rmAddObjectDefConstraint(mapTrees, circleConstraint);
		rmAddObjectDefConstraint(mapTrees, forestConstraint);
		rmAddObjectDefConstraint(mapTrees, avoidTownCenterMore);	
		rmAddObjectDefConstraint(mapTrees, avoidCoin);	
		rmAddObjectDefConstraint(mapTrees, avoidPlateau);	
		rmAddObjectDefConstraint(mapTrees, avoidWaterShort);	
		rmPlaceObjectDefAtLoc(mapTrees, 0, 0.5, 0.5, 100*PlayerNum);
	//}
		rmSetStatusText("",0.9);


	int geyserID=rmCreateGrouping("Geysers", "prop_geyser");
	rmSetGroupingMinDistance(geyserID, 0.0);
	rmSetGroupingMaxDistance(geyserID, rmXFractionToMeters(0.5));
	rmAddGroupingToClass(geyserID, rmClassID("classPlateau"));
	rmAddGroupingConstraint(geyserID, avoidAll);
	rmAddGroupingConstraint(geyserID, avoidTownCenterMore);
	rmAddGroupingConstraint(geyserID, avoidSocket);
	rmAddGroupingConstraint(geyserID, avoidPlateau);
	rmAddGroupingConstraint(geyserID, avoidWaterShort);
	rmAddGroupingConstraint(geyserID, circleConstraint);
	rmPlaceGroupingAtLoc(geyserID, 0, 0.5, 0.5, 4);


if (seasonPick == 3){

	int fishVsFishID=rmCreateTypeDistanceConstraint("fish v fish", "fishSalmon", 12.0);
	int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 5.0);

	int fishID=rmCreateObjectDef("fish Mahi");
	rmAddObjectDefItem(fishID, "fishSalmon", 1, 0.0);
	rmSetObjectDefMinDistance(fishID, 0.0);
	rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(fishID, fishVsFishID);
	rmAddObjectDefConstraint(fishID, fishLand);
	rmPlaceObjectDefAtLoc(fishID, 0, 0.5, 0.5, 8*PlayerNum);
	}


if (seasonPick == 2){
		int Props =rmCreateObjectDef("decor");
		rmAddObjectDefItem(Props, "UnderbrushTexasGrass", rmRandInt(2,3), rmRandFloat(4.0,5.0));
		rmSetObjectDefMinDistance(Props, 0);
		rmSetObjectDefMaxDistance(Props, rmXFractionToMeters(0.47));
		rmPlaceObjectDefAtLoc(Props, 0, 0.5, 0.5, 30*cNumberNonGaiaPlayers);
}



	rmSetStatusText("",0.99);



if (isObserverMode == true)
{
/*[Special features start]*/

//For 1v1 to 3v3 Obs only
int cNumNonObsPlayers=2;
int cTeamSize=1;

//Logic for type of obs, on assumption of tvb.
if(rmGetPlayerTeam(1)!=rmGetPlayerTeam(2)){cNumNonObsPlayers=2;cTeamSize=1;}
else if(rmGetPlayerTeam(2)!=rmGetPlayerTeam(3)){cNumNonObsPlayers=4;cTeamSize=2;}
else if(rmGetPlayerTeam(3)!=rmGetPlayerTeam(4)){cNumNonObsPlayers=6;cTeamSize=3;}

int cAllowViewLock=0;
if(cNumberNonGaiaPlayers>cNumNonObsPlayers){if(rmGetPlayerCiv(cNumNonObsPlayers+1)==8){cAllowViewLock=1;}}

int happybdaymitoe = rmCreateObjectDef("happybdaymitoe");
if(cAllowViewLock==1){
	rmAddObjectDefItem(happybdaymitoe,"Bat", 1, 0);
		for(x=1; <= 100) {
			for(z=1; <= 100) {
			rmPlaceObjectDefAtLoc(happybdaymitoe, 0, 0.01*z, 0.01*x, 1);
			}
		}
}

//As of 2.07 we assume that teams are assigned as TvB, and proceed accordingly to deduce if it is 1v1,2v2 or 3v3.
if(true){
//These 'fakes' store the 'real' value of the player id being referenced.
//TvB makes it irrelevant, but kept here for reference.
int fakeP1=1;
int fakeP2=2;
int fakeP3=3;
int fakeP4=4;
int fakeP5=5;
int fakeP6=6;
int fakeTemp=0;

rmSetIgnoreForceToGaia(true);
	int BCOSIMBATMAN = rmCreateObjectDef("BCOSIMBATMAN");
	rmAddObjectDefItem(BCOSIMBATMAN,"Bat", 1, 1.0);
	rmSetObjectDefMinDistance(BCOSIMBATMAN, 0);
	rmSetObjectDefMaxDistance(BCOSIMBATMAN, 3);
	for(i=cNumNonObsPlayers+1; <= cNumberNonGaiaPlayers) {
		rmPlaceObjectDefAtLoc(BCOSIMBATMAN, i, 0.985, 0.45+0.01*i, 1);
	}

//This says X and Z though in reality it's more like standard cartesian X and Y.
float fakeP1X_Loc=unscaledXLoc(fakeP1);float fakeP1Z_Loc=unscaledZLoc(fakeP1);

float fakeP2X_Loc=unscaledXLoc(fakeP2);float fakeP2Z_Loc=unscaledZLoc(fakeP2);

float fakeP3X_Loc=unscaledXLoc(fakeP3);float fakeP3Z_Loc=unscaledZLoc(fakeP3);

float fakeP4X_Loc=unscaledXLoc(fakeP4);float fakeP4Z_Loc=unscaledZLoc(fakeP4);

float fakeP5X_Loc=unscaledXLoc(fakeP5);float fakeP5Z_Loc=unscaledZLoc(fakeP5);

float fakeP6X_Loc=unscaledXLoc(fakeP6);float fakeP6Z_Loc=unscaledZLoc(fakeP6);

//Possible to streamline this??
if(cNumNonObsPlayers==2){
if(fakeP1X_Loc<=fakeP2X_Loc){RealP1FromWest=fakeP1; RealP2FromWest=fakeP2;}else{RealP1FromWest=fakeP2; RealP2FromWest=fakeP1;}
if(fakeP1Z_Loc>=fakeP2Z_Loc){RealP1FromNorth=fakeP1; RealP2FromNorth=fakeP2;}else{RealP1FromNorth=fakeP2; RealP2FromNorth=fakeP1;}
}
else if(cNumNonObsPlayers==4){

float T1MinX_Loc=getMin(fakeP1X_Loc,fakeP2X_Loc);
float T2MinX_Loc=getMin(fakeP3X_Loc,fakeP4X_Loc);
if(T1MinX_Loc<=T2MinX_Loc){
if(fakeP1X_Loc<=fakeP2X_Loc){RealP1FromWest=fakeP1; RealP2FromWest=fakeP2;}else{RealP1FromWest=fakeP2; RealP2FromWest=fakeP1;}
if(fakeP3X_Loc<=fakeP4X_Loc){RealP3FromWest=fakeP3; RealP4FromWest=fakeP4;}else{RealP3FromWest=fakeP4; RealP4FromWest=fakeP3;}
}
else{
if(fakeP3X_Loc<=fakeP4X_Loc){RealP1FromWest=fakeP3; RealP2FromWest=fakeP4;}else{RealP1FromWest=fakeP4; RealP2FromWest=fakeP3;}
if(fakeP1X_Loc<=fakeP2X_Loc){RealP3FromWest=fakeP1; RealP4FromWest=fakeP2;}else{RealP3FromWest=fakeP2; RealP4FromWest=fakeP1;}
}

//This algorithm needs to be updated so that left-orientation TEAM takes priority.
//Also should add a failsafe that causes the game to end if teams arent set properly?
//Should figure out how to add ageup bar. Probs x100 and all images.
//Also need to condense options UI.
if(T1MinX_Loc<=T2MinX_Loc){
if(fakeP1Z_Loc>=fakeP2Z_Loc){RealP1FromNorth=fakeP1; RealP2FromNorth=fakeP2;}else{RealP1FromNorth=fakeP2; RealP2FromNorth=fakeP1;}
if(fakeP3Z_Loc>=fakeP4Z_Loc){RealP3FromNorth=fakeP3; RealP4FromNorth=fakeP4;}else{RealP3FromNorth=fakeP4; RealP4FromNorth=fakeP3;}
}
else{
if(fakeP3Z_Loc>=fakeP4Z_Loc){RealP1FromNorth=fakeP3; RealP2FromNorth=fakeP4;}else{RealP1FromNorth=fakeP4; RealP2FromNorth=fakeP3;}
if(fakeP1Z_Loc>=fakeP2Z_Loc){RealP3FromNorth=fakeP1; RealP4FromNorth=fakeP2;}else{RealP3FromNorth=fakeP2; RealP4FromNorth=fakeP1;}
}

}
else if(cNumNonObsPlayers==6){
//Super Advanced Stuff

//Sort longitudinally within teams
if((fakeP1Z_Loc>=fakeP2Z_Loc) && (fakeP2Z_Loc>=fakeP3Z_Loc)){RealP1FromNorth=fakeP1;RealP2FromNorth=fakeP2;RealP3FromNorth=fakeP3;}
else if((fakeP1Z_Loc>=fakeP3Z_Loc) && (fakeP3Z_Loc>=fakeP2Z_Loc)){RealP1FromNorth=fakeP1;RealP2FromNorth=fakeP3;RealP3FromNorth=fakeP2;}
else if((fakeP2Z_Loc>=fakeP1Z_Loc) && (fakeP1Z_Loc>=fakeP3Z_Loc)){RealP1FromNorth=fakeP2;RealP2FromNorth=fakeP1;RealP3FromNorth=fakeP3;}
else if((fakeP2Z_Loc>=fakeP3Z_Loc) && (fakeP3Z_Loc>=fakeP1Z_Loc)){RealP1FromNorth=fakeP2;RealP2FromNorth=fakeP3;RealP3FromNorth=fakeP1;}
else if((fakeP3Z_Loc>=fakeP2Z_Loc) && (fakeP2Z_Loc>=fakeP1Z_Loc)){RealP1FromNorth=fakeP3;RealP2FromNorth=fakeP2;RealP3FromNorth=fakeP1;}
else{RealP1FromNorth=fakeP3;RealP2FromNorth=fakeP1;RealP3FromNorth=fakeP2;}


if((fakeP4Z_Loc>=fakeP5Z_Loc) && (fakeP5Z_Loc>=fakeP6Z_Loc)){RealP4FromNorth=fakeP4;RealP5FromNorth=fakeP5;RealP6FromNorth=fakeP6;}
else if((fakeP4Z_Loc>=fakeP6Z_Loc) && (fakeP6Z_Loc>=fakeP5Z_Loc)){RealP4FromNorth=fakeP4;RealP5FromNorth=fakeP6;RealP6FromNorth=fakeP5;}
else if((fakeP5Z_Loc>=fakeP4Z_Loc) && (fakeP4Z_Loc>=fakeP6Z_Loc)){RealP4FromNorth=fakeP5;RealP5FromNorth=fakeP4;RealP6FromNorth=fakeP6;}
else if((fakeP5Z_Loc>=fakeP6Z_Loc) && (fakeP6Z_Loc>=fakeP4Z_Loc)){RealP4FromNorth=fakeP5;RealP5FromNorth=fakeP6;RealP6FromNorth=fakeP4;}
else if((fakeP6Z_Loc>=fakeP5Z_Loc) && (fakeP5Z_Loc>=fakeP4Z_Loc)){RealP4FromNorth=fakeP6;RealP5FromNorth=fakeP5;RealP6FromNorth=fakeP4;}
else{RealP4FromNorth=fakeP6;RealP5FromNorth=fakeP4;RealP6FromNorth=fakeP5;}

//Sort latitudinally within teams
if((fakeP1X_Loc<=fakeP2X_Loc) && (fakeP2X_Loc<=fakeP3X_Loc)){RealP1FromWest=fakeP1;RealP2FromWest=fakeP2;RealP3FromWest=fakeP3;}
else if((fakeP1X_Loc<=fakeP3X_Loc) && (fakeP3X_Loc<=fakeP2X_Loc)){RealP1FromWest=fakeP1;RealP2FromWest=fakeP3;RealP3FromWest=fakeP2;}
else if((fakeP2X_Loc<=fakeP1X_Loc) && (fakeP1X_Loc<=fakeP3X_Loc)){RealP1FromWest=fakeP2;RealP2FromWest=fakeP1;RealP3FromWest=fakeP3;}
else if((fakeP2X_Loc<=fakeP3X_Loc) && (fakeP3X_Loc<=fakeP1X_Loc)){RealP1FromWest=fakeP2;RealP2FromWest=fakeP3;RealP3FromWest=fakeP1;}
else if((fakeP3X_Loc<=fakeP2X_Loc) && (fakeP2X_Loc<=fakeP1X_Loc)){RealP1FromWest=fakeP3;RealP2FromWest=fakeP2;RealP3FromWest=fakeP1;}
else{RealP1FromWest=fakeP3;RealP2FromWest=fakeP1;RealP3FromWest=fakeP2;}


if((fakeP4X_Loc<=fakeP5X_Loc) && (fakeP5X_Loc<=fakeP6X_Loc)){RealP4FromWest=fakeP4;RealP5FromWest=fakeP5;RealP6FromWest=fakeP6;}
else if((fakeP4X_Loc<=fakeP6X_Loc) && (fakeP6X_Loc<=fakeP5X_Loc)){RealP4FromWest=fakeP4;RealP5FromWest=fakeP6;RealP6FromWest=fakeP5;}
else if((fakeP5X_Loc<=fakeP4X_Loc) && (fakeP4X_Loc<=fakeP6X_Loc)){RealP4FromWest=fakeP5;RealP5FromWest=fakeP4;RealP6FromWest=fakeP6;}
else if((fakeP5X_Loc<=fakeP6X_Loc) && (fakeP6X_Loc<=fakeP4X_Loc)){RealP4FromWest=fakeP5;RealP5FromWest=fakeP6;RealP6FromWest=fakeP4;}
else if((fakeP6X_Loc<=fakeP5X_Loc) && (fakeP5X_Loc<=fakeP4X_Loc)){RealP4FromWest=fakeP6;RealP5FromWest=fakeP5;RealP6FromWest=fakeP4;}
else{RealP4FromWest=fakeP6;RealP5FromWest=fakeP4;RealP6FromWest=fakeP5;}

//Switch teams around if required
if(getMax(getMax(fakeP1X_Loc,fakeP2X_Loc),fakeP3X_Loc)>getMax(getMax(fakeP4X_Loc,fakeP5X_Loc),fakeP6X_Loc)){

fakeTemp=RealP1FromWest;RealP1FromWest=RealP4FromWest;RealP4FromWest=fakeTemp;
fakeTemp=RealP2FromWest;RealP2FromWest=RealP5FromWest;RealP5FromWest=fakeTemp;
fakeTemp=RealP3FromWest;RealP3FromWest=RealP6FromWest;RealP6FromWest=fakeTemp;

fakeTemp=RealP1FromNorth;RealP1FromNorth=RealP4FromNorth;RealP4FromNorth=fakeTemp;
fakeTemp=RealP2FromNorth;RealP2FromNorth=RealP5FromNorth;RealP5FromNorth=fakeTemp;
fakeTemp=RealP3FromNorth;RealP3FromNorth=RealP6FromNorth;RealP6FromNorth=fakeTemp;

}

//Hash brownies for the UI
fakeTemp=RealP5FromNorth;
RealP5FromNorth=RealP1FromNorth;
RealP1FromNorth=RealP2FromNorth;
RealP2FromNorth=RealP3FromNorth;
RealP3FromNorth=fakeTemp;
fakeTemp=RealP6FromNorth;
RealP6FromNorth=RealP4FromNorth;
RealP4FromNorth=fakeTemp;
}


}

//First trigger will initiate all variables+ arrays.

	rmCreateTrigger("StartInsertion");
	rmSwitchToTrigger(rmTriggerID("StartInsertion"));
	rmSetTriggerRunImmediately(true);
	cEfA("} ");
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	cEf(" trModifyProtounit(\"Target\", "+p+", 2, -100.0); ");
}
for(p=1;<=cNumNonObsPlayers){
	cEf(" trModifyProtounit(\"UIArmyBannerHand\","+p+",8,0.25); ");
}
if(cAllowViewLock==1){
	cEf(" trUnitSelectClear(); ");
	cEf(" for(t="+rmGetUnitPlaced(happybdaymitoe,0)+";<"+rmGetUnitPlaced(happybdaymitoe,rmGetNumberUnitsPlaced(happybdaymitoe)-1)+"){ ");
	cEf(" trUnitSelectByID(t); ");
	cEf(" } ");
	cEf(" trUnitChangeProtoUnit(\"CinematicRevealer\"); ");
}
	cEf(" trUnitSelectClear(); ");
if(cNumNonObsPlayers<cNumberNonGaiaPlayers){
	cEf(" for(m="+rmGetUnitPlaced(BCOSIMBATMAN,0)+";<="+rmGetUnitPlaced(BCOSIMBATMAN,rmGetNumberUnitsPlaced(BCOSIMBATMAN)-1)+"){ ");
	cEf(" if(kbIsPlayerHuman(m-"+rmGetUnitPlaced(BCOSIMBATMAN,0)+"+"+cNumNonObsPlayers+"+1)){ ");
	cEf(" trUnitSelectByID(m);trUnitChangeProtoUnit(\"Target\");trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" trUnitSelectByID(m);trUnitChangeProtoUnit(\"CinematicBlock\");trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" } ");
}
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	for(q=1;<=cNumNonObsPlayers){
		cEf(" trPlayerSetDiplomacy("+p+", "+q+", \"Enemy\"); ");
	}
}
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	cEf(" trPlayerSetHCAccess("+p+",false); ");
	cEf(" trTechSetStatus("+p+", 529, 2); ");
}
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	for(q=(p+1);<=cNumberNonGaiaPlayers){
		cEf(" trPlayerSetDiplomacy("+p+", "+q+", \"ally\"); ");
	}
}
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	cEf(" trPlayerResetBlackMap("+p+"); ");
}
//Spies stuff for LOS
	cEf(" trBlockAllSounds(); ");
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	cEf(" trTechSetStatus("+p+", 446, 2); ");
}
	cEf(" trUnblockAllSounds(); ");
	cEf(" uiClearChat(); ");

	cEf(" xsDisableSelf();  ");
	cEf(" } ");

	cEf(" int FP=1; int HCVisible=0; int showconsole=0; string consoleautocomplete=\"\"; ");
	cEf(" int UTshift=0; ");
//For spreading stuff out
	cEf(" int lastupdatetimeMS=0; int updaterequired=0; int curupdatecycle=0; ");

if(IDesignRMS==1){
	cEf(" int override=1; ");
}
else{
	cEf(" int override=0; ");
}

	cEf(" int hasUI=-1; int nabvl=0; ");

	cEf(" int showGperR=1; int showPopGraphic=1; "); //shown by default for 2.1

	cEf(" int MusicOverAesthetics=0; "); ///
	cEf(" int enableunitticker=0; "); ///
	cEf(" int scrollincrement=1; "); ///
	
///THESE NEED TO BE CHANGED AS PER RESOLUTION.
	cEf(" int numLFs=39; ");

	cEf(" int shpdetailsstarter2=410; int shpbarstarter2=343; ");
	cEf(" int shpdetailsstarter4=313; int shpbarstarter4=250; ");

//2.1
	cEf(" int shpdetailsstarter6=313; int shpbarstarter6=250; ");
	cEf(" int startliner=2; int newliner=105; int newdoubleliner=208; int displayfinetuning=1; ");

	cEf(" int headerstarter=85; "); //for amount before you start with header

	cEf(" int gstarter=365; ");

	cEf(" int sbdeadspace=413; "); //for ship prog bars
	cEf(" int shpbarlength=28; ");
	cEf(" int shpbarspacing=10; ");
	cEf(" int shpdetailsspacing=82; ");

	cEf(" int reslinespacing=245; ");

	cEf(" int graphiclength=180; ");

	cEf(" int Glinewidth=12; ");
	cEf(" int SectionWidth2=8; ");
	cEf(" int SectionWidth4=5; ");
	
	cEf(" int blanklabelwidth=37; ");
	cEf(" int Gcellwidth=49; ");
	
	cEf(" int dividerW=5; int dividerJ=5; "); //Width, Adjustment
	cEf(" int tdividerW=11; int tdividerJ=0; "); //team
	
	cEf(" int tpsubspacing2=30; ");
	cEf(" int tpbigspacing2=350; ");
	cEf(" int tpsubspacing4=20; ");
	cEf(" int tpbigspacing4=75; ");

//Deadspace for each setting of label displays
	cEf(" int disR1=37; int disR2=29; int disR3=20; int disR4=11; ");
	cEf(" int disT1=8; int disT2=37; ");

///END PER RESOLUTION
	cEf(" int flagXleeway=30; int flag1Xpos=220; int flag2Xpos=285; int flag3Xpos=680; int flag4Xpos=745; int shipmentechoYpos=57; ");
	cEf(" int flag0Xpos=155; int flag5Xpos=810; ");
	
	cEf(" float samplinginterval=4000; ");
	cEf(" float lastsampletimeMS=0; ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" int P"+p+"StartXP=0; int P"+p+"StartAge=0; int AGE_ING_"+p+"=0; int AGE_PROG_"+p+"=0; string AGE_TEXT_"+p+"=\"\"; ");
	cEf(" float TotFood_"+p+"=0; float TotWood_"+p+"=0; float TotGold_"+p+"=0; float TotTrade_"+p+"=0; ");
	cEf(" float DelFood_"+p+"=0; float DelWood_"+p+"=0; float DelGold_"+p+"=0; float DelTrade_"+p+"=0; ");
	cEf(" int DeadCostFood_"+p+"=0; int DeadCostWood_"+p+"=0; int DeadCostGold_"+p+"=0; int DeadCostTrade_"+p+"=0; ");
	cEf(" int PopGathrFood_"+p+"=0; int PopGathrWood_"+p+"=0; int PopGathrGold_"+p+"=0; int PopGathrIdle_"+p+"=0; ");
	cEf(" int has"+p+"Rev=0; ");

	cEf(" int shipmenttally"+p+"=0; int shipmentdiscr"+p+"=0; int shipmenttimeout"+p+"=0; ");
	
	cEf(" int zuttoship"+p+"=0; int zuttogold"+p+"=0; ");

for(n=1;<=cNumArrayTypeCap){
	cEf(" int A"+n+"P"+p+"=0; int B"+n+"P"+p+"=0; int C"+n+"P"+p+"=0; int D"+n+"P"+p+"=0; int E"+n+"P"+p+"=0; int F"+n+"P"+p+"=0; ");
}
}
	cEf(" int PrID=0;int PrNM=0;int PrDC=0;int PrIP=0;int ImIC=0;int ImDC=0; int ImIP=0; ");
	cEf(" int CnCMDS=0; int CnINPT=0; int CnDCMP=0; int saveconsolehistory=-1; ");
	cEf(" int AdUUDisplay=0; int AdUUPDisplay=0; int passivetracking=0; int AdUSDisplay=0; "," int AdUUDType=0; int AdUUDTech=0; int AdUUDTTT=0; int AdUUDRType=0; int AdUUDRTech=0; "," int dtekpage=0; int dshppage=0; ");
	cEf(" int AdUG_initial=0; int AdUG_final=0; "); //These exist to reduce lag, glorify their names!
	cEf(" int ABDisplay=0; int ABDisplayPrior=0; ");
	cEf(" int BABDisplay=0; int BABDisplayPrior=0; ");
	cEf(" int ATTsi=0; ");
	cEf(" int lastviewedHC=0; int lastviewedPHC=0; int FindUnitTracker=-1; int adjustecopop=-1; ");
//For 4 way scrolling. NOTE NEED TO FIX HOW IT WORKS FOR SHIPMENTS/TECHS COMPLETED. FOR NOW IS PRIMITIVE, SWITCHES BACK TO END IF YOU GO TO START.
	cEf(" int scrollingindex1=0; int scrollingindex2=0; int scrollingindex3=0; ","int scrollingindex4=0; int scrollingindex5=0; int scrollingindex6=0; ");
//PREPARE TO ROLL IN THE CAMERA 2.1 UPDATE! [TENTATIVE]
	cEf(" int cameralockonunit=-1; int cameralockonunitid=-1; ");

//New scrolling
	cEf(" int DivInx=0; int DivTyp=0; int DivLgt=0; int DivCurTot=0; ");

//New tps
	cEf(" int TPids=0; ");

//New ricepaddies. Remember 2 second rule. -1=Food, 1=Gold
	cEf(" int PADIids=0; int PADIrez=0; ");

	cEf(" int justfogoff=-1; int debugmode=-1; ");

//Team array
	cEf(" int PlTM=0; ");


//---------------------------------------------------------
//To assist in the automation of arrays? NB CURRENTLY NOT USED
	cEf(" string highlevelpath=\"spec2/Version1/\"; ");
//If a path for a tech is missing then use this string pattern followed by the number
	cEf(" string defaultpathTech=\"\"; ");
//If a path for a unit is missing then use this string pattern followed by the number
	cEf(" string defaultpathUnit=\"\"; ");

//---------------------------------------------------------
for(p=1;<=cNumNonObsPlayers){
	cEf(" int column"+p+"player="+rPFromWest(p)+"; ");
	cEf(" int resline"+p+"player="+rPFromNorth(p)+"; ");
	cEf(" int P"+p+"alive=1; ");
}

	cEf(" int ResDispType=1; ");
//NEED TO DEFINE CHANGING FUNCTIONS FOR DIS
	cEf(" int LeftDispType=3; int RightDispType=6; ");
/*
0=Economic
1=Military
2=Naval
3=All Types
4=Queue
5=All Dead
6=Techs in queue
7=Techs researched
8=Shipments sent
9=Unit Ticker
*/

//Declare ALL the global variables we will need to process the full stats graphics. NB Gline1width is above.
	cEf(" int Gcumwidth=0; ");
	cEf(" string Gline1display=\"\"; ");
	cEf(" string Gline2display=\"\"; ");
	cEf(" string Gline1text=\"\"; ");
	cEf(" string Gline2text=\"\"; ");
//For identification of arrays
	cEf(" int Gplyr=0; ");
	cEf(" int Gtype=0; ");
	cEf(" int Gbase=0; "); //Which base value do we use from corresponding Gtype array?
	cEf(" int Gindex=0; "); //Which index value? For stored timings.
	cEf(" int Ggrafix=0; int GgrafixTOP=0; "); //For storing graphics array and top level array.
	cEf(" int Gtext=0; "); //For storing text array
	
	cEf(" int Gkagaku=0; "); //For storing indices in order; up to a max of 20 I suppose.
	cEf(" int Gnorailgun=0; "); //Starts from 0 then is cleared every time a new section is added.

//For find unit logic
	cEf(" int lastfoundid=-1; ");

//For view lock logic
	cEf(" int lastlockedat=-1; int cameralockonplayer=0; int curcyclepoint=0; ");
//---------------------------------------------------------
	cEf(" void kat(string input=\"\"){trBlockAllSounds();trChatSendToPlayer(0,FP,input);trUnblockAllSounds();} ");
//Void functions for loading stuff
//UI FOR CONFIGURATION
	cEf(" int CCV=0; int DCV=-1; ");
//Rearrange later.
	cEf(" void load1600x900(int wtv=-1){ ");
	cEf(" numLFs=15; ");//
	cEf(" shpdetailsstarter2=518; ");
	cEf(" shpbarstarter2=445; ");
	cEf(" shpdetailsstarter4=416; ");
	cEf(" shpbarstarter4=342; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=430; ");//
	cEf(" sbdeadspace=516; ");//
	cEf(" shpbarlength=30; ");//
	cEf(" shpbarspacing=12; ");
	cEf(" shpdetailsspacing=89; ");//
	cEf(" reslinespacing=342; ");
	cEf(" graphiclength=265; ");//
	cEf(" Glinewidth=16; ");//
	cEf(" SectionWidth2=11; ");//
	cEf(" SectionWidth4=7; ");//
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=43; ");
	cEf(" tpbigspacing2=500; ");
	cEf(" tpsubspacing4=25; ");
	cEf(" tpbigspacing4=149; ");
	cEf(" shpdetailsstarter6=313; ");
	cEf(" shpbarstarter6=241; ");
	cEf(" startliner=2; ");
	cEf(" newliner=204; ");
	cEf(" newdoubleliner=292; ");
	cEf(" displayfinetuning=3; ");
	cEf(" } ");
	
	cEf(" void load1680x1050(int wtv=-1){ ");
	cEf(" numLFs=18; ");//
	cEf(" shpdetailsstarter2=542; ");
	cEf(" shpbarstarter2=466; ");
	cEf(" shpdetailsstarter4=436; ");
	cEf(" shpbarstarter4=359; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=488; ");//
	cEf(" sbdeadspace=541; ");//
	cEf(" shpbarlength=32; ");//
	cEf(" shpbarspacing=11; ");
	cEf(" shpdetailsspacing=94; ");//
	cEf(" reslinespacing=342; ");
	cEf(" graphiclength=275; ");//
	cEf(" Glinewidth=16; ");//
	cEf(" SectionWidth2=11; ");//
	cEf(" SectionWidth4=7; ");//
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=43; ");
	cEf(" tpbigspacing2=500; ");
	cEf(" tpsubspacing4=25; ");
	cEf(" tpbigspacing4=149; ");
	cEf(" shpdetailsstarter6=329; ");
	cEf(" shpbarstarter6=253; ");
	cEf(" startliner=6; ");
	cEf(" newliner=219; ");
	cEf(" newdoubleliner=306; ");
	cEf(" displayfinetuning=5; ");
	cEf(" } ");

	cEf(" void load1920x1080(int wtv=-1){ ");
	cEf(" numLFs=20; ");
	cEf(" shpdetailsstarter2=622; ");
	cEf(" shpbarstarter2=535; ");
	cEf(" shpdetailsstarter4=498; ");
	cEf(" shpbarstarter4=413; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=501; ");
	cEf(" sbdeadspace=618; ");
	cEf(" shpbarlength=36; ");
	cEf(" shpbarspacing=13; ");
	cEf(" shpdetailsspacing=110; ");
	cEf(" reslinespacing=441; ");
	cEf(" graphiclength=310; ");
	cEf(" Glinewidth=20; ");
	cEf(" SectionWidth2=14; ");
	cEf(" SectionWidth4=9; ");
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=53; ");
	cEf(" tpbigspacing2=650; ");
	cEf(" tpsubspacing4=35; ");
	cEf(" tpbigspacing4=206; ");
	cEf(" shpdetailsstarter6=378; ");
	cEf(" shpbarstarter6=293; ");
	cEf(" startliner=2; ");
	cEf(" newliner=105; ");
	cEf(" newdoubleliner=208; ");
	cEf(" displayfinetuning=1; ");
	cEf(" } ");

	cEf(" void load1280x800(int wtv=-1){ ");
	cEf(" numLFs=13; ");
	cEf(" shpdetailsstarter2=410; ");
	cEf(" shpbarstarter2=355; ");
	cEf(" shpdetailsstarter4=331; ");
	cEf(" shpbarstarter4=274; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=365; ");
	cEf(" sbdeadspace=414; ");
	cEf(" shpbarlength=24; ");
	cEf(" shpbarspacing=9; ");
	cEf(" shpdetailsspacing=68; ");
	cEf(" reslinespacing=245; ");
	cEf(" graphiclength=199; ");
	cEf(" Glinewidth=12; ");
	cEf(" SectionWidth2=8; ");
	cEf(" SectionWidth4=5; ");
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=30; ");
	cEf(" tpbigspacing2=350; ");
	cEf(" tpsubspacing4=20; ");
	cEf(" tpbigspacing4=75; ");
	cEf(" shpdetailsstarter6=249; ");
	cEf(" shpbarstarter6=193; ");
	cEf(" startliner=5; ");
	cEf(" newliner=73; ");
	cEf(" newdoubleliner=138; ");
	cEf(" displayfinetuning=2; ");
	cEf(" } ");

	cEf(" void load1280x768(int wtv=-1){ ");
	cEf(" numLFs=12; ");
	cEf(" shpdetailsstarter2=410; ");
	cEf(" shpbarstarter2=355; ");
	cEf(" shpdetailsstarter4=331; ");
	cEf(" shpbarstarter4=274; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=365; ");
	cEf(" sbdeadspace=414; ");
	cEf(" shpbarlength=24; ");
	cEf(" shpbarspacing=9; ");
	cEf(" shpdetailsspacing=68; ");
	cEf(" reslinespacing=245; ");
	cEf(" graphiclength=199; ");
	cEf(" Glinewidth=12; ");
	cEf(" SectionWidth2=8; ");
	cEf(" SectionWidth4=5; ");
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=30; ");
	cEf(" tpbigspacing2=350; ");
	cEf(" tpsubspacing4=20; ");
	cEf(" tpbigspacing4=75; ");
	cEf(" shpdetailsstarter6=249; ");
	cEf(" shpbarstarter6=193; ");
	cEf(" startliner=5; ");
	cEf(" newliner=73; ");
	cEf(" newdoubleliner=138; ");
	cEf(" displayfinetuning=2; ");
	cEf(" } ");

	cEf(" void load1280x720(int wtv=-1){ ");
	cEf(" numLFs=11; ");
	cEf(" shpdetailsstarter2=410; ");
	cEf(" shpbarstarter2=355; ");
	cEf(" shpdetailsstarter4=331; ");
	cEf(" shpbarstarter4=274; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=365; ");
	cEf(" sbdeadspace=414; ");
	cEf(" shpbarlength=24; ");
	cEf(" shpbarspacing=9; ");
	cEf(" shpdetailsspacing=68; ");
	cEf(" reslinespacing=245; ");
	cEf(" graphiclength=199; ");
	cEf(" Glinewidth=12; ");
	cEf(" SectionWidth2=8; ");
	cEf(" SectionWidth4=5; ");
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=30; ");
	cEf(" tpbigspacing2=350; ");
	cEf(" tpsubspacing4=20; ");
	cEf(" tpbigspacing4=75; ");
	cEf(" shpdetailsstarter6=249; ");
	cEf(" shpbarstarter6=193; ");
	cEf(" startliner=5; ");
	cEf(" newliner=73; ");
	cEf(" newdoubleliner=138; ");
	cEf(" displayfinetuning=2; ");
	cEf(" } ");

	cEf(" void load1366x768(int wtv=-1){ ");
	cEf(" numLFs=12; ");
	cEf(" shpdetailsstarter2=441; ");
	cEf(" shpbarstarter2=379; ");
	cEf(" shpdetailsstarter4=355; ");
	cEf(" shpbarstarter4=292; ");
	cEf(" headerstarter=85; ");
	cEf(" gstarter=423; ");
	cEf(" sbdeadspace=441; ");
	cEf(" shpbarlength=26; ");
	cEf(" shpbarspacing=9; ");
	cEf(" shpdetailsspacing=73; ");
	cEf(" reslinespacing=245; ");
	cEf(" graphiclength=220; ");
	cEf(" Glinewidth=12; ");
	cEf(" SectionWidth2=8; ");
	cEf(" SectionWidth4=5; ");
	cEf(" blanklabelwidth=37; ");
	cEf(" Gcellwidth=49; ");
	cEf(" dividerW=5; ");
	cEf(" dividerJ=5; ");
	cEf(" tdividerW=11; ");
	cEf(" tdividerJ=0; ");
	cEf(" disR1=37; ");
	cEf(" disR2=29; ");
	cEf(" disR3=20; ");
	cEf(" disR4=11; ");
	cEf(" disT1=8; ");
	cEf(" disT2=37; ");
	cEf(" tpsubspacing2=30; ");
	cEf(" tpbigspacing2=350; ");
	cEf(" tpsubspacing4=20; ");
	cEf(" tpbigspacing4=75; ");
	cEf(" shpdetailsstarter6=268; ");
	cEf(" shpbarstarter6=205; ");
	cEf(" startliner=9; ");
	cEf(" newliner=82; ");
	cEf(" newdoubleliner=148; ");
	cEf(" displayfinetuning=2; ");
	cEf(" } ");

	cEf(" int kbGetTechID(string tkname=\"\"){ ");
	cEf(" for (i=0;<"+cNumAllTechs+"){ ");
	cEf(" if(kbGetTechName(i)==tkname){return(i);} ");
	cEf(" } ");
	cEf(" return(-1); ");
	cEf(" } ");
	
	cEf(" int kbGetUnitTypeID(string typename=\"\"){ ");
	cEf(" for (i=0;<5000){ ");
	cEf(" if(kbGetUnitTypeName(i)==typename){return(i);} ");
	cEf(" } ");
	cEf(" return(-1); ");
	cEf(" } ");

	cEf(" void setbaseline(int wtv=-1){UTshift=kbGetUnitTypeID(\"Unit\")-1463;} ");
	cEf(" int UTcorrect(int typeid=0){if(typeid<1463){return(typeid);}return(typeid+UTshift);} ");

if(cAllowViewLock==1){
	cEf(" void youmayviewlockme(int wtv=-1){ ");
	cEf(" int numspy=0; int currentstretchlength=0; int maxstretchlength=0; int lastinmaxstretch=0; int lastvisible=0; int tempgo=0;");

	cEf(" int strangerdanger=0; int todaysquery=0; int querysize=0; int flag=0; ");
	cEf(" int minID="+rmGetUnitPlaced(happybdaymitoe,0)+"; int maxID="+rmGetUnitPlaced(happybdaymitoe,rmGetNumberUnitsPlaced(happybdaymitoe)-1)+"; ");
	cEf(" for(u=minID;<maxID){ ");

	cEf(" xsSetContextPlayer(0);trUnitSelectClear();trUnitSelectByID(u); ");
	cEf(" if(trUnitVisToPlayer()){ ");
	cEf(" numspy=numspy+1; ");
	cEf(" if(lastvisible==(u-1)){lastvisible=u;currentstretchlength=currentstretchlength+1;} ");
	cEf(" else{lastvisible=u;currentstretchlength=1;} ");
	cEf(" if(currentstretchlength>=maxstretchlength){maxstretchlength=currentstretchlength;lastinmaxstretch=u;} ");
	cEf(" } ");

	cEf(" } ");

//	cEf(" kat(\"On screen: \"+numspy); ");
//	cEf(" kat(\"Max stretch: \"+maxstretchlength); ");
//	cEf(" kat(\"End of stretch: \"+lastinmaxstretch); ");

	cEf(" tempgo=lastinmaxstretch-maxstretchlength/2; ");
	
	cEf(" if(numspy>0){ ");
	cEf(" if(tempgo!=lastlockedat){ ");
	cEf(" kbLookAtAllUnitsOnMap(); ");
	cEf(" for(p=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" if(xsArrayGetInt(PlTM,p)==xsArrayGetInt(PlTM,FP)){ ");
	cEf(" xsSetContextPlayer(p); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"HeroAcademia\"+p); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, p, true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, UTcorrect(1480)); "); //Hero
	cEf(" kbUnitQuerySetActionType(todaysquery,43);kbUnitQuerySetSeeableOnly(todaysquery,true); "); //ded
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(i=0;<querysize){trUnitSelectClear();trUnitSelectByID(kbUnitQueryGetResult(todaysquery,i));","if(trUnitVisToPlayer()){flag=1;break;}} ");
	cEf(" trUnitSelectClear();kbUnitQueryDestroy(todaysquery);if(flag==1){break;} ");
	cEf(" } ");
	cEf(" } ");
	
//check for hero of players on same team here

	cEf(" if(flag==0){ ");
	cEf(" lastlockedat=tempgo; ");
	cEf(" spa","wnUnits(\"UIArmyBannerHand\",1,lastlockedat); ");
	cEf(" } ");

	cEf(" } ");
	cEf(" } ");
	
	cEf(" } ");
}

for(i=0;<numconfigvariables){
	cEf(" void SetAdjustConfig"+i+"(int wtv=-1){CCV="+i+";} ");//580**
}
	cEf(" void SetConfigDeltap100(int wtv=-1){DCV=100;} "); //57***
	cEf(" void SetConfigDeltap10(int wtv=-1){DCV=10;} ");
	cEf(" void SetConfigDeltap5(int wtv=-1){DCV=5;} ");
	cEf(" void SetConfigDeltap1(int wtv=-1){DCV=1;} ");
	cEf(" void SetConfigDeltam100(int wtv=-1){DCV=-100;} "); //57***
	cEf(" void SetConfigDeltam10(int wtv=-1){DCV=-10;} ");
	cEf(" void SetConfigDeltam5(int wtv=-1){DCV=-5;} ");
	cEf(" void SetConfigDeltam1(int wtv=-1){DCV=-1;} ");

	cEf(" void AdjustConfig(int wtv=-1){ ");
for(i=0;<numconfigvariables){cEf(" if(CCV=="+i+"){"+configVar(i)+"="+configVar(i)+"+DCV;} ");}
	cEf(" } ");

	cEf(" void echovars(int wtv=-1){ ");
for(i=0;<numconfigvariables){cEf(" kat(\""+configVar(i)+"=\"+"+configVar(i)+"); ");}
	cEf(" } ");
	
	cEf(" void setconfighandlers(int wtv=-1){ ");
for(i=0;<=9){cEf(" trEventSetHandler(5800"+i+",\"SetAdjustConfig"+i+"\"); ");}
for(i=10;<numconfigvariables){cEf(" trEventSetHandler(580"+i+",\"SetAdjustConfig"+i+"\"); ");}
	cEf(" trEventSetHandler(59000,\"SetConfigDeltap100\"); ");
	cEf(" trEventSetHandler(59100,\"SetConfigDeltap10\"); ");
	cEf(" trEventSetHandler(59200,\"SetConfigDeltap5\"); ");
	cEf(" trEventSetHandler(59300,\"SetConfigDeltap1\"); ");
	cEf(" trEventSetHandler(59400,\"SetConfigDeltam1\"); ");
	cEf(" trEventSetHandler(59500,\"SetConfigDeltam5\"); ");
	cEf(" trEventSetHandler(59600,\"SetConfigDeltam10\"); ");
	cEf(" trEventSetHandler(59700,\"SetConfigDeltam100\"); ");
	cEf(" trEventSetHandler(59800,\"AdjustConfig\"); ");
	cEf(" trEventSetHandler(59900,\"echovars\"); ");
	cEf(" } ");

//Important void functions which need to go before ConstantLoader

	cEf(" bool InI(float check=0, float lower=0.0, float upper=1.0){ ");
	cEf(" if(check>=lower && check<=upper){return(true);} ");
	cEf(" return(false); ");
	cEf(" } ");

	cEf(" void echoUnitTypeIDs(int wtv=-1){ ");
//	cEf(" for(i=0;<5000){if(kbGetUnitTypeName(i)!=\"Invalid\")","{kat(i+\"-\"+kbGetUnitTypeName(i));saveCamera(i+\"-\"+kbGetUnitTypeName(i));}} ");
	cEf(" } ");
	
	cEf(" void echoTechIDs(int wtv=-1){ ");
//	cEf(" for(i=0;<5000){if(kbGetTechName(i)!=\"Invalid\")","{kat(i+\"-\"+kbGetTechName(i));saveCamera(i+\"-\"+kbGetTechName(i));}} ");
	cEf(" } ");

	cEf(" void AEU(int index=0, int unitid=0, string unit=\"Settler\", int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(PrID,index,unitid); ");
	cEf(" xsArraySetString(PrNM,index,unit); ");
	cEf(" xsArraySetInt(PrDC,index,strid); ");
	cEf(" xsArraySetString(PrIP,index,imgpath); ");
	cEf(" } ");

	cEf(" void AMU(int index=0, int unitid=0, string unit=\"Settler\", int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(PrID,index,unitid); ");
	cEf(" xsArraySetString(PrNM,index,unit); ");
	cEf(" xsArraySetInt(PrDC,index,strid); ");
	cEf(" xsArraySetString(PrIP,index,imgpath); ");
	cEf(" } ");

	cEf(" void AWU(int index=0, int unitid=0, string unit=\"Settler\", int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(PrID,index,unitid); ");
	cEf(" xsArraySetString(PrNM,index,unit); ");
	cEf(" xsArraySetInt(PrDC,index,strid); ");
	cEf(" xsArraySetString(PrIP,index,imgpath); ");
	cEf(" } ");

	cEf(" void ARU(int index=0, int unitid=0, string unit=\"Settler\", int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(PrID,index,unitid); ");
	cEf(" xsArraySetString(PrNM,index,unit); ");
	cEf(" xsArraySetInt(PrDC,index,strid); ");
	cEf(" xsArraySetString(PrIP,index,imgpath); ");
	cEf(" } ");
	
	cEf(" void ITT(int techid=0, int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(ImIC,techid,1); ");
	cEf(" xsArraySetInt(ImDC,techid,strid); ");
	cEf(" if(imgpath>\"\"){ ");
	cEf(" xsArraySetString(ImIP,techid,imgpath); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" xsArraySetString(ImIP,techid,\"spec\techs\TK_\"+techid); ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void ITS(int techid=0, int strid=0, string imgpath=\"\"){ ");
	cEf(" xsArraySetInt(ImIC,techid,2); ");
	cEf(" xsArraySetInt(ImDC,techid,strid); ");
	cEf(" if(imgpath>\"\"){ ");
	cEf(" xsArraySetString(ImIP,techid,imgpath); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" xsArraySetString(ImIP,techid,\"spec\techs\TK_\"+techid); ");
	cEf(" } ");
	cEf(" } ");
	
	cEf(" void ATT(int index=0, int unittypeid=0, int techid=0, int isteamtech=0){ ");
//Essentially a correction is applied for what happens if new units are added.
	cEf(" xsArraySetInt(AdUUDType,index,unittypeid); ");
	cEf(" xsArraySetInt(AdUUDTech,index,techid); ");
	cEf(" xsArraySetInt(AdUUDTTT,index,isteamtech); ");
	cEf(" } ");

	cEf(" void ATTR(int index=0, int unittypeid=0, int techid=0){ ");
	cEf(" xsArraySetInt(AdUUDRType,index,unittypeid); ");
	cEf(" xsArraySetInt(AdUUDRTech,index,techid); ");
	cEf(" } ");

	cEf(" void initializeteamarray(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	if(rmGetPlayerTeam(p)==rmGetPlayerTeam(1)){cEf(" xsArraySetInt(PlTM,"+p+",1); ");}
	else{cEf(" xsArraySetInt(PlTM,"+p+",2); ");}
}
for(p=(cNumNonObsPlayers+1);<=cNumberNonGaiaPlayers){
	cEf(" xsArraySetInt(PlTM,"+p+",3); ");
}
	cEf(" } ");

//A lot of info related to units
if(true){
	cEf(" void loadprotoarrays(int wtv=-1){ ");
AEU(284,"Settler",22806,"units/villagers/villager_portrait");
AEU(510,"SettlerWagon",30679,"units/villagers/settler_wagon/settler_wagon_portrait");
AEU(379,"Coureur",25038,"units/infantry_ranged/coureur/coureur_du_bois_portrait");
AEU(517,"CoureurCree",31433,"units/infantry_ranged/coureur/coureur_du_bois_portrait");
AEU(721,"SettlerNative",43687,"ui/units/native_villager_portrait");
AEU(928,"ypSettlerAsian",60245,"units/asians/shared/villager/peasant_icon_portrait");
AEU(1130,"ypSettlerJapanese",64588,"units/asians/shared/villager/peasant_icon_portrait");
AEU(1047,"ypSettlerIndian",63145,"units/asians/shared/villager/indian_peasant_icon_portrait");
AEU(315,"FishingBoat",22962,""); ///FLAG
AEU(1109,"ypFishingBoatAsian",64390,""); ///FLAG
AEU(971,"ypShrineJapanese",61446,"buildings/asian_civs/shrine/shrine_icon_portrait");
AEU(338,"Bank",23708,"buildings/bank/bank_portrait");
AEU(963,"ypBankAsian",61368,"buildings/bank/bank_portrait");
AEU(1105,"ypDojo",64321,"buildings/asian_civs/dojo/dojo_icon_portrait");
AEU(348,"Factory",23986,"buildings/factory/shared_factory_portrait");
AEU(425,"Imam",26226,"units/priests/ottoman_priest_portrait");
AEU(404,"Missionary",25340,"units/priests/spanish_priest_portrait");
AEU(311,"Priest",22954,"units/priests/we_priest_portrait");
AEU(424,"Surgeon",26218,"units/surgeons/surgeon_portrait");
AEU(654,"NatMedicineMan",36735,"units/natives/medicine_man_portrait");
AEU(725,"xpMedicineMan",43829,"ui/units/iro_priest_portrait");
AEU(832,"xpMedicineManAztec",46330,"ui/units/az_priest_portrait");
AEU(1383,"ypMongolScout",68874,"units/asians/chinese/mongol_scout/mongol_scout_icon_portrait");
AEU(485,"NativeScout",29664,"units/natives/miskatonic_scout_portrait");
AEU(1456,"ypNativeScout",70278,"units/natives/miskatonic_scout_portrait");
AEU(317,"Envoy",22973,"units/villagers/envoy_portrait");
AEU(521,"CrateofFoodLarge",31763,"spec/unitart/CrateofFoodLarge");
AEU(414,"CrateofFood",26021,"ui/command/generate_food_portrait");
AEU(522,"CrateofWoodLarge",31767,"spec/unitart/CrateofWoodLarge");
AEU(415,"CrateofWood",26025,"ui/command/generate_wood_portrait");
AEU(523,"CrateofCoinLarge",31771,"spec/unitart/CrateofCoinLarge");
AEU(416,"CrateofCoin",26029,"ui/command/generate_coin_portrait");
AEU(440,"CoveredWagon",27330,"units/villagers/covered_wagon/covered_wagon_portrait");
AEU(667,"OutpostWagon",41660,"units/trade/outpost_wagon_portrait");
AEU(668,"FortWagon",41668,"units/trade/fort_wagon_portrait");
AEU(219,"BankWagon",46898,"ui/units/bank_wagon_portrait");
AEU(669,"FactoryWagon",41672,"units/trade/factory_wagon_portrait");
AEU(723,"WarHutTravois",43817,"units/trade/travois_icon_portrait");
AEU(724,"FarmTravois",43821,"units/trade/travois_icon_portrait");
AEU(762,"NoblesHutTravois",44296,"ui/units/az_travois_portrait");
AEU(803,"xpBuilder",45822,"units/trade/travois_icon_portrait");
AEU(805,"xpBuilderWar",45878,"units/trade/travois_icon_portrait");
AEU(864,"TradingPostTravois",47135,"units/trade/travois_icon_portrait");
AEU(1432,"xpBuilderStart",69779,"units/trade/travois_icon_portrait");
AEU(984,"YPCastleWagon",61993,"units/asians/shared/wagon/chinese_castle_wagon_icon_portrait");
AEU(1391,"YPMonasteryWagon",69318,"ui/units/bank_wagon_portrait");
AEU(1386,"ypTradingPostWagon",69125,"units/asians/shared/wagon/chinese_town_center_wagon_icon_portrait");
AEU(1385,"ypMarketWagon",69109,"ui/units/bank_wagon_portrait");
AEU(1398,"YPMilitaryRickshaw",69443,"units/asians/shared/wagon/japanese_town_center_wagon_icon_portrait");
AEU(951,"YPRicePaddyWagon",60904,"units/asians/shared/rickshaw/unit_chinese_grove_rickshaw_icon_portrait");
AEU(1282,"YPBerryWagon1",65993,"units/asians/shared/rickshaw/unit_chinese_grove_rickshaw_icon_portrait");
AEU(1352,"YPGroveWagon",68446,"units/asians/shared/rickshaw/unit_indian_grove_rickshaw_icon_portrait");
AEU(1289,"YPDockWagon",66101,"units/asians/shared/wagon/chinese_town_center_wagon_icon_portrait");
AEU(1368,"YPStableWagon",68659,"units/asians/shared/wagon/chinese_town_center_wagon_icon_portrait");
AEU(1428,"ypBankWagon",69619,"ui/units/bank_wagon_portrait");
AEU(1462,"ypBlockhouseWagon",70486,"units/trade/outpost_wagon_portrait");
AEU(962,"ypArsenalWagon",61363,"units/trade/factory_wagon_portrait");
AEU(1390,"ypChurchWagon",69295,"ui/units/bank_wagon_portrait");
AEU(1458,"YPSacredFieldWagon",70302,"units/asians/shared/wagon/indian_town_center_wagon_icon_portrait");
AEU(450,"Cow",28186,"units/animals/cow/cow_portrait");
AEU(1460,"ypSacredCow",70439,"units/animals/cow/cow_portrait");
AEU(620,"Llama",35085,"units/animals/llama/llama_portrait");
AEU(290,"Sheep",22829,"units/animals/sheep/sheep_icon_portrait");
AEU(972,"ypWaterBuffalo",61609,"units/animals/water_buffalo/water_buffalo_icon_portrait");
AEU(980,"ypGoat",61752,"units/animals/goat/goat_icon_portrait");
AEU(1443,"ypGoatFat",70086,"units/animals/goat/goat_icon_portrait");
AEU(1029,"ypYak",62733,"units/animals/yak/yak_icon_portrait");
AEU(924,"ypSacredField",60220,"buildings/asian_civs/sacred_field/sacredfield_icon_portrait");
AMU(285,"Pikeman",22807,"units/infantry/pikeman/pikeman_portrait");
AMU(286,"Musketeer",22805,"units/infantry_ranged/musketeer/musketeer_portrait");
AMU(303,"Crossbowman",22938,"units/infantry_ranged/crossbow/crossbow_portrait");
AMU(302,"Rodelero",22935,"units/infantry/redolero/redolero_portrait");
AMU(312,"Skirmisher",22956,"units/infantry_ranged/skirmisher/skirmisher_portrait");
AMU(306,"Halberdier",22944,"units/infantry/halberdier/halberdier_portrait");
AMU(347,"Cacadore",23909,"units/infantry_ranged/cacadore/cacadore_portrait");
AMU(335,"Strelet",23658,"units/infantry_ranged/strelet/strelet_portrait");
AMU(344,"Dopplesoldner",23836,"units/infantry/dopplesoldner/dopplesoldner_portrait");
AMU(340,"Janissary",23735,"units/infantry_ranged/janissary/janissary_icon_128");
AMU(319,"Longbowman",22979,"units/infantry_ranged/longbow/longbow_portrait");
AMU(739,"xpWarBow",43897,"ui/units/sx_warbow_portrait");
AMU(738,"xpWarClub",43893,"ui/units/sx_warclub_portrait");
AMU(746,"xpWarRifle",43998,"ui/units/sx_warrifle_portrait");
AMU(705,"xpAenna",43455,"ui/units/iro_aenna_portrait");
AMU(706,"xpMusketWarrior",43459,"ui/units/iro_forrest_runner_portrait");
AMU(704,"xpTomahawk",43448,"ui/units/IRO_tomahawk_portrait");
AMU(744,"xpCoyoteMan",43972,"ui/units/az_coyote_man_portrait");
AMU(745,"xpMacehualtin",43976,"ui/units/az_macehuatlin_portrait");
AMU(758,"xpPumaMan",44152,"ui/units/az_puma_man_portrait");
AMU(757,"xpArrowKnight",44148,"ui/units/az_arrow_knight_portrait");
AMU(755,"xpEagleKnight",44140,"ui/units/az_eagle_knight_portrait");
AMU(756,"xpJaguarKnight",44144,"ui/units/az_jaguar_warrior_portrait");
AMU(759,"xpSkullKnight",44156,"ui/units/az_skull_knight_portrait");
AMU(896,"ypYumi",60084,"units/asians/japanese/yumi/yumi_icon_portrait");
AMU(894,"ypKensei",60076,"units/asians/japanese/samurai/samurai_icon_portrait");
AMU(898,"ypAshigaru",60096,"units/asians/japanese/ashigaru/ashigaru_icon_portrait");
AMU(911,"ypQiangPikeman",60160,"units/asians/chinese/qiang_pikeman/qiang_pikeman_icon_portrait");
AMU(912,"ypChangdao",60164,"units/asians/chinese/changdao/changdao_icon_portrait");
AMU(909,"ypChuKoNu",60152,"units/asians/chinese/chu_ko_nu/chu_ko_nu_icon_portrait");
AMU(910,"ypArquebusier",60156,"units/asians/chinese/arquebusier/arquebusier_icon_portrait");
AMU(906,"ypRajput",60140,"units/asians/indians/rajput/rajput_icon_portrait");
AMU(946,"ypSepoy",60807,"units/asians/natives/sepoy/sepoy_icon_portrait");
AMU(961,"ypNatMercGurkha",61271,"units/asians/natives/gurkha/gurkha_icon_portrait");
AMU(308,"Hussar",22948,"units/cavalry/light_cavalry/light_cavalry_portrait");
AMU(352,"Lancer",24119,"units/cavalry/lancer/lancer_portrait");
AMU(314,"Dragoon",22960,"units/cavalry/dragoon/dragoon_portrait");
AMU(346,"Ruyter",23866,"units/cavalry/reiter/reiter_portrait");
AMU(334,"Cossack",23656,"units/cavalry/cossack/cossack_portrait");
AMU(351,"Oprichnik",24108,"units/cavalry/oprichnik/oprichnik_portrait");
AMU(304,"Uhlan",22940,"units/cavalry/uhlan/uhlan_portrait");
AMU(350,"WarWagon",24081,"units/cavalry/war_wagon/war_wagon_icon_portrait");
AMU(307,"CavalryArcher",22946,"units/cavalry/cav_archer/cav_archer_portrait");
AMU(320,"Cuirassier",22981,"units/cavalry/cuirassier/cuirassier_portrait");
AMU(707,"xpHorseman",43463,"ui/units/IRO_horseman_portrait");
AMU(708,"xpMusketRider",43467,"ui/units/iro_musket_rider_portrait");
AMU(766,"xpAxeRider",44426,"ui/units/sx_axe_rider_portrait");
AMU(827,"xpBowRider",46302,"ui/units/sx_bow_rider_portrait");
AMU(742,"xpRifleRider",43957,"ui/units/sx_rifle_rider_portrait");
AMU(768,"xpCoupRider",44434,"ui/units/coup_rider_portrait");
AMU(767,"xpDogSoldier",44430,"ui/units/sx_dog_soldier_portrait");
AMU(897,"ypNaginataRider",60092,"units/asians/japanese/naginata_rider/naginata_rider_icon_portrait");
AMU(895,"ypYabusame",60080,"units/asians/japanese/yabusame/yabusame_icon_portrait");
AMU(913,"ypSteppeRider",60168,"units/asians/chinese/steppe_rider/steppe_rider_icon_portrait");
AMU(914,"ypKeshik",60172,"units/asians/chinese/keshik/keshik_icon_portrait");
AMU(915,"ypIronFlail",60176,"units/asians/chinese/iron_flail/iron_flail_icon_portrait");
AMU(988,"ypMeteorHammer",62086,"units/asians/chinese/meteor_hammer/meteor_hammer_icon_portrait");
AMU(904,"ypMahout",60128,"units/asians/indians/mahout/mahout_icon_portrait");
AMU(905,"ypHowdah",60132,"units/asians/indians/howdah/howdah_icon_portrait");
AMU(902,"ypSowar",60120,"units/asians/indians/sowar/sowar_icon_portrait");
AMU(903,"ypZamburak",60124,"units/asians/indians/zamburak/zamburak_icon_portrait");
AMU(310,"Falconet",22952,"units/artillery/falconet/falconet_portrait");
AMU(345,"OrganGun",23838,"units/artillery/organ_gun/organ_gun_portrait");
AMU(516,"AbusGun",31291,"units/artillery/abus_gun/abus_gun_portrait");
AMU(313,"Grenadier",22958,"units/infantry_ranged/grenadier/grenadier_portrait");
AMU(309,"Culverin",22950,"units/artillery/culverin/culverin_portrait");
AMU(318,"Mortar",22975,"units/artillery/mortar/mortar_portrait");
AMU(709,"xpRam",43471,"ui/units/iro_ram_portrait");
AMU(710,"xpMantlet",43475,"units/natives/mantlet_portrait");
AMU(711,"xpLightCannon",43479,"ui/units/sx_light_cannon_portrait");
AMU(842,"xpHorseArtillery",46620,"ui/units/horse_artillery_portrait");
AMU(772,"xpPetard",45003,"ui/Units/petard_portrait");
AMU(861,"xpPetardNitro",46905,"ui/Units/petard_portrait");
AMU(1284,"ypFlamingArrow",66004,"units/asians/japanese/flaming_arrow/flaming_arrow_icon_portrait");
AMU(1285,"ypMorutaru",66008,"units/asians/japanese/morutaru/morutaru_icon_portrait");
AMU(930,"ypFlameThrower",60333,"units/asians/chinese/flame_thrower/flame_thrower_icon_portrait");
AMU(916,"ypHandMortar",60192,"units/asians/chinese/hand_mortar/hand_mortar_icon_portrait");
AMU(941,"ypMercFlailiphant",60775,"units/asians/mercenaries/flail_elephant/flail_elephant_icon_portrait");
AMU(981,"ypSiegeElephant",61755,"units/asians/indians/siege_elephant/siege_elephant_icon_portrait");
AMU(764,"xpColonialMilitia",44372,"ui/units/colonial_militia_portrait");
AMU(774,"xpGatlingGun",45211,"units/artillery/organ_gun/organ_gun_portrait");
AMU(1108,"ypDelinquentThuggee",64368,"units/asians/mercenaries/delinquent_thuggee/thuggee_icon_portrait");
AMU(1039,"ypConsulateTercio",62960,"units/infantry/pikeman/pikeman_portrait");
AMU(1040,"ypConsulateRedcoat",62964,"units/infantry_ranged/musketeer/musketeer_portrait");
AMU(1041,"ypConsulateLifeGuard",62968,"units/cavalry/light_cavalry/light_cavalry_portrait");
AMU(1053,"ypConsulateJinete",63504,"units/cavalry/dragoon/dragoon_portrait");
AMU(1076,"ypConsulateGuerreiros",63705,"units/infantry_ranged/musketeer/musketeer_portrait");
AMU(1103,"ypConsulateGarrochista",64222,"units/cavalry/lancer/lancer_portrait");
AMU(1104,"ypConsulateCarabineer",64230,"units/cavalry/reiter/reiter_portrait");
AMU(1226,"ypConsulateFalconet",65382,"units/artillery/falconet/falconet_portrait");
AMU(1227,"ypConsulateCulverin",65386,"units/artillery/culverin/culverin_portrait");
AMU(1228,"ypConsulateMortar",65390,"units/artillery/mortar/mortar_portrait");
AMU(1229,"ypConsulateGreatBombard",65394,"units/artillery/great_bombard/great_bombard_portrait");
AMU(1230,"ypConsulateHorseArtillery",65398,"ui/units/horse_artillery_portrait");
AMU(1235,"ypConsulateBestieros",65434,"units/infantry_ranged/crossbow/crossbow_portrait");
AMU(1247,"ypConsulateEspadachins",65770,"units/infantry/redolero/redolero_portrait");
AMU(1248,"ypConsulateStadhouders",65778,"units/infantry_ranged/musketeer/musketeer_portrait");
AMU(1249,"ypConsulateTufanciCorps",65782,"units/infantry_ranged/janissary/janissary_icon_128");
AMU(1250,"ypConsulateGendarmes",65786,"units/cavalry/cuirassier/cuirassier_portrait");
AMU(1251,"ypConsulateCzapakaUhlan",65790,"units/cavalry/uhlan/uhlan_portrait");
AMU(1252,"ypConsulateZweihander",65794,"units/infantry/dopplesoldner/dopplesoldner_portrait");
AMU(1253,"ypConsulateRogersRanger",65798,"units/infantry_ranged/skirmisher/skirmisher_portrait");
AMU(1272,"ypConsulateCannon",65874,"units/artillery/cannon/cannon_portrait");
AMU(1273,"ypConsulateGardener",65884,"units/cavalry/light_cavalry/light_cavalry_portrait");
AMU(1274,"ypConsulateKalmuck",65888,"units/cavalry/dragoon/dragoon_portrait");
AMU(1275,"ypConsulateBashkirPony",65892,"units/cavalry/light_cavalry/light_cavalry_portrait");
AMU(1276,"ypConsulatePrussianNeedleGun",65896,"units/infantry_ranged/skirmisher/skirmisher_portrait");
AMU(1277,"ypConsulateYoungGarde",65900,"units/infantry_ranged/grenadier/grenadier_portrait");
AMU(1325,"ypConsulateSiberianCossack",66469,"units/cavalry/cossack/cossack_portrait");
AMU(815,"SaloonOutlawRider",46122,"units/spc/outlaws/outlaw_rider_portrait");
AMU(816,"SaloonOutlawRifleman",46126,"units/spc/outlaws/outlaw_shotgun_portrait");
AMU(814,"SaloonOutlawPistol",46118,"nuggets/outlaw_kidnap/outlaw_icon_portrait");
AMU(817,"SaloonPirate",46130,"units/spc/pirates/pirate_portrait");
AMU(366,"MercLandsknecht",24820,"units/mercenaries/landsknecht/landsknecht_portrait");
AMU(367,"MercSwissPikeman",24824,"units/mercenaries/swiss_pikeman/swiss_pikeman_portrait");
AMU(372,"MercHighlander",24867,"units/mercenaries/highlander/highlander_portrait");
AMU(382,"MercMameluke",25140,"units/mercenaries/mameluke/mameluke_portrait");
AMU(383,"MercStradiot",25145,"units/mercenaries/balkan_stradiot/balkan_stradiot_portrait");
AMU(384,"MercBlackRider",25150,"units/mercenaries/black_rider/black_rider_portrait");
AMU(385,"MercManchu",25160,"units/mercenaries/manchurian_archer/manchurian_archer_portrait");
AMU(386,"MercRonin",25165,"units/mercenaries/samurai/ronin_portrait");
AMU(387,"MercJaeger",25174,"units/mercenaries/jaeger/hessian_jaeger_portrait");
AMU(388,"MercHackapell",25179,"units/mercenaries/hackapell/hackapell_portrait");
AMU(439,"MercBarbaryCorsair",27311,"units/mercenaries/barbary_corsair/barbary_corsair_portrait");
AMU(731,"MercElmeti",43853,"ui/Units/elmeti_portrait");
AMU(763,"MercFusilier",44368,"ui/units/fusilier_portrait");
AMU(833,"MercGreatCannon",46341,"units/spc/russian_cannon/russian_cannon_icon_portrait");
AMU(734,"MercNinja",43874,"ui/units/ninja_portrait");
AMU(996,"ypDacoit",62193,"units/asians/mercenaries/fugitive_dacoit/dacoit_icon_portrait");
AMU(940,"ypMercIronTroop",60771,"units/asians/mercenaries/iron_troop/iron_troop_icon_portrait");
AMU(1331,"ypMercArsonist",67695,"units/asians/spc/arsonist/arsonist_icon_portrait");
AMU(994,"ypMercJatLancer",62185,"units/asians/mercenaries/jat_lancer/jat_lancer_icon_portrait");
AMU(949,"ypMercYojimbo",60819,"units/asians/mercenaries/yojimbo/yojimbo_icon_portrait");
AMU(1107,"ypThuggee",64364,"units/asians/mercenaries/delinquent_thuggee/thuggee_icon_portrait");
AMU(977,"ypWokouBlindMonk",61700,"units/asians/mercenaries/blind_monk/blind_monk_icon_portrait");
AMU(987,"ypWokouPirate",62056,"units/asians/mercenaries/wokou_pirate/wokou_pirate_icon_portrait");
AMU(974,"ypWokouWanderingHorseman",61680,"units/asians/mercenaries/wandering_horseman/wandering_horseman_icon_portrait");
AMU(1035,"ypWokouWaywardRonin",62781,"units/asians/mercenaries/wayward_ronin/wayward_ronin_icon_portrait");
AMU(1414,"ypRepentantArsonist",69553,"units/asians/spc/arsonist/arsonist_icon_portrait");
AMU(1399,"ypRepentantBarbaryCorsair",69493,"units/mercenaries/barbary_corsair/barbary_corsair_portrait");
AMU(1400,"ypRepentantBlackRider",69497,"units/mercenaries/black_rider/black_rider_portrait");
AMU(1422,"ypRepentantDacoit",69585,"units/asians/mercenaries/fugitive_dacoit/dacoit_icon_portrait");
AMU(1401,"ypRepentantElmeti",69501,"ui/Units/elmeti_portrait");
AMU(1424,"ypRepentantBlindMonk",69593,"units/asians/mercenaries/blind_monk/blind_monk_icon_portrait");
AMU(1402,"ypRepentantFusilier",69505,"ui/units/fusilier_portrait");
AMU(1404,"ypRepentantHackapell",69513,"units/mercenaries/hackapell/hackapell_portrait");
AMU(1405,"ypRepentantHighlander",69517,"units/mercenaries/highlander/highlander_portrait");
AMU(1415,"ypRepentantIronTroop",69557,"units/asians/mercenaries/iron_troop/iron_troop_icon_portrait");
AMU(1406,"ypRepentantJaeger",69521,"units/mercenaries/jaeger/hessian_jaeger_portrait");
AMU(1416,"ypRepentantJatLancer",69561,"units/asians/mercenaries/jat_lancer/jat_lancer_icon_portrait");
AMU(1407,"ypRepentantLandsknecht",69525,"units/mercenaries/landsknecht/landsknecht_portrait");
AMU(1408,"ypRepentantMameluke",69529,"units/mercenaries/mameluke/mameluke_portrait");
AMU(1409,"ypRepentantManchu",69533,"units/mercenaries/manchurian_archer/manchurian_archer_portrait");
AMU(1403,"ypRepentantGreatCannon",69509,"units/spc/russian_cannon/russian_cannon_icon_portrait");
AMU(1410,"ypRepentantNinja",69537,"ui/units/ninja_portrait");
AMU(1418,"ypRepentantOutlawPistol",69569,"nuggets/outlaw_kidnap/outlaw_icon_portrait");
AMU(1419,"ypRepentantOutlawRider",69573,"units/spc/outlaws/outlaw_rider_portrait");
AMU(1420,"ypRepentantOutlawRifleman",69577,"units/spc/outlaws/outlaw_shotgun_portrait");
AMU(1421,"ypRepentantPirate",69581,"units/spc/pirates/pirate_portrait");
AMU(1411,"ypRepentantRonin",69541,"units/mercenaries/samurai/ronin_portrait");
AMU(1425,"ypRepentantSmuggler",69597,"units/asians/mercenaries/wokou_pirate/wokou_pirate_icon_portrait");
AMU(1412,"ypRepentantStradiot",69545,"units/mercenaries/balkan_stradiot/balkan_stradiot_portrait");
AMU(1413,"ypRepentantSwissPikeman",69549,"units/mercenaries/swiss_pikeman/swiss_pikeman_portrait");
AMU(1423,"ypRepentantThuggee",69589,"units/asians/mercenaries/delinquent_thuggee/thuggee_icon_portrait");
AMU(1426,"ypRepentantWanderingHorseman",69601,"units/asians/mercenaries/wandering_horseman/wandering_horseman_icon_portrait");
AMU(1427,"ypRepentantWaywardRonin",69605,"units/asians/mercenaries/wayward_ronin/wayward_ronin_icon_portrait");
AMU(1417,"ypRepentantYojimbo",69565,"units/asians/mercenaries/yojimbo/yojimbo_icon_portrait");
AMU(869,"NatMercHolcanSpearman",48461,"units/natives/holcan_spearman_portrait");
AMU(870,"NatMercLightningWarrior",48465,"ui/units/az_zapotec_lightning_warrior_portrait");
AMU(871,"NatMercRifleman",48469,"units/natives/rifleman_portrait");
AMU(872,"NatMercTracker",48477,"units/natives/cree_tracker_portrait");
AMU(873,"NatMercBlackwoodArcher",48481,"units/natives/tupi_archer_portrait");
AMU(874,"NatMercClubman",48485,"units/natives/clubman_icon_portrait");
AMU(875,"NatMercCheyenneRider",48489,"ui/units/cheyenne_cav_portrait");
AMU(876,"NatMercHorseArcher",48493,"units/natives/horse_archer_portrait");
AMU(877,"NatMercHuronMantlet",48502,"ui/units/huron_mantlet_portrait");
AMU(880,"NatMercBlowgunWarrior",48952,"units/natives/blowgun_portrait");
AMU(966,"ypNatMercChakram",61382,"units/asians/natives/chakram/chakram_icon_portrait");
AMU(967,"ypNatMercConquistador",61386,"units/asians/natives/conquistador/conquistador_icon_portrait");
AMU(968,"ypNatMercRattanShield",61390,"units/asians/natives/rattan_shield/shield_rattan_icon_portrait");
AMU(969,"ypNatMercTigerClaw",61394,"units/asians/natives/tiger_claw/Tiger_claw_icon_portrait");
AMU(970,"ypNatMercWarElephant",61418,"units/asians/natives/war_elephant/war_elephant_icon_portrait");
AMU(1070,"ypNatMercSohei",63619,"units/asians/japanese/sohei/sohei_icon_portrait");
AMU(947,"ypNatChakram",60811,"units/asians/natives/chakram/chakram_icon_portrait");
AMU(945,"ypNatConquistador",60803,"units/asians/natives/conquistador/conquistador_icon_portrait");
AMU(942,"ypNatRattanShield",60787,"units/asians/natives/rattan_shield/shield_rattan_icon_portrait");
AMU(944,"ypNatTigerClaw",60799,"units/asians/natives/tiger_claw/Tiger_claw_icon_portrait");
AMU(948,"ypNatWarElephant",60815,"units/asians/natives/war_elephant/war_elephant_icon_portrait");
AMU(357,"NatBolasWarrior",24189,"units/natives/bola_portrait");
AMU(353,"NatBlowgunWarrior",24181,"units/natives/blowgun_portrait");
AMU(735,"NatApacheCavalry",43882,"ui/units/apache_cavalry_portrait");
AMU(361,"NatBlackwoodArcher",24197,"units/natives/tupi_archer_portrait");
AMU(732,"NatCheyenneRider",43857,"ui/units/cheyenne_cav_portrait");
AMU(359,"NatClubman",24193,"units/natives/clubman_icon_portrait");
AMU(577,"NatClubmanLoyal",33944,"units/natives/nootka_warchief_portrait");
AMU(358,"NatHolcanSpearman",24191,"units/natives/holcan_spearman_portrait");
AMU(325,"NatHorseArcher",23525,"units/natives/horse_archer_portrait");
AMU(356,"NatHuaminca",24187,"units/natives/humainca_portrait");
AMU(733,"NatHuronMantlet",43870,"ui/units/huron_mantlet_portrait");
AMU(730,"NatKlamathRifleman",43849,"ui/units/klamath_rifleman_portrait");
AMU(722,"NatLightningWarrior",43756,"ui/units/az_zapotec_lightning_warrior_portrait");
AMU(773,"NatMapucheClubman",45012,"ui/units/mapuche_clubman_portrait");
AMU(736,"NatNavajoRifleman",43886,"ui/units/navajo_rifleman_portrait");
AMU(354,"NatRifleman",24183,"units/natives/rifleman_portrait");
AMU(330,"NatSharktoothBowman",23599,"units/natives/sharktooth_bow_portrait");
AMU(355,"NatTracker",24185,"units/natives/cree_tracker_portrait");
AMU(899,"ypNatSohei",60100,"units/asians/japanese/sohei/sohei_icon_portrait");
AMU(377,"PetBear",24947,"units/animals/bear/bearblack_portrait");
AMU(380,"WarDog",25043,"units/wardogs/war_dog_portrait");
AMU(419,"PetJaguar",26167,"units/animals/jaguar/jaguar_portrait");
AMU(461,"PetCougar",28635,"units/animals/cougar/cougar_portrait");
AMU(462,"PetGrizzly",28642,"units/animals/bear/beargrizzly_portrait");
AMU(463,"PetPolarBear",28649,"units/animals/bear/bearpolar_portrait");
AMU(464,"PetWolf",28656,"units/animals/wolf/wolf_icon_portrait");
AMU(467,"ExplorerDog",28974,"units/wardogs/war_dog_portrait");
AMU(473,"PetCoyote",29162,"units/animals/wolf/wolf_icon_portrait");
AMU(1052,"ypMonkDisciple",63454,"units/asians/chinese/monk/shaolin_monk_icon_portrait");
AMU(938,"YPPetTiger",60749,"units/animals/tiger/tiger_icon_portrait");
AMU(939,"YPPetRhino",60753,"units/animals/rhino/rhino_icon_portrait");
AMU(950,"ypPetKomodoDragon",60863,"units/animals/monitor_lizard/monitor_lizard_icon_portrait");
AMU(978,"ypPetOrangutan",61716,"units/animals/orangutan/orangutan_icon_portrait");
AMU(993,"YPPetPanda",62167,"units/animals/panda/panda_icon_portrait");
AMU(1074,"ypPetLion",63684,"units/animals/lion/lion_icon_portrait");
AMU(1075,"YPPetWhiteTiger",63692,"units/animals/white_tiger/white_tiger_icon_portrait");
AMU(1332,"ypPetTibetanMacaque",67699,"units/animals/tibetan_macaque/Macaque_icon_portrait");
AMU(1430,"ypPetSnowMonkey",69647,"units/animals/snow_monkey/snowmonkey_icon_portrait");
AMU(349,"Rocket",24048,"units/artillery/rocket/rocket_portrait");
AMU(341,"GreatBombard",23737,"units/artillery/great_bombard/great_bombard_portrait");
AMU(305,"Cannon",22942,"units/artillery/cannon/cannon_portrait");
AMU(829,"xpSpy",46322,"ui/units/spy_portrait");
AMU(917,"ypFlyingCrow",60196,"units/asians/chinese/flying_crow/flying_crow_icon_portrait");
AMU(1242,"ypDaimyoMototada",65576,"units/asians/japanese/daimyo_mototada/daimyo_mototada_icon_portrait");
AMU(901,"ypShogunTokugawa",60116,"units/asians/japanese/shogun/shogun_icon_portrait");
AMU(1241,"ypDaimyoKiyomasa",65572,"units/asians/japanese/daimyo_Kiyomasa/daimyo_kiyomasa_icon_portrait");
AMU(1243,"ypDaimyoMasamune",65582,"units/asians/japanese/daimyo_Masamune/daimyo_massamune_icon_portrait");
AMU(339,"Spahi",23733,"units/cavalry/spahi/spahi_portrait");
AMU(907,"ypUrumi",60144,"units/asians/indians/urumi/urumi_icon_portrait");
AMU(342,"Minuteman",23826,"units/infantry_ranged/minuteman/minuteman_portrait");
AMU(811,"xpWarrior",46033,"ui/units/warrior_portrait");
AMU(1238,"ypIrregular",65487,""); ///FLAG
AMU(1239,"ypPeasant",65491,""); ///FLAG
AMU(1223,"ypRajputMansabdar",65149,"units/asians/indians/mansabdar/rajput_mansabdar_icon_portrait");
AMU(1222,"ypUrumiMansabdar",65145,"units/asians/indians/mansabdar/urumi_mansabdar_icon_portrait");
AMU(1221,"ypSepoyMansabdar",65135,"units/asians/indians/mansabdar/sepoy_mansabdar_icon_portrait");
AMU(1387,"ypNatMercGurkhaJemadar",69139,"units/asians/indians/mansabdar/gurkha_mansabdar_icon_portrait");
AMU(1224,"ypSowarMansabdar",65153,"units/asians/indians/mansabdar/sowar_mansabdar_icon_portrait");
AMU(1225,"ypZamburakMansabdar",65157,"units/asians/indians/mansabdar/zamburak_mansabdar_icon_portrait");
AMU(1279,"ypMahoutMansabdar",65943,"units/asians/indians/mansabdar/mahout_mansabdar_icon_portrait");
AMU(1281,"ypMercFlailiphantMansabdar",65951,"units/asians/indians/mansabdar/flail_elephant_mansabdar_icon_portrait");
AMU(1278,"ypHowdahMansabdar",65939,"units/asians/indians/mansabdar/howdah_mansabdar_icon_portrait");
AMU(1280,"ypSiegeElephantMansabdar",65947,"units/asians/indians/mansabdar/siege_elephant_mansabdar_icon_portrait");
AMU(1337,"ypConsulateRonin",68241,"units/mercenaries/samurai/ronin_portrait");
AMU(1336,"ypConsulateNinja",68237,"ui/units/ninja_portrait");
AMU(1339,"ypConsulateYamabushi",68261,"units/asians/natives/yamabushi/yamabushi_icon_portrait");
AMU(1338,"ypConsulateShinobi",68257,"units/asians/japanese/shinobi/shinobi_icon_portrait");
AMU(371,"GrizzlyBear",24864,"units/animals/bear/beargrizzly_portrait");
AMU(378,"PolarBear",24983,"units/animals/bear/bearpolar_portrait");
AMU(412,"Jaguar",25958,"units/animals/jaguar/jaguar_portrait");
AMU(420,"BlackBear",26174,"units/animals/bear/bearblack_portrait");
AMU(432,"Cougar",26516,"units/animals/cougar/cougar_portrait");
AMU(451,"Wolf",28233,"units/animals/wolf/wolf_icon_portrait");
AMU(465,"Coyote",28716,"units/animals/wolf/wolf_icon_portrait");
AMU(474,"OutlawRider",29169,"units/spc/outlaws/outlaw_rider_portrait");
AMU(475,"OutlawBlowgunner",29183,"units/natives/blowgun_portrait");
AMU(476,"OutlawRifleman",29190,"units/spc/outlaws/outlaw_shotgun_portrait");
AMU(483,"Alligator",29646,"units/animals/alligator/alligator_portrait");
AMU(484,"Pirate",29650,"units/spc/pirates/pirate_portrait");
AMU(631,"OutlawPistol",35421,"nuggets/outlaw_kidnap/outlaw_icon_portrait");
AMU(937,"ypWokou",60536,"units/asians/mercenaries/wokou_pirate/wokou_pirate_icon_portrait");
AMU(975,"ypWanderingHorseman",61688,"units/asians/mercenaries/wandering_horseman/wandering_horseman_icon_portrait");
AMU(976,"ypBlindMonk",61696,"units/asians/mercenaries/blind_monk/blind_monk_icon_portrait");
AMU(995,"ypFugitiveDacoit",62189,"units/asians/mercenaries/fugitive_dacoit/dacoit_icon_portrait");
AMU(1013,"ypLionTailedMacaque",62638,"units/animals/lion_tailed_macaque/Liontailed_Macaque_icon_portrait");
AMU(1016,"ypRhino",62648,"units/animals/rhino/rhino_icon_portrait");
AMU(1017,"ypTiger",62652,"units/animals/tiger/tiger_icon_portrait");
AMU(1019,"ypLion",62660,"units/animals/lion/lion_icon_portrait");
AMU(1030,"ypMonitorLizard",62736,"units/animals/monitor_lizard/monitor_lizard_icon_portrait");
AMU(1031,"ypTibetanMacaque",62740,"units/animals/tibetan_macaque/Macaque_icon_portrait");
AMU(1032,"ypBlackPanther",62744,"units/animals/black_panther/black_panther_icon_portrait");
AMU(1036,"ypWaywardRonin",62785,"units/asians/mercenaries/wayward_ronin/wayward_ronin_icon_portrait");
AMU(1037,"ypWokouArmy",62806,"units/asians/chinese/wokou_army/wokou_army_icon_64");
AMU(1044,"ypSnowLeopard",63005,"units/animals/snow_leopard/snow_leopard_icon_portrait");
AMU(1018,"ypWhiteTiger",62656,"units/animals/white_tiger/white_tiger_icon_portrait");
AMU(1077,"ypSnowMonkey",63921,"units/animals/snow_monkey/snowmonkey_icon_portrait");
AMU(1078,"ypPanda",63925,"units/animals/panda/panda_icon_portrait");
AMU(1079,"ypOrangutan",63929,"units/animals/orangutan/orangutan_icon_portrait");
AWU(337,"Canoe",23694,"ui/units/native_canoe_portrait");
AWU(289,"Caravel",22826,"units/naval/caravel_ship/caravel_ship_portrait");
AWU(443,"Galleon",27705,"units/naval/galleon/galleon_icon_portrait");
AWU(444,"Galley",27712,"units/naval/galley/galley_portrait");
AWU(442,"Fluyt",27698,"units/naval/fluyt/fluyt_portrait");
AWU(441,"Frigate",27684,"units/naval/frigate/frigate_icon_portrait");
AWU(511,"Monitor",30923,"units/naval/monitor/monitor_icon_portrait");
AWU(717,"xpWarCanoe",43509,"ui/units/az_war_canoe_portrait");
AWU(750,"xpTlalocCanoe",44047,"ui/units/tlaloc_canoe_portrait");
AWU(954,"ypFireship",61076,"units/asians/naval/fire_ship/fire_ship_icon_portrait");
AWU(1069,"ypFuchuan",63614,"units/asians/naval/fuchuan/fuchuan_icon_portrait");
AWU(953,"ypFune",61072,"units/asians/naval/fune/fune_icon_portrait");
AWU(952,"ypAtakabune",61064,"units/asians/naval/atakabune/atakebune_icon_portrait");
AWU(1246,"ypTekkousen",65600,"units/asians/naval/tekkousen/tekkousen_icon_portrait");
AWU(445,"Privateer",27726,"units/naval/privateer/privateer_icon_portrait");
AWU(1117,"ypMarathanCatamaran",64515,"units/asians/naval/catamaran/catamaran_icon_portrait");
AWU(973,"ypWokouJunk",61666,"units/asians/naval/wokou_junk/wokou_junk_icon_portrait");
AWU(839,"xpIronclad",46594,"ui/units/ironclad_portrait");
ARU(288,"Explorer",22824,"units/explorers/explorer_portrait");
ARU(712,"xpIroquoisWarChief",43489,"ui/units/IRO_warchief_portrait");
ARU(741,"xpLakotaWarchief",43953,"ui/units/sx_warchief_portrait");
ARU(760,"xpAztecWarchief",44160,"ui/units/az_warchief_portrait");
ARU(918,"ypMonkChinese",60200,"units/asians/chinese/shaolin_disciple/shaolin_master_icon_portrait");
ARU(1359,"ypMonkChinese2",68486,"units/asians/chinese/shaolin_disciple/shaolin_master_icon_portrait");
ARU(908,"ypMonkIndian",60148,"units/asians/indians/monk/indian_monk_icon_portrait");
ARU(1045,"ypMonkIndian2",63107,"units/asians/indians/monk/indian_monk_icon_portrait");
ARU(900,"ypMonkJapanese",60104,"units/asians/japanese/monk/monk_icon_portrait");
ARU(1046,"ypMonkJapanese2",63115,"units/asians/japanese/monk/monk_icon_portrait");
ARU(989,"ypOldHanArmy",62090,"units/asians/chinese/standard_army/standard_army_icon_64");
ARU(1326,"ypStandardArmy",66592,"units/asians/chinese/ming_army/ming_army_icon_64");
ARU(1327,"ypMingArmy",66595,"units/asians/chinese/qing_army/qing_army_icon_64");
ARU(992,"ypTerritorialArmy",62102,"units/asians/chinese/forbidden_army/forbidden_army_icon_64");
ARU(991,"ypForbiddenArmy",62098,"units/asians/chinese/mongolian_army/mongolian_army_icon_64");
ARU(990,"ypImperialArmy",62094,"units/asians/chinese/territorial_army/territorial_army_icon_64");
ARU(1395,"ypMongolianArmy",69406,"units/asians/chinese/new_mongolian_army/new_mongolian_army_icon_64");
ARU(1378,"ypBlackFlagArmy",68729,"units/asians/chinese/old_han_army/old_han_icon_64");
ARU(1266,"ypConsulateArmySpanish3",65850,"units/infantry/redolero/redolero_portrait");
ARU(1265,"ypConsulateArmySpanish2",65846,"units/artillery/falconet/falconet_portrait");
ARU(1106,"ypConsulateArmySpanish1",64343,"units/asians/consulate/spanish_expeditionary_company");
ARU(1261,"ypConsulateArmyRussian3",65830,"units/asians/consulate/rus_armies/rus_army_icon_64");
ARU(1260,"ypConsulateArmyRussian2",65826,"units/asians/consulate/rus_armies/rus_force_icon_64");
ARU(1233,"ypConsulateArmyRussian1",65422,"units/asians/consulate/rus_armies/rus_company_icon_64");
ARU(1255,"ypConsulateArmyOttoman3",65806,"units/artillery/great_bombard/great_bombard_portrait");
ARU(1254,"ypConsulateArmyOttoman2",65802,"units/infantry_ranged/janissary/janissary_icon_128");
ARU(1231,"ypConsulateArmyOttoman1",65410,"units/asians/consulate/ottoman_expeditionary_company");
ARU(1271,"ypConsulateArmyGerman3",65870,"units/artillery/cannon/cannon_portrait");
ARU(1270,"ypConsulateArmyGerman2",65866,"units/infantry_ranged/skirmisher/skirmisher_portrait");
ARU(1269,"ypConsulateArmyGerman1",65862,"units/asians/consulate/german_expeditionary_company");
ARU(1268,"ypConsulateArmyFrench3",65858,"units/asians/consulate/french_armies/french_army_icon_64");
ARU(1267,"ypConsulateArmyFrench2",65854,"units/asians/consulate/french_armies/french_force_icon_64");
ARU(1234,"ypConsulateArmyFrench1",65430,"units/asians/consulate/french_armies/french_company_icon_64");
ARU(1259,"ypConsulateArmyDutch3",65822,"units/artillery/mortar/mortar_portrait");
ARU(1258,"ypConsulateArmyDutch2",65818,"units/asians/consulate/dutch_expeditionary_force");
ARU(1232,"ypConsulateArmyDutch1",65418,"units/asians/consulate/dutch_expeditionary_company");
ARU(1264,"ypConsulateArmyBritish3",65842,"units/asians/consulate/british_armies/british_army_icon_64");
ARU(1263,"ypConsulateArmyBritish2",65838,"units/asians/consulate/british_armies/british_force_icon_64");
ARU(1262,"ypConsulateArmyBritish1",65834,"units/asians/consulate/british_armies/british_company_icon_64");
ARU(294,"TownCenter",22841,"buildings/town_center/towncenter_portrait");
ARU(468,"LivestockPen",29032,"buildings/livestock pen/livestock_pen_portrait");
ARU(434,"Market",26749,"buildings/market/market_portrait");
ARU(287,"Mill",22804,"buildings/mill/mill_portrait");
ARU(297,"Dock",22914,"buildings/dock/dock_portrait");
ARU(429,"Outpost",26307,"buildings/outpost/outpost_portrait");
ARU(332,"Blockhouse",23634,"buildings/blockhouse/blockhouse_portrait");
ARU(292,"TradingPost",22837,"buildings/trading_post/trading_post_portrait");
ARU(301,"Church",22928,"buildings/church/church_portrait");
ARU(296,"Barracks",22847,"buildings/barracks/barracks_portraits");
ARU(298,"Stable",22919,"buildings/stables/stables_portrait");
ARU(299,"ArtilleryDepot",22922,"buildings/artillery_depot/artillery_depot_portrait");
ARU(300,"Arsenal",22924,"buildings/arsenal/arsenal_portrait");
ARU(417,"Plantation",26042,"buildings/plantation/plantation_portrait");
ARU(507,"Capitol",30241,"buildings/capitol/capitol_portrait");
ARU(672,"HouseEast",41968,"buildings/house/house_portrait");
ARU(673,"HouseMed",41972,"buildings/house/house_portrait");
ARU(509,"Manor",30633,"buildings/house/house_portrait");
ARU(293,"House",22839,"buildings/house/house_portrait");
ARU(391,"FortFrontier",25270,"buildings/fort/fort_portrait");
ARU(487,"FieldHospital",29733,"buildings/field_hospital/field_hostpital_portrait");
ARU(855,"NativeEmbassy",46755,"ui/buildings/native_embassy_portrait");
ARU(813,"Saloon",46097,"ui/buildings/saloon_portrait");
ARU(743,"FirePit",43965,"ui/Buildings/fire_pit_portrait");
ARU(824,"Teepee",46289,"ui/buildings/teepee_portriat");
ARU(720,"Longhouse",43677,"ui/buildings/iro_house_portrait");
ARU(867,"HouseAztec",48430,"ui/buildings/az_house_portrait");
ARU(716,"Farm",43505,"ui/Buildings/farm_portrait");
ARU(713,"WarHut",43492,"ui/Buildings/war_hut_portrait");
ARU(715,"Corral",43502,"ui/Buildings/corral_portrait");
ARU(754,"NoblesHut",44136,"ui/Buildings/nobles_hut_portrait");
ARU(1240,"ypTradeMarketAsian",65500,"buildings/asian_civs/trade_market/japan/japanese_market_icon_portrait");
ARU(923,"ypStableJapanese",60216,"buildings/stables/stables_portrait");
ARU(919,"ypRicePaddy",60204,"buildings/asian_civs/rice_paddy/china/china_rice_paddy_icon_portrait");
ARU(920,"ypMonastery",60207,"buildings/asian_civs/monastery/monastery_icon_portrait");
ARU(932,"YPDockAsian",60380,"buildings/asian_civs/dock/india_dock_icon_potrait");
ARU(922,"ypConsulate",60213,"buildings/asian_civs/consulate/consulate_icon_portrait");
ARU(1043,"ypCastle",62979,""); ///FLAG
ARU(927,"ypBarracksJapanese",60237,"buildings/asian_civs/barracks/japan_barracks_icon_portrait");
ARU(1283,"ypBerryBuilding",65997,"buildings/asian_civs/orchard/orchard_icon_portrait");
ARU(1389,"ypChurch",69283,"buildings/church/church_portrait");
ARU(964,"ypArsenalAsian",61372,"buildings/arsenal/arsenal_portrait");
ARU(926,"ypWarAcademy",60231,"buildings/asian_civs/war_academy/china_waracademy_icon_portrait");
ARU(925,"ypVillage",60227,"buildings/asian_civs/village/chinese_village_icon_portrait");
ARU(924,"ypSacredField",60220,"buildings/asian_civs/sacred_field/sacredfield_icon_portrait");
ARU(929,"ypHouseIndian",60276,"buildings/asian_civs/house_indian/house_indian_icon_portrait");
ARU(921,"ypCaravanserai",60210,"buildings/asian_civs/caravanserai/india/caravanserai_icon_portrait");
ARU(1351,"ypGroveBuilding",68443,"buildings/asian_civs/grove/grove_icon_portrait");
ARU(931,"YPBarracksIndian",60376,"buildings/asian_civs/barracks/india_barracks_icon_portrait");
	cEf(" } ");
}

//A lot of info related to technologies
if(true){
	cEf(" void loadimprovarrays(int wtv=-1){ ");
ITT(168,63986,"ui\techs\asians\regenerative_forestry");
ITT(193,68401,"units\mercenaries\black_rider\black_rider_icon");
ITT(259,70233,"ui\techs\asians\tech_legendary_natives");
ITT(260,11070,"ui\techs\gang_saw\gang_saw_64x64");
ITT(261,22849,"ui\techs\veteran_infantry\veteran_infantry");
ITT(262,23052,"ui\techs\veteran_spear_infantry\veteran_spear_infantry");
ITT(263,23054,"ui\techs\guard_infantry\guard_infantry");
ITT(264,23061,"ui\techs\log_flume\log_flume_64x64");
ITT(265,23188,"ui\techs\veteran_archer_infantry\veteran_archer_infantry");
ITT(266,23197,"ui\techs\veteran_cavalry\veteran_cavalry");
ITT(267,23200,"ui\techs\guard_cavalry\guard_cavalry");
ITT(268,23207,"ui\techs\guard_spear_infantry\guard_spear_infantry");
ITT(269,23210,"ui\techs\veteran_cavalry\veteran_cavalry");
ITT(270,23214,"ui\techs\guard_cavalry\guard_cavalry");
ITT(271,23221,"ui\techs\guard_cavalry\guard_cavalry");
ITT(272,23224,"ui\techs\guard_grenadier_artillery\guard_grenadier_artillery");
ITT(273,23227,"ui\techs\guard_infantry\guard_infantry");
ITT(274,23230,"ui\techs\guard_cavalry\guard_cavalry");
ITT(275,23233,"ui\techs\guard_cavalry\guard_cavalry");
ITT(276,23255,"ui\techs\guard_cavalry\guard_cavalry");
ITT(277,23263,"ui\techs\veteran_archer_infantry\veteran_archer_infantry");
ITT(278,23295,"ui\techs\infantry_breastplate\infantry_breastplate");
ITT(279,23298,"ui\techs\paper_cartridge\paper_cartridge");
ITT(280,23307,"ui\techs\cavalry_cuirass\cavalry_cuirass");
ITT(281,23311,"ui\techs\trunion\trunion");
ITT(282,23322,"ui\techs\professional_gunners\professional_gunners");
ITT(283,23328,"ui\techs\military_drummers\military_drummers");
ITT(284,23331,"ui\techs\flint_lock\flint_lock");
ITT(285,23335,"ui\techs\bayonet\bayonet");
ITT(286,23341,"ui\techs\rifling\rifling");
ITT(287,23349,"ui\techs\gunners_quadrant\gunners_quadrant");
ITT(288,23354,"ui\techs\heated_shot\heated_shot");
ITT(289,23364,"ui\techs\guard_artillery\guard_artillery");
ITT(290,23367,"ui\techs\guard_artillery\guard_artillery");
ITT(291,23370,"ui\techs\guard_artillery\guard_artillery");
ITT(292,23389,"ui\techs\town_watch\town_watch");
ITT(293,23401,"ui\techs\hunting_dogs\hunting_dogs_64x64");
ITT(294,23403,"ui\techs\selective_breeding\selective_breeding");
ITT(295,23406,"ui\techs\seed_drill\seed_drill");
ITT(296,23409,"ui\techs\artificial_fertilizer\artificial_fertilizer");
ITT(297,23412,"ui\techs\bookkeeping\bookkeeping");
ITT(298,23415,"ui\techs\homesteading\homesteading");
ITT(299,23420,"ui\techs\great_coat\great_coat_64x64");
ITT(300,23452,"ui\techs\bastion\bastion");
//ITT(301,23459,"ui\techs\levy\levy");
//ITT(302,36107,"ui\techs\conscription\conscription");
ITT(303,23476,"ui\techs\guard_infantry\guard_infantry");
ITT(304,23479,"ui\techs\guard_cavalry\guard_cavalry");
ITT(305,23482,"ui\techs\garde_imperial\garde_imperial_1_icon_64x64");
ITT(306,23490,"ui\techs\code_napoleon\code_napoleon_64x64");
ITT(307,23527,"ui\techs/native_mustangs/nat_mustangs");
ITT(308,23530,"ui\techs/native_horse_breeding/nat_horse_breeding");
ITT(309,23541,"ui\techs/native_chinampa/nat_chinampa");
ITT(310,29384,"ui\techs\champion_natives\champion_natives");
ITT(311,29388,"ui\techs\champion_natives\champion_natives");
ITT(312,23608,"ui\techs/native_textile_craftsmanship/nat_textile_craftsmanship");
ITT(313,23611,"ui\techs/native_guerilla_wars/nat_guerilla_wars");
ITT(314,23613,"ui\techs/native_lacrosse/nat_lacrosse");
ITT(315,23615,"ui\techs/native_iroquois_league/nat_iroquois_league");
ITT(316,23618,"ui\techs/native_morning_wars/nat_morning_wars");
ITT(317,29393,"ui\techs\champion_natives\champion_natives");
ITT(318,29390,"ui\techs\champion_natives\champion_natives");
ITT(319,23660,"ui\techs\guard_cavalry\guard_cavalry");
ITT(320,23664,"ui\techs\veteran_cavalry\veteran_cavalry");
ITT(321,23672,"ui\techs\kalmucks\kalmucks_icon");
ITT(322,23675,"ui\techs\bashkir_ponies\bashkir_ponies_64x64");
ITT(323,23678,"ui\techs\westernization\westernization_64x64");
ITT(324,23680,"ui\techs\petrine_reforms\petrine_reform_64x64");
ITT(325,23716,"ui\techs\guard_infantry\guard_infantry");
ITT(326,23723,"ui\techs\thin_red_line\thin_red_line");
ITT(327,23757,"ui\techs\veteran_infantry\veteran_infantry");
ITT(328,23761,"ui\techs\guard_infantry\guard_infantry");
ITT(329,23765,"ui\techs\tufanci_corps\tufanci_corps_64x64");
ITT(330,23768,"ui\techs\topcu_corpse\topcu_corps_64x64");
ITT(331,23777,"ui\techs\guard_grenadier_artillery\guard_grenadier_artillery");
ITT(332,23831,"ui\techs\guard_infantry\guard_infantry");
ITT(333,23834,"ui\techs\guard_cavalry\guard_cavalry");
ITT(334,23840,"ui\techs\zweihander\zweihander_64x64");
ITT(335,23843,"ui\techs\corsolet\corsolet");
ITT(336,23846,"ui\techs\guard_cavalry\guard_cavalry");
ITT(337,23849,"ui\techs\quatrefage\quatrefage");
ITT(338,23858,"ui\techs\veteran_sword_infantry\veteran_sword_infantry");
ITT(339,23872,"ui\techs\guard_cavalry\guard_cavalry");
ITT(340,23876,"ui\techs\guard_spear_infantry\guard_spear_infantry");
ITT(341,23882,"ui\techs\gas_lighting\gas_lighting");
ITT(342,23885,"ui\techs\coffee_trade\coffee_trade");
ITT(343,23888,"ui\techs\guard_cavalry\guard_cavalry");
ITT(344,23911,"ui\techs\guard_infantry\guard_infantry");
ITT(345,23915,"ui\techs\guard_cavalry\guard_cavalry");
ITT(346,23918,"ui\techs\bestieros\bestieros_64x64");
ITT(347,23956,"ui\techs\guard_cavalry\guard_cavalry");
ITT(348,23959,"ui\techs\millet_system\millet_system_64x64");
ITT(349,23978,"ui\techs\wallenstein_contracts\wallenstein_contracts_64x64");
ITT(350,23981,"ui\techs\stadholders\stadholders_64x64");
ITT(351,23984,"ui\techs\standing_army\standing_army");
ITT(352,24111,"ui\techs\guard_cavalry\guard_cavalry");
ITT(353,24125,"ui\techs\guard_cavalry\guard_cavalry");
ITT(354,24138,"ui\techs\guard_cavalry\guard_cavalry");
ITT(355,24160,"ui\techs\guard_grenadier_artillery\guard_grenadier_artillery");
ITT(356,29386,"ui\techs\champion_natives\champion_natives");
ITT(357,29392,"ui\techs\champion_natives\champion_natives");
ITT(358,29394,"ui\techs\champion_natives\champion_natives");
ITT(359,29389,"ui\techs\champion_natives\champion_natives");
ITT(360,29391,"ui\techs\champion_natives\champion_natives");
ITT(361,29383,"ui\techs\champion_natives\champion_natives");
ITT(362,29385,"ui\techs\champion_natives\champion_natives");
ITT(363,24240,"ui\techs/native_garifuna_drums/nat_garifuna_drums");
ITT(364,24246,"ui\techs/native_war_dance/nat_war_dance");
ITT(365,24252,"ui\techs/native_bowyery/nat_bowyery");
ITT(366,24254,"ui\techs/native_kinship/nat_kinship");
ITT(367,24256,"ui\techs/native_roadbuilding/nat_roadbuilding");
ITT(368,24259,"ui\techs/native_tanning/nat_tanning");
ITT(369,24262,"ui\techs/native_cotton_armor/nat_cotton_armor");
ITT(370,24264,"ui\techs/native_bark_clothing/nat_bark_clothing");
ITT(371,24268,"ui\techs/native_poison_arrow_frogs/nat_poison_arrow_frogs");
ITT(372,24304,"ui\techs\gill_nets\gill_nets");
ITT(373,24306,"ui\techs\long_lines\long_lines");
ITS(374,24635);
ITS(375,24638,"ui\techs\hc_mercenary_loyalty\hc_mercenary_loyalty");
ITS(376,24644);
ITS(377,24656,"ui\techs\hc_fish_market\hc_fish_market");
ITS(378,24665,"ui\techs\hc_advanced_plantation\hc_advanced_plantation");
ITS(379,24671,"ui\techs\hc_cigar_roller\hc_cigar_roller");
ITS(380,24716,"units\balloons\hot_air_balloon");
ITT(381,24784,"ui\techs\blunderbuss\blunderbuss_64x64");
ITT(382,25253,"ui\techs/native_animal_lore/nat_animal_lore");
ITT(383,25262,"ui\techs/native_basket_weaving/nat_basket_weaving");
ITT(384,25512,"ui\techs\star_fort\star_fort");
ITT(385,25921,"ui\techs/native_chasquis_messengers/nat_chasquis_messengers");
ITT(386,25923,"ui\techs/native_metalworking/nat_metalworking");
ITS(387,25932);
ITT(388,26121,"ui\techs\econmedia_manor\econmedia_manor");
ITT(389,26137,"ui\techs\mercantilism\mercantilism");
ITT(390,26139,"ui\techs\guard_spear_infantry\guard_spear_infantry");
ITT(391,26242,"ui\techs/native_hunting_grounds/nat_hunting_grounds");
ITT(392,26257,"ui\techs/native_potlatch/nat_potlatch");
ITT(393,26296,"ui\techs\veteran_sword_infantry\veteran_sword_infantry");
ITT(394,26299,"ui\techs\guard_sword_infantry\guard_sword_infantry");
ITT(395,26804,"ui\techs\guard_sword_infantry\guard_sword_infantry");
ITS(396,27221,"ui\techs\hc_royal_decree\hc_royal_decree");
ITT(397,27262,"ui\techs\carronade\carronade");
ITT(398,27245,"ui\techs\percussion_locks\percussion_locks");
ITT(399,27246,"ui\techs\armor_plating\armor_plating");
ITT(400,27247,"ui\techs\ship_howitzers\ship_howitzers");
ITT(401,27679,"ui\techs\guard_cavalry\guard_cavalry");
ITS(402,27836);
ITT(403,28058,"ui\techs\guard_spear_infantry\guard_spear_infantry");
ITT(404,28062,"ui\techs\guard_archer_infantry\guard_archer_infantry");
ITS(405,28195,"ui\techs\treaty\treaty");
ITT(406,28265,"ui\techs\revetment\revetment");
ITT(407,28321,"ui\techs\veteran_grenadier_artillery\veteran_grenadier_artillery");
ITT(408,28737,"ui\techs\tillys_dicipline\tillys_discipline");
ITT(409,28748,"ui\techs\amalgamation\amalgamation_64x64");
ITT(410,28750,"ui\techs\placer_mines\placer_mines_64x64");
ITT(411,29011,"ui\techs/native_calendar/nat_calendar");
ITT(412,29091,"ui\techs\waardgelders\waardgelders_icon_64x64");
ITT(413,29209,"ui\techs\guard_infantry\guard_infantry");
ITT(414,29230,"ui\techs/native_horse_trading/nat_horse_trading");
ITT(415,29450,"ui\techs\pillage\pillage");
ITT(416,29526,"ui\techs\cannery\cannery");
ITT(417,29528,"ui\techs\water_power\water_power");
ITT(418,29530,"ui\techs\steam_power\steam_power");
//ITT(419,29532,"ui\post_game\time_line_age_4");
ITS(420,29539,"ui\techs\hc_admirality\hc_admirality");
//ITT(421,29620,"ui\post_game\time_line_age_2");
ITT(426,29807,"ui\techs\veteran_infantry\veteran_infantry");
ITT(427,29812,"ui\techs\guard_infantry\guard_infantry");
ITT(428,29868,"ui\techs\frontier_outpost\frontier_outpost");
ITT(429,29869,"ui\techs\fortified_outpost\fortified_outpost");
ITT(435,30163,"ui\techs\garde_imperial\garde_imperial_2_icon_64x64");
ITT(436,30166,"ui\techs\garde_imperial\garde_imperial_3_icon_64x64");
ITT(444,30256,"ui\techs\fortified_outpost\fortified_outpost");
ITT(445,30260,"ui\techs\frontier_outpost\frontier_outpost");
ITT(446,30313,"ui\techs\spies\spies");
ITT(447,30332,"ui\techs/native_kasiri_beer/nat_kasiri_beer");
ITT(448,30447,"ui\techs\ore_refining\ore_refining");
ITT(449,30449,"ui\techs\steel_traps\steel_traps");
ITT(450,30453,"ui\techs\circular_saw\circular_saw");
ITT(451,30458,"ui\techs\hc_blockade\hc_blockade");
ITT(452,30929,"ui\techs\imperial_grenadier_artillery\imperial_grenadier_artillery");
ITT(453,30933,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(454,30937,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(455,30945,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(456,30949,"ui\techs\imperial_spear_infantry\imperial_spear_infantry");
ITT(457,30959,"ui\techs\imperial_infantry\imperial_infantry");
ITT(458,30962,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(459,30966,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(460,30980,"ui\techs\imperial_infantry\imperial_infantry");
ITT(461,30984,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(462,30989,"ui\techs\imperial_grenadier_artillery\imperial_grenadier_artillery");
ITT(463,30992,"ui\techs\imperial_spear_infantry\imperial_spear_infantry");
ITT(464,30996,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(465,31000,"ui\techs\imperial_infantry\imperial_infantry");
ITT(466,31004,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(467,31008,"ui\techs\imperial_infantry\imperial_infantry");
ITT(468,31016,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(469,31021,"ui\techs\imperial_infantry\imperial_infantry");
ITT(470,31025,"ui\techs\imperial_grenadier_artillery\imperial_grenadier_artillery");
ITT(471,31030,"ui\techs\imperial_infantry\imperial_infantry");
ITT(472,31034,"ui\techs\imperial_infantry\imperial_infantry");
ITT(473,31046,"ui\techs\imperial_infantry\imperial_infantry");
ITT(474,31050,"ui\techs\imperial_sword_infantry\imperial_sword_infantry");
ITT(475,31054,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(476,31058,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(477,31062,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(478,31066,"ui\techs\imperial_cavalry\imperial_cavalry");
ITT(479,31070,"ui\techs\imperial_artillery\imperial_artillery");
ITT(480,31074,"ui\techs\imperial_artillery\imperial_artillery");
ITT(481,31078,"ui\techs\imperial_artillery\imperial_artillery");
ITT(482,31082,"ui\techs\imperial_artillery\imperial_artillery");
ITT(483,31086,"ui\techs\imperial_artillery\imperial_artillery");
//ITT(484,31107,"ui\post_game\time_line_age_5");
ITT(485,31112,"ui\techs\imperial_navy\imperial_navy");
ITT(494,31122,"ui\techs\imperial_artillery\imperial_artillery");
ITT(495,31186,"ui\techs\imperial_navy\imperial_navy");
ITT(496,31191,"ui\techs\imperial_infantry\imperial_infantry");
ITT(497,31286,"ui\techs\rabauld\rabauld");
ITT(498,31472,"ui\techs/native_chocolate_recipes/nat_chocolate_recipes");
ITT(499,31474,"ui\techs/native_garland_wars/nat_garland_wars");
ITT(500,31478,"ui\techs/native_ceremonial_feast/nat_ceremonial_feast");
ITT(501,31485,"ui\techs/native_sequoyah_syllabary/nat_sequoyah_syllabary");
ITT(502,31487,"ui\techs/native_trade_language/nat_trade_language");
ITT(503,31498,"ui\techs/native_forest_burning/nat_forest_burning");
ITT(504,31523,"ui\techs\imperial_knighthood\imp_knighthood");
ITT(505,31528,"ui\techs\imperial_immigrants\imp_immigrants");
ITT(506,31530,"ui\techs\imperial_large_scale_agriculture\imp_large_scale_agriculture");
ITT(507,31534,"ui\techs\imperial_peerage\imp_peerage");
ITT(508,31542,"ui\techs\imperial_artillery\imperial_artillery");
ITT(509,31555,"ui\techs\imperial_legendary_natives\imp_legendary_natives");
ITS(510,31659);
ITS(511,31663);
ITS(512,31667);
ITT(513,31796,"ui\techs\champion_natives\champion_natives");
ITT(514,32066,"ui\techs\veteran_artillery\veteran_artillery");
ITT(515,32070,"ui\techs\imperial_artillery\imperial_artillery");
ITT(516,32310,"ui\techs\order_of_the_tower_and_the_sword\order_of_the_tower_and_the_sword_icon");
ITT(517,32343,"ui\techs\abbasid_common_market\abbasid_common_market_64x64");
ITT(518,32346,"ui\techs\topkapi\topkapi");
ITT(519,32362,"ui\techs\deforestation\deforestation");
ITT(520,32364,"ui\techs\imperial_excessive_taxation\imp_excessive_taxation");
ITS(521,32721,"ui\techs\hc_heavy_fortifications\hc_heavy_fortifications");
ITT(522,34150,"ui\ingame\icon_age_ii");
ITT(523,34146,"ui\ingame\icon_age_ii");
ITT(524,34147,"ui\ingame\icon_age_iii");
ITT(525,34157,"ui\ingame\icon_age_v");
ITT(526,34156,"ui\ingame\icon_age_v");
ITT(527,34158,"ui\ingame\icon_age_iv");
ITT(528,34162,"ui\ingame\icon_age_iv");
ITT(533,32913,"ui\techs\rogers_rangers\rogers_rangers");
ITT(534,32917,"ui\techs\black_watch\black_watch");
ITT(535,32926,"ui\techs\hackapell\hackapell_icon_64x64");
ITT(537,34148,"ui\ingame\icon_age_ii");
ITT(538,34160,"ui\ingame\icon_age_iii");
ITT(539,34155,"ui\ingame\icon_age_iv");
ITT(540,34161,"ui\ingame\icon_age_iii");
ITT(541,34154,"ui\ingame\icon_age_ii");
ITT(542,34153,"ui\ingame\icon_age_iii");
ITT(543,34152,"ui\ingame\icon_age_iv");
ITT(544,34159,"ui\ingame\icon_age_iv");
ITT(545,33152,"ui\techs/native_dog_soldier/nat_dog_soldier");
ITT(546,34164,"ui\ingame\icon_age_iv");
ITT(547,33292,"units\trade\stagecoach_icon_64x64");
ITT(548,33296,"units\trains\train_icon_64x64");
ITS(549,33315,"ui\techs\hc_advanced_trading_post\hc_advanced_trading_post");
ITT(550,33345,"ui\techs\warrior_society\warrior_society");
ITT(551,33350,"ui\techs\warrior_society\warrior_society");
ITT(552,33353,"ui\techs\warrior_society\warrior_society");
ITT(553,33356,"ui\techs\warrior_society\warrior_society");
ITT(554,33359,"ui\techs\warrior_society\warrior_society");
ITT(555,33362,"ui\techs\warrior_society\warrior_society");
ITT(556,33368,"ui\techs\warrior_society\warrior_society");
ITT(557,33372,"ui\techs\warrior_society\warrior_society");
ITT(558,33375,"ui\techs\warrior_society\warrior_society");
ITT(559,33378,"ui\techs\warrior_society\warrior_society");
ITT(560,33381,"ui\techs\warrior_society\warrior_society");
ITT(561,33384,"ui\techs\warrior_society\warrior_society");
ITS(562,33451,"ui\techs\hc_fatter_sheep\hc_fatter_sheep");
ITS(563,33487,"ui\techs\hc_armada\hc_armada");
ITS(564,33493,"ui\techs\hc_mosque_construction\hc_mosque_construction");
ITS(568,33759,"ui\techs\hc_dutch_east_india_company\hc_dutch_east_india_company");
ITS(570,33855,"ui\techs\hc_improved_buildings\hc_improved_buildings");
ITT(571,33950,"ui\techs/native_nootka_warchief/nat_nootka_warchief");
ITT(572,33960,"ui\techs/native_carib_ambush_party/nat_carib_ambush_party");
ITT(573,33977,"ui\techs/native_aztec_initiation/nat_aztec_initiation");
ITS(574,34000,"ui\techs\hc_native_warriors\hc_native_warriors");
ITS(575,34002,"ui\techs\hc_team_inquisition\hc_team_inquisition");
ITS(576,34003,"ui\techs\hc_explorer_spanish_conquistador\hc_explorer_spanish");
ITS(577,34012,"ui\techs\hc_team_hand_infantry_attack\hc_team_hand_infantry_damage");
ITS(578,34014,"ui\techs\elite_cavalry\elite_cavalry");
ITT(579,34183,"ui\ingame\icon_age_iii");
ITT(580,34194,"ui\ingame\icon_age_iii");
ITT(597,34405,"ui\ingame\icon_age_iii");
ITS(598,34526,"units\balloons\hot_air_balloon");
ITS(599,34546,"ui\techs\hc_iron_monger\hc_iron_monger");
ITT(600,34549,"ui\techs\high_crusade");
ITT(601,34552,"ui\techs\corsolet\corsolet");
ITT(602,34554,"ui\techs\tax_burden");
ITT(603,34563,"ui\techs/native\indian_friendship");
ITT(604,34567,"ui\techs\rifling\rifling");
ITT(605,34573,"ui\techs\imperial_artillery\imperial_artillery");
ITS(606,34690,"ui\techs\hc_advanced_arsenal\hc_advanced_arsenal");
ITS(609,34882,"ui\techs\hc_better_combat\hc_better_combat");
ITS(611,34999,"ui\techs\levy\levy");
ITS(612,35002,"ui\techs\hc_pioneers\hc_pioneers");
ITT(613,35108,"units\trains\track_icon_64x64");
ITS(614,35123,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(615,35129,"ui\techs\hc_hand_infantry_combat\hc_hand_infantry_combat");
ITS(616,35131,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(617,35132,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(618,35134);
ITS(619,35137,"ui\techs\hc_furrier\hc_furrier");
ITS(620,35139,"ui\techs\hc_grain_market\hc_grain_market");
ITS(621,35141,"ui\techs\hc_team_ironmonger\hc_team_iron_monger");
ITS(622,35143,"ui\techs\hc_medicine\hc_medicine");
ITS(623,35146,"ui\techs\hc_stone_masons\hc_stone_masons");
ITS(624,35148,"ui\techs\hc_fencing_school\hc_fencing_school");
ITS(625,35150,"ui\techs\hc_riding_school\hc_riding_school");
ITS(626,35154,"ui\techs\hc_refrigeration\hc_refrigeration");
ITS(627,35156,"ui\techs\hc_lumber_market\hc_lumber_market");
ITS(628,35158,"ui\techs\hc_silver_smith\hc_silver_smith");
ITS(629,35162,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITT(630,35179,"ui\techs\guard_sword_infantry\guard_sword_infantry");
ITT(631,35186,"ui\techs\imperial_spear_infantry\imperial_spear_infantry");
ITT(632,35192,"ui\techs\imperial_cavalry\imperial_cavalry");
ITS(633,35205,"ui\techs\hc_explorer_french_voyageur\hc_explorer_french");
ITS(634,35207,"ui\techs\hc_native_warrior_combat\hc_native_warrior_combat");
ITS(635,35225,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(636,35234,"ui\techs\hc_artillary_combat\hc_artillary_combat");
ITS(637,35236,"ui\techs\hc_northwest_passage\hc_northwest_passage");
ITS(638,35296,"ui\techs\hc_virginia_company\hc_virginia_company");
ITS(639,35299,"ui\techs\field_gun\shot_tower");
ITS(640,35307,"ui\techs\hc_yeoman\hc_yeoman");
ITS(641,35318,"ui\techs\hc_musketeer_grenadier_combat\hc_musketeer_grenadier_combat");
ITS(642,35320,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(643,35322,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(644,35324,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(645,35341,"ui\techs\hc_explorer_british_captain\hc_explorer_british");
ITS(646,35352,"ui\techs\hc_sawmills\hc_sawmills");
ITS(647,35354,"ui\techs\hc_exotic_hardwoods\hc_exotic_hardwoods");
ITS(648,35359,"ui\techs\hc_establish_royal_mint\hc_establish_royal_mint");
ITS(649,35361,"ui\techs\hc_silos\hc_silos");
ITS(650,35363,"ui\techs\hc_sustainable_agriculture\hc_sustainable_agriculture");
ITS(651,35365,"ui\techs\hc_advanced_mill\hc_advanced_mill");
ITS(652,35370,"ui\techs\hc_spice_trade\hc_spice_trade");
ITS(653,35374,"ui\techs\hc_rendering_plant\hc_rendering_plant");
ITS(654,35376,"ui\techs\hc_advanced_dock\hc_advanced_dock");
ITS(655,35380,"ui\techs\hc_rum_distillery\hc_rum_distillery");
ITS(656,35382,"ui\techs\hc_textile_mill\hc_textile_mill");
ITT(657,35385,"ui\techs\imperial_sword_infantry\imperial_sword_infantry");
ITS(658,35390,"ui\techs\hc_advanced_market\hc_advanced_market");
ITS(659,35394,"ui\techs\hc_explorer_portuguese_navigator\hc_explorer_portuguese");
ITT(660,35466,"ui\ingame\icon_age_iii");
ITT(662,35470,"ui\ingame\icon_age_iii");
ITT(663,35472,"ui\ingame\icon_age_iv");
ITT(664,35474,"ui\ingame\icon_age_iv");
ITT(665,35476,"ui\ingame\icon_age_iii");
ITT(666,35480,"ui\ingame\icon_age_iv");
ITT(667,35482,"ui\ingame\icon_age_iv");
ITT(668,35486,"ui\ingame\icon_age_iii");
ITT(669,35489,"ui\ingame\icon_age_iii");
ITT(670,35495,"ui\ingame\icon_age_iv");
ITT(671,35497,"ui\ingame\icon_age_iv");
ITT(672,35501,"ui\ingame\icon_age_iv");
ITT(673,35503,"ui\ingame\icon_age_iii");
ITT(674,35507,"ui\ingame\icon_age_ii");
ITT(675,35509,"ui\ingame\icon_age_iv");
ITT(676,35511,"ui\ingame\icon_age_iv");
ITS(677,35517,"ui\techs\hc_explorer_german_burghermeister\hc_explorer_german");
ITS(678,35523,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(679,35574,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(680,35580,"ui\techs\hc_explorer_russian_polar_explorer\hc_explorer_russian");
ITS(681,35582,"ui\techs\hc_boyars\hc_boyars");
ITS(682,35588,"ui\techs\hc_hand_infantry_hitpoints\hc_hand_infantry_hitpoints");
ITS(683,35616,"ui\techs\field_gun\shot_tower");
ITT(684,35637,"ui\ingame\icon_age_iii");
ITT(685,35639,"ui\ingame\icon_age_iv");
ITT(686,35641,"ui\ingame\icon_age_iv");
ITT(687,35651,"ui\ingame\icon_age_iv");
ITS(688,35652);
ITS(689,35655);
ITS(690,35657);
ITS(691,35658);
ITS(692,35659);
ITS(693,35660);
ITS(694,35661);
ITS(695,35662);
ITS(696,35663);
ITT(697,35678,"ui\ingame\icon_age_iv");
ITT(698,35680,"ui\ingame\icon_age_iv");
ITT(699,35684,"ui\ingame\icon_age_iii");
ITT(700,35686,"ui\ingame\icon_age_iv");
ITT(701,35694,"ui\ingame\icon_age_v");
ITT(702,35700,"ui\ingame\icon_age_v");
ITT(703,35703,"ui\ingame\icon_age_iv");
ITT(704,35707,"ui\ingame\icon_age_iii");
ITS(705,35708);
ITS(706,35709);
ITS(707,35710);
ITS(708,35711);
ITS(709,35712);
ITS(710,35713);
ITS(711,35714);
ITS(712,35715);
ITS(713,35716);
ITS(714,35717);
ITS(715,35718);
ITS(716,35719);
ITS(717,35720);
ITS(718,35721);
ITS(719,35722);
ITS(720,35723);
ITS(721,35724);
ITS(722,35725);
ITS(723,35726);
ITS(724,35728,"ui\techs\carronade\carronade");
ITS(725,35731);
ITS(726,35732);
ITS(727,35733);
ITS(728,35734);
ITS(729,35735);
ITS(730,35736);
ITS(731,35737);
ITS(732,35738);
ITS(733,35739);
ITS(734,35740);
ITS(735,35741);
ITS(736,35742);
ITS(737,35743);
ITS(738,35744);
ITS(739,35753,"ui\techs\hc_team_cheap_barracks\hc_team_cheap_barracks");
ITS(740,36368);
ITS(741,35762);
ITS(742,35763);
ITS(743,35765,"ui\techs\hc_ranged_infantry_hitpoints\hc_ranged_infantry_hitpoints");
ITS(744,35767,"ui\techs\hc_team_ranged_infantry_attack\hc_team_ranged_infantry_damage");
ITS(745,35768);
ITS(746,35769);
ITS(747,35770);
ITS(748,35771);
ITS(749,35772);
ITS(750,35773);
ITS(751,35780);
ITS(752,35781);
ITS(753,35783,"ui\techs\hc_team_cavalry_damage\hc_team_cavalry_damage");
ITS(754,35785,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(755,35786);
ITS(756,35787);
ITS(757,35789,"ui\techs\hc_team_native_warrior_combat\hc_team_native_warrior_combat");
ITS(758,35790);
ITS(759,35791);
ITS(760,35792);
ITS(761,35793);
ITS(762,35824);
ITS(763,35825);
ITS(764,35827,"ui\techs\hc_team_cheap_stables\hc_team_cheap_stables");
ITS(765,35829,"ui\techs\hc_hand_infantry_damage\hc_hand_infantry_damage");
ITS(766,35831,"ui\techs\hc_hand_infantry_hitpoints\hc_hand_infantry_hitpoints");
ITS(767,35833,"ui\techs\hc_hand_infantry_combat\hc_hand_infantry_combat");
ITS(768,35834);
ITS(769,35835);
ITS(770,35836);
ITS(771,35837);
ITS(772,35838);
ITS(773,35839);
ITS(774,35840);
ITS(775,35842,"ui\techs\hc_team_cavalry_damage\hc_team_cavalry_damage");
ITS(776,35844,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(777,35845);
ITS(778,35846);
ITS(779,35847);
ITS(780,35849,"ui\techs\hc_team_food_silos\hc_team_food_silos");
ITS(781,35851,"ui\techs\hc_team_furrier\hc_team_furrier");
ITS(782,35852);
ITS(783,35853);
ITS(784,35854);
ITS(785,35855);
ITS(786,35857,"ui\techs\hc_strelet_combat\hc_strelet_combat");
ITS(787,35858);
ITS(788,35859);
ITS(789,35860);
ITS(790,35861);
ITS(791,35862);
ITS(792,35863);
ITS(793,35864);
ITS(794,35865);
ITS(795,35866);
ITS(796,35867);
ITS(797,35868);
ITS(798,35869);
ITS(799,35870);
ITS(800,35871);
ITS(801,35873,"ui\techs\hc_team_cavalry_line_of_sight\hc_team_cavalry_line_of_sight");
ITS(802,35875,"ui\techs\hc_team_barracks_hitpoints\hc_team_barracks_hitpoints");
ITS(803,35899);
ITS(804,35911);
ITS(805,35912);
ITS(806,35913);
ITS(807,35915);
ITS(808,35916);
ITS(809,35918,"ui\techs\hc_musketeer_grenadier_damage\hc_musketeer_grenadier_damage");
ITS(810,35920,"ui\techs\hc_team_musketeer_grenadier_hitpoints\hc_team_musketeer_grenadier_hitpoints");
ITS(811,35922);
ITS(812,35923);
ITS(813,35924);
ITS(814,35925);
ITS(815,35927,"ui\techs\hc_team_fast_houses\hc_team_fast_houses");
ITS(816,35931,"ui\techs\hc_team_sawmills\hc_team_sawmills");
ITS(817,35934,"ui\techs\hc_naval_gunners\hc_naval_gunners");
ITS(818,36010,"ui\techs\hc_team_silk_road\hc_team_silk_road");
ITS(819,36015,"ui\techs\hc_explorer_ottoman_agha\hc_ottoman_explorer");
ITS(820,36016);
ITS(821,36017);
ITS(822,36018);
ITS(823,36019);
ITS(824,36025,"ui\techs\hc_gunpowder_infantry_combat\hc_gunpowder_infantry_combat");
ITS(825,36027,"ui\techs\hc_team_cavalry_hitpoints\hc_team_cavalry_hitpoints");
ITS(826,36028);
ITS(827,36029);
ITS(828,36030);
ITS(829,36031);
ITS(830,36032);
ITS(831,36034,"ui\techs\hc_artillary_hitpoints\hc_artillary_hitpoints");
ITS(832,36036,"ui\techs\hc_team_artillery_hitpoints\hc_team_artillery_hitpoints");
ITS(833,36039,"ui\techs\hc_artillary_damage\hc_artillary_damage");
ITS(834,36043);
ITS(835,36044);
ITS(836,36046,"ui\techs\hc_team_cheap_trading_posts\hc_team_cheap_trading_post");
ITS(837,36049);
ITS(838,36050);
ITS(839,36054,"ui\techs\hc_engineering_school\hc_engineering_school");
ITS(840,36056);
ITS(841,36062,"ui\techs\hc_team_fish_market\hc_team_fish_market");
ITS(844,36071);
ITS(845,36072);
ITS(846,36073);
ITS(847,36074);
ITS(848,36076,"ui\techs\hc_team_ranged_infantry_hitpoints\hc_team_ranged_infantry_hitpoints");
ITS(849,36078,"ui\techs\hc_gunpowder_infantry_damage\hc_gunpowder_infantry_damage");
ITS(850,36080,"ui\techs\hc_gunpowder_infantry_combat\hc_gunpowder_infantry_combat");
ITS(851,36081);
ITS(852,36082);
ITS(853,36084,"ui\techs\hc_dragoon_combat\hc_dragoon_combat");
ITS(854,36086,"ui\techs\field_gun\shot_tower");
ITS(855,36088,"ui\techs\hc_team_artillery_hitpoints\hc_team_artillery_hitpoints");
ITS(856,36091,"ui\techs\hc_navigation_school\hc_navigation_school");
ITS(857,36093,"ui\techs\hc_team_improved_walls\hc_team_improved_walls");
ITS(858,36096);
ITS(859,36097);
ITS(860,36098);
ITS(861,36100,"ui\techs\hc_team_cheap_outposts\hc_team_cheap_outpost");
ITS(863,36105);
ITT(864,36207,"ui\techs\mass_cavalry\mass_cavalry");
ITS(865,36261,"ui\techs\hc_explorer_dutch_stadhouder\hc_explorer_dutch");
ITS(866,36262);
ITS(867,36263);
ITS(868,36269,"ui\techs\hc_infantry_damage\hc_infantry_damage");
ITS(869,36271,"ui\techs\hc_team_infantry_hitpoints\hc_team_infantry_hitpoints");
ITS(870,36275,"ui\techs\hc_infantry_combat\hc_infantry_combat");
ITS(871,36276);
ITS(872,36277);
ITS(873,36278);
ITS(874,36279);
ITS(875,36281,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(876,36285,"ui\techs\hc_team_coehorn_mortars\hc_team_coehorn_mortars");
ITS(877,36288,"ui\techs\hc_bank_of_amsterdam\hc_bank_of_amsterdam");
ITS(878,36291,"ui\techs\hc_bank_of_rotterdam\hc_bank_of_rotterdam");
ITS(879,36294,"ui\techs\hc_team_spice_trade\hc_team_spice_trade");
ITS(880,36297);
ITS(881,36298);
ITS(882,36300,"ui\techs\hc_team_cheap_markets\hc_team_cheap_market");
ITS(883,36335,"ui\techs\hc_team_early_dragoons\hc_team_early_dragoons");
ITS(884,36339,"ui\techs\hc_team_cheap_docks\hc_team_cheap_docks");
ITS(885,36343,"ui\techs\hc_team_cheap_priests\hc_team_cheap_priests");
ITS(886,36347,"ui\techs\hc_team_dueling_school\hc_team_dueling_school");
ITS(887,36351,"ui\techs\hc_team_cold_water_port\hc_team_cold_water_port");
ITS(888,36355,"ui\techs\hc_team_early_skirmishers\hc_team_early_skirmishers");
ITS(889,36360,"ui\techs\hc_team_cheap_church\hc_team_cheap_church");
ITS(890,36363,"ui\techs\hc_team_rum_distillery\hc_team_rum_distillery");
ITS(891,36365);
ITS(892,36375);
ITS(893,36378,"ui\techs\hc_team_teutonic_town_center\hc_team_teutonic_town_center");
ITS(894,36383);
ITS(895,36402);
ITS(896,36403);
ITS(897,36404);
ITS(898,36406);
ITS(899,36407);
ITS(900,36410);
ITS(901,36411);
ITS(902,36413);
ITS(903,36414);
ITS(904,36415);
ITS(905,36416);
ITS(906,36417);
ITS(907,36418);
ITS(908,36422);
ITS(909,36423);
ITS(910,36432);
ITS(911,36433);
ITS(912,36434);
ITS(913,36440);
ITS(914,36441);
ITS(915,36442);
ITS(916,36443);
ITS(917,36446);
ITS(918,36447);
ITS(919,36449,"ui\techs\hc_native_diplomacy1\hc_native_diplomacy1");
ITS(920,36452,"ui\techs\treaty\treaty");
ITS(921,36454,"ui\techs\hc_native_warriors\hc_native_warriors");
ITS(922,36462,"ui\techs\hc_improved_buildings\hc_improved_buildings");
ITS(923,36466,"ui\techs\hc_advanced_arsenal\hc_advanced_arsenal");
ITS(924,36468);
ITS(925,36470,"ui\techs\hc_fencing_school\hc_fencing_school");
ITS(926,36472,"ui\techs\hc_riding_school\hc_riding_school");
ITS(927,36474,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(928,36476,"ui\techs\hc_advanced_mill\hc_advanced_mill");
ITS(929,36479,"ui\techs\hc_advanced_market\hc_advanced_market");
ITS(930,36482,"ui\techs\hc_advanced_plantation\hc_advanced_plantation");
ITS(931,36485,"ui\techs\hc_advanced_dock\hc_advanced_dock");
ITS(932,36488);
ITS(933,36494,"units\spc\john_black\john_black_icon_64x64");
ITS(934,36498,"ui\techs\royal_guard_infantry\royal_guard_infantry");
ITS(935,36501,"units\spc\amelia_black\amelia_black_icon_64x64");
ITS(936,36503,"ui\techs\hc_fish_market\hc_fish_market");
ITS(937,36505,"ui\techs\hc_rendering_plant\hc_rendering_plant");
ITS(938,36507,"ui\techs\hc_sawmills\hc_sawmills");
ITS(939,36509,"ui\techs\hc_exotic_hardwoods\hc_exotic_hardwoods");
ITS(940,36511,"ui\techs\hc_team_explorer_combat\hc_team_explorer_combat");
ITS(941,36514,"ui\techs\hc_team_archaic_soldier_training\hc_team_archaic_soldier_training");
ITS(942,36534,"ui\techs\hc_silver_smith\hc_silver_smith");
ITS(943,36536,"ui\techs\hc_establish_royal_mint\hc_establish_royal_mint");
ITS(944,36538,"ui\techs\hc_sustainable_agriculture\hc_sustainable_agriculture");
ITS(945,36540,"ui\techs\hc_refrigeration\hc_refrigeration");
ITS(946,36542,"ui\techs\hc_furrier\hc_furrier");
ITS(947,36544,"ui\techs\hc_spice_trade\hc_spice_trade");
ITS(948,36547,"ui\techs\hc_medicine\hc_medicine");
ITS(949,36549,"ui\techs\hc_rum_distillery\hc_rum_distillery");
ITS(950,36551,"ui\techs\hc_cigar_roller\hc_cigar_roller");
ITS(951,36553,"ui\techs\hc_textile_mill\hc_textile_mill");
ITS(952,36555,"ui\techs\hc_stone_masons\hc_stone_masons");
ITS(953,36567);
ITS(954,36568);
ITS(955,36569);
ITS(956,36570);
ITS(957,36572,"ui\techs\carronade\carronade");
ITS(958,36573);
ITS(959,36575,"ui\techs\hc_admirality\hc_admirality");
ITS(960,36578,"ui\techs\hc_mercenary_loyalty\hc_mercenary_loyalty");
ITS(961,36582);
ITS(962,36585,"ui\techs\hc_team_native_warrior_societies\hc_team_warrior_societies");
ITS(964,36609,"ui\techs\hc_guild_artisans\hc_guild_artisans");
ITT(965,36619,"ui\techs\levy\levy");
ITS(969,36702);
ITS(970,36705);
ITS(971,36708);
ITS(972,36711);
ITS(973,36713);
ITS(974,36715);
ITS(975,36717);
ITS(976,36719);
ITS(977,36721);
ITS(978,36723);
ITS(979,36727);
ITS(980,36729);
ITT(981,36749,"ui\techs\guard_artillery\guard_artillery");
ITS(982,36823);
ITS(983,36824);
ITS(984,36846);
ITS(985,36847);
ITS(986,36848);
ITS(987,36849);
ITS(988,36855,"ui\techs\hc_native_diplomacy1\hc_native_diplomacy1");
ITS(989,36880);
ITS(990,36881);
ITS(991,36906);
ITS(992,36908);
ITS(993,36910);
ITS(994,36912);
ITS(995,36917);
ITS(996,36921);
ITS(997,36925,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(998,36927);
ITS(999,36928);
ITS(1000,36934,"ui\techs\hc_ranged_infantry_hitpoints\hc_ranged_infantry_hitpoints");
ITT(1001,37011,"ui\techs\imperial_artillery\imperial_artillery");
ITT(1002,37020,"ui\ingame\icon_age_v");
ITT(1003,37022,"ui\techs/native_tanning/nat_tanning");
ITT(1004,37024,"ui\techs/native_lacrosse/nat_lacrosse");
ITT(1005,37183,"ui\techs\mass_production\mass_production");
ITS(1006,37267,"ui\techs\strelet_horde\strelet_horde_icon_64x64");
ITS(1007,37269,"ui\techs\unicorne_mortars\unicorne_mortars");
ITS(1008,37270);
ITS(1009,37272,"ui\techs\hc_ransack\hc_ransack");
ITS(1010,37274);
ITS(1011,37275);
ITS(1012,37279,"ui\techs\hc_wilderness_warfare\hc_wilderness_warfare");
ITS(1013,37281,"ui\techs\hc_spanish_galleons\hc_spanish_galleons");
ITS(1014,37282);
ITS(1015,37413);
ITS(1016,37289);
ITS(1017,37290);
ITS(1018,37292);
ITS(1019,37295);
ITS(1020,37296);
ITS(1021,37298,"ui\techs\hc_acemi_olglan_school\hc_acemi_olglan_school");
ITS(1022,37301);
ITS(1023,37306,"ui\techs\hc_schooners\hc_schooners");
ITS(1024,37308,"ui\techs\hc_stockyards\hc_stockyards");
ITS(1025,37310);
ITS(1026,37312);
ITS(1027,37314,"ui\techs\hc_tulip_speculation\hc_tulip_speculation");
ITS(1028,37320,"ui\techs\hc_team_monitor_combat\hc_team_monitor_combat");
ITS(1029,37323,"spec\techs\TK_1029");
ITS(1030,37325,"ui\techs\hc_fulling_mills\hc_fulling_mills");
ITS(1031,37329,"ui\techs\hc_estates\hc_estates");
ITS(1032,37335);
ITS(1033,37337);
ITS(1034,37339);
ITS(1035,37340);
ITS(1036,37342);
ITS(1037,37347);
ITS(1038,37355,"ui\techs\hc_team_coastal_defenses\hc_team_coastal_defenses");
ITS(1039,37361,"ui\techs\hc_caballeros\hc_caballeros");
ITS(1040,37363,"ui\techs\hc_colonial_estancias\hc_colonial_estancias");
ITS(1043,37408);
ITS(1044,37411);
ITS(1045,37418);
ITS(1046,37420,"ui\techs\hc_portuguese_white_fleet\hc_portuguese_white_fleet");
ITS(1047,37422);
ITS(1048,37439);
ITS(1049,37440);
ITS(1050,37441);
ITS(1051,37442);
ITS(1052,37446);
ITS(1053,37447);
ITS(1054,37450);
ITS(1055,37452,"ui\techs\hc_block_house_cannon\hc_block_house_cannon");
ITS(1057,37519,"ui\techs\hc_spanish_riding_school\hc_spanish_riding_school");
ITS(1058,37520);
ITS(1059,37523,"ui\techs\hc_hand_cavalry_combat\hc_hand_cavalry_combat");
ITS(1060,37527);
ITS(1061,37529,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1062,37544,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1063,37546,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1064,37548,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1065,37550,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1066,37552,"ui\techs\hc_royal_decree\hc_royal_decree");
ITS(1067,38282,"ui\techs\field_gun\shot_tower");
ITS(1068,38290,"buildings\house\house_icon");
ITT(1069,38297,"ui\techs\caracole\caracole");
ITS(1070,41554);
ITS(1071,41556,"buildings\mill\mill_icon");
ITS(1072,41664);
ITS(1073,41675);
ITT(1076,41943,"ui\ingame\icon_age_ii");
ITT(1077,41958,"ui\techs\koprulu_viziers\koprulu_viziers_icon_64x64");
ITT(1078,41960,"ui\techs\galata_tower_district\galata_tower_district_icon_64x64");
ITT(1079,41962,"ui\techs\tanzimat\tanzimat_icon_64x64");
ITS(1081,42158);
ITS(1082,42159);
ITS(1083,42197);
ITS(1084,42198);
ITS(1085,42200);
ITS(1086,42201);
ITS(1087,42203);
ITS(1088,42206);
ITS(1089,42208);
ITS(1090,42210);
ITS(1091,42212);
ITS(1092,42214);
ITS(1093,42216);
ITS(1094,42218);
ITT(1098,42331,"ui\ingame\icon_age_iv");
ITT(1099,42333,"ui\ingame\icon_age_iv");
ITS(1100,42371);
ITS(1101,42396);
ITS(1102,42880,"ui\techs\hc_battlefield_construction\hc_battlefield_construction");
ITT(1107,43512,"ui\techs/native\elite_ranged_infantry");
ITT(1108,43516,"ui\techs/native\elite_ranged_infantry");
ITT(1109,43520,"ui\techs/native\champion_siege");
ITT(1110,43524,"ui\techs/native\champion_siege");
ITT(1111,43528,"ui\techs/native\elite_cavalry");
ITT(1112,43532,"ui\techs/native\champion_cavalry");
ITT(1113,43536,"ui\techs/native\champion_ranged_infantry");
ITT(1114,43540,"ui\techs/native\champion_ranged_infantry");
ITT(1115,43544,"ui\techs/native\champion_cavalry");
ITT(1116,43548,"ui\techs/native\champion_ranged_infantry");
ITT(1117,43562,"ui\techs\field_gun\field_gun_64x64");
ITT(1118,43566,"ui\techs/native\legendary_siege");
ITT(1119,43570,"ui\techs/native\legendary_ranged_infantry");
ITT(1120,43574,"ui\techs/native\legendary_cavalry");
ITT(1121,43577,"ui\techs/native\legendary_siege");
ITT(1122,43580,"ui\techs/native\legendary_siege");
ITT(1123,43583,"ui\techs/native\legendary_cavalry");
ITT(1124,43586,"ui\techs/native\legendary_ranged_infantry");
ITT(1125,43589,"ui\techs/native\legendary_ranged_infantry");
ITT(1126,43606,"ui\techs/native\mighty_warhut");
ITT(1127,43609,"ui\techs/native\strong_warhut");
ITT(1144,43705,"ui\ingame\icon_age_ii");
ITT(1145,43707,"ui\ingame\icon_age_iii");
ITT(1146,43709,"ui\ingame\icon_age_iv");
ITT(1147,43711,"ui\ingame\icon_age_v");
ITT(1148,43713,"ui\ingame\icon_age_ii");
ITT(1149,43715,"ui\ingame\icon_age_iii");
ITT(1150,43717,"ui\ingame\icon_age_iv");
ITT(1151,43719,"ui\ingame\icon_age_v");
ITT(1152,43721,"ui\ingame\icon_age_ii");
ITT(1153,43723,"ui\ingame\icon_age_iii");
ITT(1154,43725,"ui\ingame\icon_age_iv");
ITT(1155,43727,"ui\ingame\icon_age_v");
ITT(1156,43729,"ui\ingame\icon_age_ii");
ITT(1157,43731,"ui\ingame\icon_age_iii");
ITT(1158,43733,"ui\ingame\icon_age_iv");
ITT(1159,43735,"ui\ingame\icon_age_v");
ITT(1160,43737,"ui\ingame\icon_age_ii");
ITT(1161,43739,"ui\ingame\icon_age_iii");
ITT(1162,43741,"ui\ingame\icon_age_iv");
ITT(1163,43743,"ui\ingame\icon_age_v");
ITS(1164,43744);
ITS(1165,43745);
ITS(1166,43746);
ITS(1167,43747);
ITS(1168,43749);
ITS(1169,43751);
ITS(1170,43753);
ITS(1171,43758);
ITS(1172,43759);
ITS(1173,43760);
ITS(1174,43761);
ITS(1175,43762);
ITS(1176,43763);
ITS(1177,43764);
ITS(1178,43765);
ITS(1179,43766);
ITS(1180,43767);
ITS(1181,43768);
ITS(1182,43769);
ITS(1183,43770);
ITS(1184,43771);
ITS(1185,43772);
ITS(1186,43774,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(1187,43780,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(1188,43783,"ui\techs\hc_infantry_combat\hc_infantry_combat");
ITS(1189,43786,"ui\techs\hc_infantry_damage\hc_infantry_damage");
ITS(1190,43789,"ui\techs\hc_infantry_hitpoints\hc_infantry_hitpoints");
ITS(1191,43791);
ITS(1192,43792);
ITS(1193,43794,"ui\techs/native\advanced_farm");
ITS(1194,43804);
ITS(1195,43806);
ITS(1196,43808);
ITS(1197,43810);
ITS(1198,43812);
ITS(1199,43814);
ITS(1200,43823);
ITS(1201,43825);
ITS(1202,43826);
ITT(1203,43866,"ui\techs/native\legendary_ranged_infantry");
ITT(1204,43936,"ui\techs/native\elite_ranged_infantry");
ITT(1205,43940,"ui\techs/native\elite_infantry");
ITT(1206,43944,"ui\techs/native\champion_ranged_infantry");
ITT(1207,43948,"ui\techs/native\champion_infantry");
ITT(1208,43960,"ui\techs/native\champion_cavalry");
ITS(1209,43967);
ITS(1210,43968);
ITT(1211,43979,"ui\techs/native\elite_ranged_infantry");
ITT(1212,43982,"ui\techs/native\elite_infantry");
ITT(1213,43985,"ui\techs/native\champion_ranged_infantry");
ITT(1214,43988,"ui\techs/native\champion_infantry");
ITS(1215,44009);
ITS(1216,44025,"ui\techs/native\great_house");
ITS(1217,44031,"ui\techs\hc_battlefield_construction\hc_battlefield_construction");
ITS(1218,44035,"ui\techs/native\warrior_culture");
ITS(1219,44038,"ui\techs/native\War_Houses");
ITS(1220,44042,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(1221,44049);
ITS(1222,44050);
ITS(1223,44051);
ITS(1224,44053,"ui\techs\team_birchbark");
ITS(1225,44057);
ITS(1226,44058);
ITS(1227,44059);
ITS(1228,44060);
ITS(1229,44061);
ITS(1230,44062);
ITS(1235,44074);
ITS(1236,44076,"ui\techs/native\High_Chief");
ITS(1237,44080,"ui\techs/native\High_Priest_Ixil");
ITS(1238,44083,"ui\techs/native\Smoke_Signals");
ITS(1239,44086,"ui\techs/native\Town_Destroyer");
ITS(1240,44092);
ITS(1241,44093);
ITS(1242,44094);
ITS(1243,44095);
ITS(1244,44096);
ITS(1245,44097);
ITS(1246,44098);
ITS(1247,44099);
ITS(1248,44100);
ITS(1249,44101);
ITS(1250,44102);
ITS(1251,44104,"ui\techs\team_scout_infantry");
ITS(1252,44107);
ITS(1253,44108);
ITS(1254,44109);
ITS(1255,44112,"ui\techs\hc_artillary_hitpoints\hc_artillary_hitpoints");
ITS(1256,44114,"ui\techs\hc_artillary_damage\hc_artillary_damage");
ITT(1257,44128,"ui\techs/native\champion_ranged_infantry");
ITT(1258,44167,"ui\techs/native\champion_infantry");
ITT(1259,44171,"ui\techs/native\champion_ranged_infantry");
ITT(1260,44174,"ui\techs/native\champion_ranged_infantry");
ITT(1261,44177,"ui\techs/native\champion_infantry");
ITT(1262,44183,"ui\techs/native\elite_infantry");
ITT(1263,44199,"ui\techs/native\legendary_infantry");
ITT(1264,44202,"ui\techs/native\legendary_infantry");
ITT(1265,44206,"ui\techs/native\legendary_ranged_infantry");
ITT(1266,44209,"ui\techs/native\legendary_ranged_infantry");
ITT(1267,44212,"ui\techs/native\legendary_ranged_infantry");
ITT(1268,44215,"ui\techs/native\legendary_infantry");
ITS(1269,44223);
ITS(1270,44224);
ITS(1271,44225);
ITS(1272,44226);
ITS(1273,44227);
ITS(1274,44228);
ITS(1275,44229);
ITS(1276,44231,"ui\techs/native\coyote_combat");
ITS(1277,44234);
ITS(1278,44235);
ITS(1279,44236);
ITS(1280,44237);
ITS(1281,44238);
ITS(1282,44239);
ITS(1283,44240);
ITS(1284,44242,"ui\techs/native\War_Hut_Training");
ITS(1285,44244);
ITS(1286,44245);
ITS(1287,44246);
ITS(1288,44247);
ITS(1289,44248);
ITS(1290,44249);
ITS(1291,44250);
ITS(1292,44251);
ITS(1293,44252);
ITS(1294,44253);
ITS(1295,44255,"ui\techs/native\Scorched_Earth");
ITS(1296,44259,"ui\techs\hc_infantry_damage\hc_infantry_damage");
ITS(1297,44263,"ui\techs\hc_infantry_hitpoints\hc_infantry_hitpoints");
ITS(1298,44267,"ui\techs\hc_infantry_combat\hc_infantry_combat");
ITS(1299,44270);
ITS(1300,44271);
ITS(1301,44272);
ITS(1302,44273);
ITS(1303,44275,"ui\techs/native\Aztec_Fortification");
ITT(1304,44278,"ui\techs/native\strong_warhut");
ITT(1305,44283,"ui\techs/native\mighty_warhut");
ITS(1306,44287,"ui\techs/native\Artificial_Islands");
ITS(1307,44291,"ui\techs\team_schooners");
ITS(1308,44298);
ITS(1309,44299);
ITS(1310,44301,"ui\techs/native\cheap_war_hut");
ITT(1311,44305,"ui\techs\warrior_society\warrior_society");
ITT(1312,44309,"ui\techs\warrior_society\warrior_society");
ITT(1313,44313,"ui\techs\champion_natives\champion_natives");
ITT(1314,44317,"ui\techs\champion_natives\champion_natives");
ITS(1315,44320);
ITS(1316,44321);
ITS(1317,44322);
ITS(1318,44323);
ITS(1319,44324);
ITS(1320,44325);
ITS(1321,44326);
ITS(1322,44329);
ITS(1323,44331);
ITS(1324,44333);
ITS(1325,44335);
ITS(1326,44337);
ITS(1327,44339);
ITS(1328,44341);
ITS(1329,44343);
ITS(1330,44345);
ITS(1331,44347,"ui\techs/native\Wood_Crafting");
ITS(1332,44350,"ui\techs\team_silver_smith");
ITS(1333,44355,"ui\techs/native\Aztec_Mining");
ITS(1334,44360,"ui\techs/native_chinampa/nat_chinampa");
ITS(1335,44364,"ui\techs/native\great_chinampa");
ITS(1336,44375,"ui\techs\team_exotic_hardwoods");
ITT(1337,44379,"ui\techs\warrior_society\warrior_society");
ITT(1338,44383,"ui\techs\warrior_society\warrior_society");
ITT(1339,44387,"ui\techs\warrior_society\warrior_society");
ITT(1340,44391,"ui\techs\warrior_society\warrior_society");
ITT(1341,44395,"ui\techs\champion_natives\champion_natives");
ITT(1342,44399,"ui\techs\champion_natives\champion_natives");
ITT(1343,44403,"ui\techs\champion_natives\champion_natives");
ITT(1344,44407,"ui\techs\champion_natives\champion_natives");
ITS(1345,44437,"ui\techs/native\Counting_Coup");
ITS(1346,44439);
ITS(1347,44441);
ITS(1348,44443);
ITS(1349,44445);
ITS(1350,44447);
ITS(1351,44449,"ui\techs/native\Great_Hunt");
ITS(1352,44452,"ui\techs/native\Adoption");
ITS(1353,44455);
ITS(1354,44456);
ITS(1355,44457);
ITS(1356,44458);
ITS(1357,44459);
ITS(1358,44460);
ITS(1359,44461);
ITS(1360,44462);
ITS(1361,44463);
ITS(1362,44464);
ITS(1363,44465);
ITS(1364,44466);
ITS(1365,44467);
ITS(1366,44472,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(1367,44475,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(1368,44478,"ui\techs\hc_cavalry_combat\hc_cavalry_combat");
ITS(1369,44481);
ITS(1370,44482);
ITS(1371,44483);
ITS(1372,44484);
ITS(1373,44485);
ITS(1374,44486);
ITS(1375,44487);
ITS(1376,44488);
ITS(1377,44489);
ITS(1378,44490);
ITS(1379,44495,"ui\techs/native\Onikare");
ITT(1380,44598,"ui\techs/native\great_feast");
ITT(1381,44600,"ui\techs/native\harvest_ceremony");
ITT(1382,44602,"ui\techs/native\green_corn_ceremony");
ITT(1383,44604,"ui\techs/native\spirit_medicine");
ITT(1384,44606,"ui\techs/native\forest_spirit");
ITT(1385,44608,"ui\techs/native\forest_people");
ITT(1386,44610,"ui\techs/native\lumber_ceremony");
ITT(1387,44612,"ui\techs/native\earth_ceremony");
ITT(1388,44614,"ui\techs/native\earth_gift");
ITS(1389,44626,"ui\techs/native\Wood_Crafting");
ITS(1390,44630);
ITS(1391,44634);
ITS(1392,44638,"ui\techs/native\Center_of_Power");
ITS(1393,44640);
ITS(1394,44641);
ITS(1395,44642);
ITS(1396,44643);
ITS(1397,44644);
ITS(1398,44645);
ITS(1399,44648,"ui\techs/native\Black_Arrow");
ITS(1400,44663,"spec\techs\TK_1400");
ITS(1401,44664,"spec\techs\TK_1401");
ITS(1402,44665,"spec\techs\TK_1402");
ITS(1403,44666,"spec\techs\TK_1403");
ITS(1404,44667,"spec\techs\TK_1404");
ITS(1405,44668,"spec\techs\TK_1405");
ITS(1406,44669,"spec\techs\TK_1406");
ITS(1407,44670,"spec\techs\TK_1407");
ITS(1408,44672,"spec\techs\TK_1408");
ITS(1409,44676);
ITS(1410,44680);
ITS(1411,44684);
ITS(1412,44688);
ITS(1413,44693);
ITS(1414,44697);
ITS(1415,44701);
ITS(1416,44704);
ITS(1417,44709);
ITS(1418,44713);
ITS(1419,44714);
ITS(1420,44715);
ITS(1421,44717,"ui\techs/native\Smoking_Mirror");
ITS(1422,44719);
ITS(1423,44720);
ITT(1424,44724,"ui\techs/native\excessive_tribute");
ITT(1425,44726,"ui\techs/native\large_scale_gathering");
ITT(1426,44820,"ui\techs\veteran_infantry\veteran_infantry");
ITT(1427,44824,"ui\techs\guard_infantry\guard_infantry");
ITT(1428,45083,"ui\ingame\icon_age_ii");
ITT(1429,45085,"ui\ingame\icon_age_iii");
ITT(1430,45087,"ui\ingame\icon_age_iv");
ITT(1431,45089,"ui\ingame\icon_age_v");
ITT(1432,45091,"ui\ingame\icon_age_ii");
ITT(1433,45099,"ui\ingame\icon_age_ii");
ITT(1434,45101,"ui\ingame\icon_age_iii");
ITT(1435,45103,"ui\ingame\icon_age_iv");
ITT(1436,45105,"ui\ingame\icon_age_v");
ITT(1437,45107,"ui\ingame\icon_age_ii");
ITT(1438,45109,"ui\ingame\icon_age_iii");
ITT(1439,45111,"ui\ingame\icon_age_iv");
ITT(1440,45113,"ui\ingame\icon_age_v");
ITT(1441,45115,"ui\ingame\icon_age_ii");
ITT(1442,45117,"ui\ingame\icon_age_iii");
ITT(1443,45119,"ui\ingame\icon_age_iv");
ITT(1444,45121,"ui\ingame\icon_age_v");
ITT(1445,45123,"ui\techs\warrior_society\warrior_society");
ITT(1446,45126,"ui\ingame\icon_age_iii");
ITT(1447,45128,"ui\ingame\icon_age_iv");
ITT(1448,45130,"ui\ingame\icon_age_v");
ITT(1449,45132,"ui\ingame\icon_age_ii");
ITT(1450,45134,"ui\ingame\icon_age_iii");
ITT(1451,45136,"ui\ingame\icon_age_iv");
ITT(1452,45138,"ui\ingame\icon_age_v");
ITT(1453,45140,"ui\ingame\icon_age_ii");
ITT(1454,45142,"ui\ingame\icon_age_iii");
ITT(1455,45144,"ui\ingame\icon_age_iv");
ITT(1456,45146,"ui\ingame\icon_age_v");
ITT(1457,45148,"ui\ingame\icon_age_ii");
ITT(1458,45150,"ui\ingame\icon_age_iii");
ITT(1459,45152,"ui\ingame\icon_age_iv");
ITT(1460,45154,"ui\ingame\icon_age_v");
ITT(1461,45156,"ui\ingame\icon_age_ii");
ITT(1462,45158,"ui\ingame\icon_age_iii");
ITT(1463,45160,"ui\ingame\icon_age_iv");
ITT(1464,45162,"ui\ingame\icon_age_v");
ITT(1465,45164,"ui\ingame\icon_age_ii");
ITT(1466,45166,"ui\ingame\icon_age_iii");
ITT(1467,45168,"ui\ingame\icon_age_iv");
ITT(1468,45170,"ui\ingame\icon_age_v");
ITT(1469,45221,"ui\techs\revolution");
ITS(1470,45222);
ITS(1471,45223);
ITS(1472,45224);
ITS(1473,45225);
ITT(1475,45356,"ui\fire_pit\war_dance");
ITT(1476,45360,"ui\techs/native\Cult_of_the_Dead");
ITT(1477,45362,"ui\techs/native\Food_of_the_gods");
ITT(1478,45364,"ui\techs/native\cloud_people");
ITT(1479,45366,"ui\techs/native_horse_trading/nat_horse_trading");
ITT(1480,45368,"ui\techs/native_hunting_grounds/nat_hunting_grounds");
ITT(1481,45370,"ui\techs/native\Fish_Wedding");
ITT(1482,45372,"ui\techs/native\Sun_Ceremony");
ITT(1483,45374,"ui\techs/native\trade_dominance");
ITT(1484,45380,"ui\techs/native\fury");
ITT(1485,45382,"ui\techs/native\Endurance");
ITT(1486,45384,"ui\techs/native\CactusUse");
ITT(1487,45386,"ui\techs/native\Raiders");
ITT(1488,45388,"ui\techs\warrior_society\warrior_society");
ITT(1489,45393,"ui\techs\champion_natives\champion_natives");
ITT(1490,45398,"ui\techs/native\Strategy");
ITT(1491,45400,"ui\techs/native\huckleberry_festival");
ITT(1492,45402,"ui\techs/native\work_ethos");
ITT(1493,45404,"ui\techs/native\Craftmanship");
ITT(1494,45406,"ui\techs/native\Shepherds");
ITT(1495,45408,"ui\techs/native\weaving");
ITT(1496,45417,"ui\techs/native\ad-Mapu");
ITS(1497,45423,"ui\techs/native\Morning_Star");
ITT(1498,45427,"ui\techs/native\treaty_of_quillin");
ITT(1499,45429,"ui\techs/native\Tactics");
ITT(1500,45458,"ui\techs\warrior_society\warrior_society");
ITT(1501,45502,"ui\techs\military_drummers\military_drummers");
ITT(1507,45662,"ui\techs\deforestation\deforestation");
ITT(1508,45668,"ui\techs/native\elite_cavalry");
ITT(1509,45678,"ui\techs/native\champion_cavalry");
ITT(1510,45682,"ui\techs/native\champion_cavalry");
ITT(1511,45689,"ui\techs/native\legendary_cavalry");
ITT(1512,45692,"ui\techs/native\legendary_cavalry");
ITT(1513,45695,"ui\techs/native\legendary_cavalry");
ITT(1514,45701,"ui\techs/native\legendary_infantry");
ITT(1515,45704,"ui\techs/native\legendary_ranged_infantry");
ITS(1529,45952,"ui\units\az_war_canoe_icon");
ITT(1531,45958,"ui\techs\revolution");
ITT(1532,45960,"ui\techs\revolution");
ITT(1533,45962,"ui\techs\revolution");
ITT(1534,45964,"ui\techs\revolution");
ITT(1535,45966,"ui\techs\revolution");
ITT(1536,45968,"ui\techs\revolution");
ITT(1537,45970,"ui\techs\revolution");
ITT(1538,45972,"ui\techs\revolution");
ITT(1539,46001,"ui\techs\spies\spies");
ITT(1540,46003,"ui\techs\imperial_immigrants\imp_immigrants");
ITS(1541,46092,"ui\techs/native\HC_town_dance");
ITS(1542,46094,"ui\techs/native\HC_water_dance");
ITT(1543,46103,"units\spc\outlaws\outlaw_shotgun_icon");
ITT(1544,46105,"ui\units\fusilier_icon");
ITT(1545,46106,"units\mercenaries\mameluke\mameluke_icon_64x64");
ITT(1546,46107,"units\mercenaries\manchurian_archer\manchurian_archer_icon_64x64");
ITT(1547,46108,"units\mercenaries\hackapell\hackapell_icon");
ITT(1548,46109,"units\mercenaries\highlander\highlander_icon");
ITT(1549,46110,"units\mercenaries\landsknecht\landsknect_icon_64x64");
ITT(1550,46111,"units\mercenaries\balkan_stradiot\balkan_stradiot_icon_64x64");
ITT(1551,46112,"units\mercenaries\jaeger\hessian_jaeger_icon_64x64");
ITT(1552,46113,"units\mercenaries\samurai\ronin_icon");
ITT(1553,46114,"ui\units/ninja_icon");
ITT(1554,46132,"nuggets\outlaw_kidnap\outlaw_icon_64x64");
ITT(1555,46133,"units\spc\outlaws\outlaw_rider_icon_64x64");
ITT(1556,46134,"units\spc\pirates\pirate_icon");
ITT(1559,46139,"units\mercenaries\swiss_pikeman\swiss_pikeman_icon");
ITT(1560,46140,"ui\Units\elmeti_icon");
ITT(1561,46141,"units\mercenaries\barbary_corsair\barbary_corsair_icon_64x64");
ITT(1562,46142,"units\mercenaries\black_rider\black_rider_icon");
ITS(1573,46222);
ITS(1574,46223);
ITS(1575,46225);
ITS(1576,46226);
ITS(1577,46227);
ITT(1578,46309,"ui\techs/native\elite_cavalry");
ITT(1579,46313,"ui\techs/native\champion_cavalry");
ITT(1580,46317,"ui\techs/native\legendary_cavalry");
ITS(1581,46344);
ITS(1589,46498);
ITS(1590,46500);
ITS(1591,46509);
ITS(1592,46512);
ITS(1593,46513);
ITS(1594,46517);
ITS(1595,46519);
ITS(1596,46540);
ITS(1597,46542);
ITS(1598,46544);
ITS(1599,46546);
ITS(1600,46548);
ITS(1601,46549);
ITS(1602,46712);
ITS(1603,46714);
ITS(1604,46716);
ITS(1605,46788,"ui\techs/native\Dance_Hall");
ITS(1606,46792,"ui\techs/native\Master_Surgeons");
ITS(1607,46803,"ui\techs/native\Master_Surgeons");
ITS(1608,46808,"ui\techs/native\Dance_Hall");
ITS(1609,46811,"ui\techs/native\Ranching");
ITS(1610,46815,"ui\techs/native\Llama_Ranching");
ITS(1611,46820,"ui\techs/native\Kinship_Ties");
ITS(1612,46822);
ITS(1613,46823);
ITS(1614,46824,"ui\techs/native\Assassins");
ITS(1615,46828,"ui\techs/native\Informants");
ITS(1616,46832,"ui\techs\improved_grenades");
ITS(1617,46836);
ITS(1618,46837);
ITS(1619,46838);
ITS(1620,46839);
ITS(1621,46840);
ITS(1622,46841);
ITS(1623,46844);
ITS(1624,46846);
ITS(1625,46848,"ui\techs/native\Gribeauval_System");
ITS(1626,46852,"ui\techs/native\Sevastapol");
ITS(1627,46856,"ui\techs/native\Genitours");
ITS(1628,46862,"ui\techs/native\Irregulars");
ITS(1629,46866,"ui\techs/native\Economic_Theory");
ITS(1630,46870,"ui\techs/native\Land_Grab");
ITS(1631,46880,"ui\techs/native\AdvancedWhaling");
ITS(1632,46884);
ITS(1633,46885);
ITS(1634,46886,"ui\techs/native\Range_Finding");
ITS(1635,46890);
ITS(1636,46893,"ui\techs/native\Solingen_Steel");
ITS(1637,46901,"ui\techs/native\Forced_March");
ITS(1638,46907);
ITS(1640,46932,"ui\techs/native\Old_Ways");
ITS(1641,46935,"ui\techs/native\Old_Ways");
ITS(1642,46938,"ui\techs/native\Old_Ways");
ITS(1643,46941,"ui\techs\team_medicine");
ITS(1644,46946);
ITS(1645,46953);
ITS(1646,46954);
ITS(1647,46955);
ITS(1648,46956);
ITS(1649,46957);
ITS(1650,46959,"ui\techs/native/nomadic_Expansion");
ITS(1651,46963,"ui\techs/native\Friendly_Territory");
ITS(1652,46966);
ITS(1653,46967);
ITS(1654,46968);
ITS(1655,46969);
ITS(1656,46970);
ITS(1657,46971);
ITS(1658,46972);
ITS(1659,46973);
ITS(1660,46974);
ITS(1661,46976);
ITT(1662,46980,"ui\techs/native\Unction");
ITT(1663,46982,"ui\techs/native\State_Religion");
ITT(1664,46984,"ui\techs/native\Incendiary_Grenades");
ITS(1665,46985);
ITS(1666,46987,"ui\techs/native\Blood Brothers");
ITS(1667,46990);
ITS(1668,46991);
ITS(1669,46992);
ITS(1670,46993);
ITS(1671,46995);
ITS(1672,46997);
ITS(1673,46998);
ITS(1674,47000);
ITT(1675,47002,"ui\techs/native\Dance_Hall");
ITS(1676,47006,"ui\techs/native\Capitalism");
ITS(1677,47010,"ui\techs/native\Colbertism");
ITS(1678,47014,"ui\techs/native\Distributivism");
ITS(1679,47025,"ui\techs/native\Unction");
ITS(1680,47029,"ui\techs/native\Tercio_Tactics");
ITS(1681,47033,"ui\techs/native\tirailleurs");
ITS(1682,47036,"ui\techs/native\Thoroughbreds");
ITS(1683,47043);
ITS(1684,47048,"ui\techs/native\Offshore_Support");
ITS(1685,47051,"ui\techs/native\Florence_Nightingale");
ITS(1686,47057,"ui\techs/native\South_Sea_Bubble");
ITS(1687,47060);
ITS(1688,47062,"ui\techs/native\Admiral_Tromp");
ITS(1689,47066);
ITS(1690,47067);
ITS(1691,47069,"ui\techs/native\Sublime_Porte");
ITS(1692,47074);
ITS(1693,47075);
ITS(1694,47076);
ITS(1695,47078);
ITS(1696,47080,"ui\techs/native\House_Braganca");
ITS(1697,47084,"ui\techs/native\Factory_Blueprints");
ITS(1698,47087);
ITS(1699,47089,"ui\techs/native\suvorov_reforms");
ITS(1700,47094,"ui\techs/native\Spanish_Gold");
ITS(1701,47097);
ITS(1702,47100);
ITS(1703,47101);
ITS(1704,47103,"ui\techs/native\Blood Brothers");
ITS(1705,47124,"ui\techs/native/new_Ways");
ITS(1706,47128,"ui\techs/native/new_Ways");
ITS(1707,47131);
ITS(1708,47137);
ITS(1709,47139,"ui\techs/native\Agrarian Ways");
ITS(1710,47168,"ui\techs/native\Marauders");
ITS(1711,47171);
ITS(1712,47174,"ui\techs/native\Silent_Strike");
ITS(1713,47178,"ui\techs/native\Stone_Towers");
ITS(1714,47182,"ui\techs/native\Religious_Unity");
ITS(1715,47189,"ui\techs\hc_battlefield_construction\hc_battlefield_construction");
ITS(1716,47192);
ITS(1717,47193);
ITS(1718,47194);
ITS(1719,47195,"ui\techs/native\Advanced_Scouts");
ITS(1720,47198,"ui\techs/native\Ruthlessness");
ITS(1721,47202,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(1722,47204);
ITS(1723,47211);
ITS(1725,47219);
ITS(1726,47223,"ui\techs/native\Earth_Bounty");
ITS(1727,47226,"ui\techs/native\Evening_Star");
ITS(1728,47230,"ui\techs/native\mustangs");
ITS(1729,47234,"ui\techs/native\Wind_Runner");
ITS(1730,47236);
ITS(1731,47238,"ui\techs/native\Command_Skill");
ITS(1732,47242,"ui\techs/native\Conservative_Tactics");
ITS(1733,47245,"ui\techs/native\Siege_Discipline");
ITS(1734,47248);
ITS(1735,47250,"ui\techs/native\Siege_Combat");
ITS(1736,47261,"ui\techs/native\Fur_Trade");
ITS(1737,47265,"ui\techs/native/national_Unity");
ITS(1738,48418);
ITS(1740,48820);
ITT(1741,48833,"ui\techs\imperial_legendary_natives\imp_legendary_natives");
ITT(1742,48869,"ui\techs\hc_blockade\hc_blockade");
ITT(1743,48871,"units\spc\russian_cannon\russian_cannon_icon_64");
ITT(1744,48894,"ui\techs\imperial_artillery\imperial_artillery");
ITT(1745,48898,"ui\techs\guard_artillery\guard_artillery");
ITS(1746,48927);
ITS(1747,60399);
ITS(1748,60405);
ITS(1749,60407);
ITS(1750,60412,"ui\home_city\HC_indian_monk_combat_icon_64");
ITS(1751,60414,"ui\techs\asians\tech_train_disciple_icon_64");
ITS(1752,60416,"ui\home_city\HC_ship_monk_roundhouse_icon_64");
ITT(1753,60436,"ui\techs\asians\disciplined_infantry");
ITT(1754,60455,"ui\techs\asians\disciplined_infantry");
ITT(1755,60463,"ui\techs\asians\disciplined_cavalry");
ITT(1756,60469,"ui\techs\asians\disciplined_cavalry");
ITS(1757,60481,"ui\home_city\HC_japanese_monk_combat_icon_64");
ITT(1758,60483,"ui\techs\asians\exalted_infantry");
ITT(1759,60487,"ui\techs\asians\honored_infantry");
ITT(1760,60491,"ui\techs\asians\honored_infantry");
ITT(1761,60495,"ui\techs\asians\honored_cavalry");
ITT(1762,60499,"ui\techs\asians\honored_cavalry");
ITT(1763,60503,"ui\techs\asians\honored_elephants");
ITT(1764,60507,"ui\techs\asians\honored_elephants");
ITT(1765,60511,"ui\techs\asians\exalted_infantry");
ITT(1766,60515,"ui\techs\asians\exalted_cavalry");
ITT(1767,60519,"ui\techs\asians\exalted_cavalry");
ITT(1768,60523,"ui\techs\asians\exalted_elephants");
ITT(1769,60527,"ui\techs\asians\exalted_elephants");
ITT(1770,60531,"ui\techs\asians\exalted_elephants");
ITS(1771,60543,"ui\home_city\hc_japanese_monk_scare");
ITT(1772,60551,"ui\techs\asians\disciplined_ranged_infantry");
ITT(1773,60555,"ui\techs\asians\disciplined_natives");
ITT(1774,60559,"ui\techs\asians\disciplined_ranged_infantry");
ITT(1775,60567,"ui\techs\asians\disciplined_cavalry");
ITT(1776,60571,"ui\techs\asians\honored_ranged_infantry");
ITT(1777,60579,"ui\techs\asians\honored_ranged_infantry");
ITT(1778,60587,"ui\techs\asians\honored_cavalry");
ITT(1779,60591,"ui\techs\asians\honored_cavalry");
ITT(1780,60601,"ui\techs\asians\exalted_ranged_infantry");
ITT(1781,60609,"ui\techs\asians\exalted_ranged_infantry");
ITT(1782,60622,"ui\techs\asians\exalted_cavalry");
ITT(1783,60626,"ui\techs\asians\exalted_cavalry");
ITT(1784,60632,"ui\techs\asians\disciplined_chokuno");
ITT(1785,60643,"ui\techs\asians\disciplined_keshik");
ITT(1786,60647,"ui\techs\asians\honored_chokuno");
ITT(1787,60652,"ui\techs\asians\honored_arquebusier");
ITT(1788,60658,"ui\techs\asians\honored_keshik");
ITT(1789,60664,"ui\techs\asians\honored_ironflail");
ITT(1790,60672,"ui\techs\asians\exalted_chokuno");
ITT(1791,60677,"ui\techs\asians\exalted_arquebusier");
ITT(1792,60683,"ui\techs\asians\exalted_keshik");
ITT(1793,60689,"ui\techs\asians\exalted_ironflail");
ITT(1794,60695,"ui\techs\asians\disciplined_siege");
ITT(1795,60699,"ui\techs\asians\honored_siege");
ITT(1796,60703,"ui\techs\asians\honored_siege");
ITT(1797,60707,"ui\techs\asians\exalted_siege");
ITT(1798,60711,"ui\techs\asians\exalted_siege");
ITS(1799,60744,"ui\home_city\HC_indian_sacred_field_healing_icon_64");
ITS(1800,60755);
ITS(1801,60758);
ITS(1802,60866,"ui\home_city\hc_Land_Reforms");
ITS(1803,60942,"ui\techs\asians\Foreign_Logging");
ITS(1804,60952);
ITS(1805,60954);
ITS(1806,60960,"ui\techs\hc_furrier\hc_furrier");
ITS(1807,60963,"ui\techs\hc_spice_trade\hc_spice_trade");
ITS(1808,60970,"ui\home_city\HC_indian_goraksha_icon_64");
ITS(1809,60997,"ui\home_city\hc_team_chonindo");
ITS(1810,61013,"ui\home_city\hc_Armed_Fisherman");
ITS(1811,61034);
ITT(1812,61109,"ui\techs\asians\Sharia");
ITT(1813,61111,"ui\techs\asians\Fasting");
ITT(1814,61113,"ui\techs\asians\Pilgrimage");
ITT(1815,61115,"ui\techs\asians\Flying_Buttress");
ITT(1816,61119,"ui\techs\asians\Christian_Schools");
ITT(1817,61121,"ui\techs\asians\Smokeless_Powder");
ITT(1818,61123,"ui\techs\asians\clenched_fist");
ITT(1819,61125,"ui\techs\asians\dim_mak");
ITT(1820,61127,"ui\techs\asians\wood_clearing");
ITT(1821,61129,"ui\techs\asians\army_of_the_pure");
ITT(1822,61131,"ui\techs\asians\sikh_gurus");
ITT(1823,61133,"ui\techs\asians\punjabi_new_year");
ITT(1824,61135,"ui\techs\asians\Yoga");
ITT(1825,61137,"ui\techs\asians\reinforced_Gauntlets");
ITT(1826,61139,"ui\techs\asians\Vegetarianism");
ITT(1827,61141,"ui\techs\asians\master_lessons");
ITT(1828,61143,"ui\techs\asians\Meditation");
ITT(1829,61145,"ui\techs\asians\Merritocracy");
ITT(1830,61147,"ui\techs\asians\disciplined_natives");
ITT(1831,61151,"ui\techs\asians\disciplined_natives");
ITT(1832,61155,"ui\techs\asians\disciplined_natives");
ITT(1833,61159,"ui\techs\asians\disciplined_natives");
ITT(1834,61163,"ui\techs\asians\disciplined_natives");
ITT(1835,61167,"ui\techs\asians\disciplined_natives");
ITT(1836,61171,"ui\techs\asians\honered_natives");
ITT(1837,61175,"ui\techs\asians\honered_natives");
ITT(1838,61179,"ui\techs\asians\honered_natives");
ITT(1839,61183,"ui\techs\asians\honered_natives");
ITT(1840,61187,"ui\techs\asians\honered_natives");
ITT(1841,61191,"ui\techs\asians\honered_natives");
ITS(1854,61454);
ITS(1855,61455);
ITS(1856,61456);
ITS(1857,61457);
ITS(1858,61458);
ITS(1859,61459);
ITS(1860,61460);
ITS(1861,61461);
ITS(1862,61463);
ITS(1863,61464);
ITS(1864,61465);
ITS(1865,61466);
ITS(1866,61467);
ITS(1867,61469);
ITS(1868,61470);
ITS(1869,61471);
ITS(1870,61476);
ITS(1871,61477);
ITS(1872,61479);
ITS(1873,61480);
ITS(1874,61481);
ITS(1875,61482);
ITS(1876,61484);
ITS(1877,61485);
ITS(1878,61499);
ITS(1879,61500);
ITS(1880,61521);
ITS(1881,61522);
ITS(1882,61523);
ITS(1883,61524);
ITS(1885,61526);
ITS(1886,61527);
ITS(1887,61528);
ITS(1888,61529);
ITS(1889,61530);
ITS(1890,61532);
ITS(1891,61535,"ui\home_city\hc_mongolian_armor");
ITS(1892,61539,"ui\home_city\hc_standard_army_reforms");
ITS(1893,61543,"ui\techs\hc_infantry_combat\hc_infantry_combat");
ITS(1894,61551,"ui\home_city\hc_mongolian_scourge");
ITS(1895,61558,"ui\home_city\hc_old_han_heavy_infantry_bonus");
ITS(1896,61562,"ui\home_city\hc_banner_reforms");
ITS(1897,61579,"ui\home_city\hc_banner_school");
ITS(1898,61585,"ui\home_city\hc_great_wall");
ITS(1899,61589,"ui\home_city\hc_confucious_gift");
ITS(1900,61593);
ITS(1901,61602,"ui\home_city\HC_advanced_rice_paddy_icon_64");
ITS(1902,61611,"ui\home_city\HC_water_buffalo_ranching_icon_64");
ITS(1903,61615,"ui\techs\asians\Advanced_Consulate");
ITS(1904,61630);
ITS(1905,61632);
ITS(1906,61634);
ITS(1907,61635);
ITS(1908,61647);
ITS(1909,61650,"ui\home_city\hc_fireship_damage");
ITS(1910,61654);
ITS(1911,61656);
ITS(1912,61658);
ITS(1913,61660);
ITS(1914,61669);
ITS(1915,61671);
ITS(1916,61673);
ITS(1917,61731,"ui\home_city\hc_team_infantry_speed");
ITS(1918,61734,"ui\techs\hc_infantry_combat\hc_infantry_combat");
ITS(1919,61739,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(1920,61743,"ui\techs\asians\Camel_Frightening");
ITS(1921,61747,"ui\techs\asians\Elephant_Trampling");
ITS(1922,61764,"ui\home_city\HC_indian_grazing_icon_64");
ITT(1923,61768,"units\trade\stagecoach_icon_64x64");
ITS(1924,61785,"ui\techs\asians\Elephant_Limit");
ITS(1925,61805,"ui\techs\asians\chuck\hc_improved_buildings");
ITS(1926,61809,"ui\techs\asians\Mughal_Architecture");
ITS(1927,61815);
ITS(1928,61821);
ITS(1929,61822);
ITS(1930,61823);
ITS(1931,61825,"ui\techs\asians\Bombay_Marine");
ITS(1932,61838);
ITS(1933,61842);
ITS(1934,61844);
ITS(1935,61846);
ITS(1936,61848);
ITS(1937,61850);
ITS(1938,61852);
ITT(1939,61873,"units\trains\train_icon_64x64");
ITS(1940,61887,"ui\techs\hc_infantry_damage\hc_infantry_damage");
ITS(1941,61890,"ui\home_city\hc_Yumi_Range");
ITS(1942,61895,"ui\techs\hc_infantry_damage\hc_infantry_damage");
ITS(1943,61898,"ui\home_city\hc_Ashigaru_Anti_Cavalry_Damage");
ITS(1944,61903,"ui\techs\hc_cavalry_hitpoints\hc_cavalry_hitpoints");
ITS(1945,61907,"ui\home_city\hc_Naginata_Anti_Infantry_Damage");
ITS(1946,61911,"ui\home_city\hc_samurai_speed");
ITS(1947,61915,"ui\techs\hc_hand_infantry_damage\hc_hand_infantry_damage");
ITS(1948,61918,"ui\techs\hc_cavalry_damage\hc_cavalry_damage");
ITS(1949,61923,"ui\home_city\hc_Yabusame_Anti_Artillery_Damage");
ITT(1950,61956,"ui\techs\asians\government_county_icon_64");
ITS(1951,61975,"ui\techs\asians\Acupuncture");
ITS(1952,61979,"ui\home_city\HC_team_pioneers_shipment_icon_64");
ITS(1953,61982);
ITS(1954,62000);
ITS(1955,62016);
ITS(1956,62023);
ITS(1957,62024);
ITS(1958,62028);
ITS(1959,62031);
ITS(1960,62033);
ITS(1961,62037);
ITS(1962,62039);
ITS(1963,62041);
ITS(1964,62045);
ITS(1965,62047);
ITT(1966,62059,"ui\techs\asians\disciplined_ranged_infantry");
ITT(1967,62063,"ui\techs\asians\exalted_ranged_infantry");
ITT(1968,62067,"ui\techs\asians\honored_ranged_infantry");
ITT(1969,62076,"ui\techs\asians\government_prefecture_icon_64");
ITT(1970,62078,"ui\techs\asians\exalted_siege");
ITT(1972,65517,"ui\techs\asians\exalted_elephants");
ITS(1973,62215);
ITS(1974,62236);
ITS(1975,62281,"ui\techs/native\Economic_Theory");
ITS(1976,62319);
ITS(1977,62341,"ui\techs\hc_spice_trade\hc_spice_trade");
ITS(1978,62356);
ITS(1979,62358);
ITT(1980,62364,"ui\techs\imperial_navy\imperial_navy");
ITT(1981,62368,"ui\techs\imperial_navy\imperial_navy");
ITS(1984,62393,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(1985,62427,"ui\techs/native\Wood_Crafting");
//ITT(1988,62517,"ui\techs\asians\tech_peasant_uprising");
//ITT(1989,62521,"ui\techs\asians\tech_town_defense");
//ITT(1990,62525,"ui\techs\asians\tech_peasant_revolt");
//ITT(1991,62527,"ui\techs\asians\tech_city_defense");
ITS(1992,62529,"ui\home_city\hc_enlist_the_irregulars");
ITS(1993,62548);
ITS(1994,62549,"ui\home_city\hc_heavenly_kami");
ITS(1995,62576,"ui\home_city\hc_onin_war");
ITS(1996,62597,"ui\home_city\hc_Advanced_Wonders");
ITS(1997,62626,"ui\home_city\hc_2x_red_seal_ship");
ITT(1998,62713,"ui\techs\asians\paddy_threshing");
ITS(1999,62789,"ui\home_city\hc_village_shooty");
ITS(2000,62821);
ITS(2001,62822);
ITS(2002,62840,"ui\home_city\HC_improved_warships_green_icon_64");
ITS(2003,62845);
ITS(2004,62849);
ITS(2005,62853);
ITS(2006,62917);
ITS(2007,62918);
ITS(2008,62919);
ITT(2009,62928,"ui\techs\asians\faster_shipments");
ITT(2010,62930,"ui\techs\mercantilism\mercantilism");
ITT(2011,62932,"ui\techs\hc_silk_road\hc_silk_road");
ITT(2012,62991,"ui\techs\asians\government_town_icon_64");
ITT(2013,63576,"ui\techs\asians\disciplined_infantry");
ITT(2014,63580,"ui\techs\asians\honored_infantry");
ITT(2015,63579,"ui\techs\asians\exalted_infantry");
ITS(2017,63151);
ITS(2018,63153);
ITS(2019,63155);
ITS(2020,63157);
ITS(2021,63159);
ITS(2022,63161);
ITS(2023,63163);
ITS(2024,63165);
ITS(2025,63167);
ITS(2026,63169);
ITS(2027,63171);
ITS(2028,63173);
ITS(2029,63175);
ITS(2030,63177);
ITS(2031,63189);
ITS(2032,63190);
ITS(2033,63192,"ui\home_city\hc_indian_monk_frighten");
ITS(2034,63193);
ITS(2035,63194);
ITS(2036,63195);
ITS(2037,63196);
ITS(2038,63225);
ITS(2039,63228,"ui\techs\hc_fencing_school\hc_fencing_school");
ITS(2040,63231,"ui\techs\hc_riding_school\hc_riding_school");
ITS(2041,63238,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(2042,63241,"ui\techs\hc_pioneers\hc_pioneers");
ITS(2043,63244);
ITS(2044,63246,"ui\home_city\hc_enlist_the_irregulars");
ITS(2045,63249,"ui\home_city\HC_call_to_arms_icon_64");
ITS(2046,63262);
ITS(2047,63266,"ui\home_city\HC_advanced_rice_paddy_icon_64");
ITS(2048,63270,"ui\techs\asians\Advanced_Consulate");
ITS(2049,63280,"ui\home_city\hc_Advanced_Wonders");
ITS(2050,63283,"ui\techs\hc_advanced_dock\hc_advanced_dock");
ITS(2051,63291,"ui\home_city\hc_Land_Reforms");
ITS(2052,63297,"ui\techs\hc_fish_market\hc_fish_market");
ITS(2053,63300,"ui\techs\hc_rendering_plant\hc_rendering_plant");
ITS(2054,63303);
ITS(2055,63306,"ui\techs\hc_sawmills\hc_sawmills");
ITS(2056,63309,"ui\techs\hc_exotic_hardwoods\hc_exotic_hardwoods");
ITS(2057,63312,"ui\techs/native\Wood_Crafting");
ITS(2058,63315,"ui\techs\hc_iron_monger\hc_iron_monger");
ITS(2059,63318,"ui\techs\hc_establish_royal_mint\hc_establish_royal_mint");
ITS(2060,63321,"ui\techs\hc_silver_smith\hc_silver_smith");
ITS(2061,63324,"ui\techs\hc_silos\hc_silos");
ITS(2062,63327,"ui\techs\hc_sustainable_agriculture\hc_sustainable_agriculture");
ITS(2063,63333,"ui\techs/native\Fur_Trade");
ITS(2064,63341);
ITS(2065,63342);
ITS(2066,63344,"ui\techs\carronade\carronade");
ITS(2067,63347);
ITS(2068,63349);
ITS(2069,63351);
ITS(2070,63353);
ITT(2078,63509,"ui\techs\asians\irrigation_channels");
ITT(2079,63511,"ui\techs\asians\tech_dike_controlled_canals");
ITT(2080,63513,"ui\techs\asians\rice_trade");
ITT(2081,63515,"ui\techs\asians\rice_markets");
ITT(2082,63517,"ui\techs\asians\rice_exports");
ITT(2083,63519,"ui\techs\asians\mechanized_rice_cultivation");
ITT(2084,63521,"ui\techs\asians\collective_economy");
ITT(2085,63527,"ui\techs\asians\tech_tropical_timber_trade");
ITS(2091,63598,"ui\techs\hc_battlefield_construction\hc_battlefield_construction");
ITS(2095,63888);
ITS(2096,63896);
ITS(2097,63898);
ITT(2098,63901,"ui\techs\asians\sacred_cow");
ITT(2099,63958,"ui\eso\flag_british_icon");
//ITT(2100,63970,"ui\ingame\icon_age_ii");
ITT(2101,63976,"ui\techs\asians\hunting_eagles");
ITT(2102,63978,"ui\techs\asians\waterwheel");
ITT(2103,63980,"ui\techs\asians\tech_blanket_filters");
ITT(2104,63982,"ui\techs\asians\professional_hunters");
ITT(2105,63984,"ui\techs\asians\flume_and_ditching");
ITT(2106,63988,"ui\techs\circular_saw\circular_saw");
//ITT(2107,63998,"ui\ingame\icon_age_iii");
ITT(2108,64152,"ui\eso\flag_portuguese_icon");
ITT(2109,64154,"ui\eso\flag_dutch_icon");
ITT(2110,64156,"ui\eso\flag_russian_icon");
ITT(2111,64158,"ui\eso\flag_spanish_icon");
ITT(2112,64160,"ui\eso\flag_french_icon");
ITT(2113,64238,"buildings\arsenal\arsenal_icon");
ITT(2114,64239,"buildings\bank\bank_icon");
ITT(2115,64246,"ui\techs\asians\portuguese_expiditionary_fleet_icon_64");
ITT(2116,64250,"ui\techs\asians\portuguese_exploration_fleet_icon_64");
ITT(2117,64255,"ui\units\spy_icon");
ITT(2118,64258,"ui\techs\levy\levy");
ITT(2119,64260,"units\surgeons\surgeon_icon");
ITT(2120,64264,"ui\Units\petard_icon");
ITT(2121,64266,"buildings\factory\shared_factory_icon");
ITT(2122,64268,"buildings\fort\fort_icon");
ITT(2123,64270,"buildings\blockhouse\blockhouse_icon");
ITT(2124,64275,"ui\techs\hc_wood_crate\hc_wood_crate_128");
ITS(2128,64326);
ITS(2129,64333,"units\asians\japanese\daimyo_Kiyomasa\daimyo_kiyomasa_icon_64");
ITS(2130,64336,"units\asians\japanese\daimyo_Masamune\daimyo_massamune_icon_64");
ITS(2131,64338,"units\asians\spc\mototada\mototada_icon_64");
ITS(2132,64340,"units\asians\japanese\shogun\shogun_icon_64");
ITT(2133,64347,"buildings\church\church_icon");
ITT(2134,64349,"units/naval\fishing_ship\fishing_ship_icon_64x64");
ITT(2135,64358,"ui\techs\hc_coin_crate\hc_coin_crate");
ITT(2136,64361,"ui\techs\hc_food_crate\hc_food_crate_128");
ITS(2137,64396,"ui\home_city\hc_Armed_Fisherman");
//ITT(2138,64399,"ui\ingame\icon_age_iv");
//ITT(2139,64401,"ui\ingame\icon_age_v");
ITS(2140,64406,"ui\home_city\HC_saiga_shipment_spawn_icon_64");
ITT(2142,64606,"ui\techs\imperial_navy\imperial_navy");
ITT(2144,64641,"ui\ingame\icon_age_ii");
ITT(2145,64643,"ui\ingame\icon_age_iii");
ITT(2146,64645,"ui\ingame\icon_age_iv");
ITT(2147,64647,"ui\ingame\icon_age_v");
ITT(2148,64649,"ui\ingame\icon_age_ii");
ITT(2149,64651,"ui\ingame\icon_age_iii");
ITT(2150,64653,"ui\ingame\icon_age_iv");
ITT(2151,64655,"ui\ingame\icon_age_v");
ITT(2152,64659,"ui\ingame\icon_age_iii");
ITT(2153,64661,"ui\ingame\icon_age_iv");
ITT(2154,64663,"ui\ingame\icon_age_v");
ITT(2155,64665,"ui\ingame\icon_age_ii");
ITT(2156,64667,"ui\ingame\icon_age_ii");
ITT(2157,64669,"ui\ingame\icon_age_iii");
ITT(2158,64671,"ui\ingame\icon_age_iv");
ITT(2159,64673,"ui\ingame\icon_age_v");
ITT(2160,64675,"ui\ingame\icon_age_ii");
ITT(2161,64677,"ui\ingame\icon_age_iii");
ITT(2162,64679,"ui\ingame\icon_age_iv");
ITT(2163,64681,"ui\ingame\icon_age_v");
ITT(2164,64945,"ui\ingame\icon_age_ii");
ITT(2165,64951,"ui\ingame\icon_age_iii");
ITT(2166,65048,"ui\ingame\icon_age_iv");
ITT(2167,65050,"ui\ingame\icon_age_v");
ITT(2168,65054,"ui\ingame\icon_age_ii");
ITT(2169,65056,"ui\ingame\icon_age_iii");
ITT(2170,65058,"ui\ingame\icon_age_iv");
ITT(2171,65060,"ui\ingame\icon_age_v");
ITT(2172,65063,"ui\ingame\icon_age_ii");
ITT(2173,65065,"ui\ingame\icon_age_iii");
ITT(2174,65067,"ui\ingame\icon_age_iv");
ITT(2175,65069,"ui\ingame\icon_age_v");
ITT(2176,65071,"ui\ingame\icon_age_ii");
ITT(2177,65073,"ui\ingame\icon_age_iii");
ITT(2178,65075,"ui\ingame\icon_age_iv");
ITT(2179,65077,"ui\ingame\icon_age_v");
ITT(2180,65079,"ui\ingame\icon_age_ii");
ITT(2181,65081,"ui\ingame\icon_age_iii");
ITT(2182,65083,"ui\ingame\icon_age_iv");
ITT(2183,65085,"ui\ingame\icon_age_v");
ITT(2184,65087,"ui\ingame\icon_age_ii");
ITT(2185,65089,"ui\ingame\icon_age_iii");
ITT(2186,65091,"ui\ingame\icon_age_iv");
ITT(2187,65093,"ui\ingame\icon_age_v");
ITT(2188,65095,"ui\ingame\icon_age_ii");
ITT(2189,65097,"ui\ingame\icon_age_iii");
ITT(2190,65099,"ui\ingame\icon_age_iv");
ITT(2191,65101,"ui\ingame\icon_age_v");
ITT(2192,65110,"ui\ingame\icon_age_ii");
ITT(2193,65112,"ui\ingame\icon_age_iii");
ITT(2194,65114,"ui\ingame\icon_age_iv");
ITT(2195,65116,"ui\ingame\icon_age_v");
ITT(2196,65118,"ui\ingame\icon_age_ii");
ITT(2197,65120,"ui\ingame\icon_age_iii");
ITT(2198,65122,"ui\ingame\icon_age_iv");
ITT(2199,65124,"ui\ingame\icon_age_v");
ITT(2200,65126,"ui\ingame\icon_age_ii");
ITT(2201,65128,"ui\ingame\icon_age_iii");
ITT(2202,65130,"ui\ingame\icon_age_iv");
ITT(2203,65132,"ui\ingame\icon_age_v");
ITT(2212,65442,"ui\eso\flag_ottoman_icon");
ITT(2213,65454,"nuggets\outlaw_kidnap\outlaw_icon_64x64");
ITS(2214,65456);
ITT(2215,65461,"units\villagers\villager_icon");
ITT(2216,65463,"units\artillery\great_bombard\great_bombard_icon_64x64");
ITT(2217,65469,"ui\techs\asians\hanami_parties");
ITT(2218,65471,"ui\techs\asians\tech_yozakura_lanterns");
ITT(2219,65494,"ui\techs\asians\rice_surplus");
ITS(2221,65505);
ITS(2222,65510);
ITS(2223,65514);
ITS(2224,65515);
ITT(2225,65520,"ui\techs\asians\disciplined_elephants");
ITT(2226,65524,"ui\techs\asians\honored_elephants");
ITS(2235,65616);
ITS(2236,65617);
ITS(2237,65618);
ITS(2239,65620,"ui\home_city\hc_melee_damage");
ITS(2240,65623);
ITS(2241,65625);
ITS(2242,65626);
ITS(2243,65627);
ITS(2244,65628);
ITS(2245,65629);
ITS(2246,65630);
ITS(2247,65631);
ITS(2248,65632);
ITS(2249,65633);
ITS(2250,65634);
ITS(2251,65635);
ITS(2253,65637);
ITS(2254,65638);
ITS(2255,65639);
ITS(2256,65640);
ITS(2257,65641);
ITS(2258,65642);
ITS(2259,65643);
ITS(2260,65644);
ITS(2261,65645);
ITS(2262,65646);
ITS(2263,65647);
ITS(2264,65649,"ui\home_city\hc_ming_hp");
ITS(2265,65653,"ui\techs\hc_artillary_combat\hc_artillary_combat");
ITS(2282,65705,"ui\techs\asians\tech_rural_peasant_uprising");
ITT(2283,65711,"ui\techs\hc_rum_distillery\hc_rum_distillery");
ITS(2284,65725,"ui\techs\asians\tech_cherry_blossom_festival_icon_64");
ITS(2285,65729);
ITT(2289,65905,"ui\eso\flag_german_icon");
ITT(2291,65909,"ui\techs/native\Capitalism");
ITT(2292,65911,"ui\techs/native\Colbertism");
ITT(2293,65913,"ui\techs/native\Distributivism");
ITS(2296,65958);
ITS(2298,65965);
ITT(2299,65967,"ui\techs\asians\disciple_aura");
ITT(2300,65969,"ui\techs\asians\shaolin_warrior");
ITT(2301,65971,"ui\techs\asians\critical_upgrade");
ITT(2302,65973,"ui\techs\asians\pet_training");
ITT(2303,65975,"ui\techs\asians\improved_healing");
ITT(2304,65977,"ui\techs\asians\tech_stomp_icon");
ITT(2305,65979,"ui\techs\asians\tech_terror_charge_icon_64");
ITT(2306,65981,"ui\techs\asians\tech_japan_stealth_icon");
ITT(2307,65983,"ui\techs\asians\tech_monk_healing_icon");
ITT(2308,65985,"ui\techs\asians\tech_japan_kayakujutin_icon");
ITT(2309,65987,"ui\techs\asians\tech_japan_kayakujutin_icon_64");
ITT(2310,65989,"ui\techs\asians\attack_upgrade");
ITT(2311,66011,"ui\techs\asians\exalted_siege");
ITT(2312,66015,"ui\techs\asians\exalted_siege");
ITT(2313,66019,"ui\techs\asians\honored_elephants");
ITT(2314,66023,"ui\techs\asians\honored_siege");
ITT(2315,66027,"ui\techs\asians\tech_frontier_castle");
ITT(2316,66032,"ui\techs\asians\tech_fortified_castle");
ITS(2317,66046,"ui\home_city\hc_year_of_the_goat");
ITS(2318,66048,"ui\home_city\hc_year_of_the_ox");
ITS(2319,66075,"ui\techs/native\Distributivism");
ITT(2320,66079,"ui\techs\asians\tech_fortified_castle");
ITT(2321,66086,"ui\techs\asians\tech_frontier_castle");
ITS(2322,66104);
ITS(2323,66110);
ITS(2324,66111);
ITS(2325,66112);
ITS(2326,66113);
ITS(2327,66118,"ui\techs\hc_artillary_hitpoints\hc_artillary_hitpoints");
ITS(2328,66121,"ui\home_city\hc_Flaming_Arrow_Cost");
ITT(2329,66131,"ui\techs\asians\government_provincial_icon_64");
ITS(2330,66137,"ui\home_city\HC_migrants_shipment_spawn_icon_64");
ITS(2331,66139,"ui\home_city\hc_northern_refugees");
ITS(2332,66141,"ui\home_city\hc_western_refugees");
ITT(2333,66143,"ui\techs\asians\tech_rural_defense");
ITS(2338,66167);
ITS(2339,66182,"units\asians\japanese\daimyo_Kiyomasa\daimyo_kiyomasa_icon_64");
ITS(2340,66184,"units\asians\japanese\daimyo_Masamune\daimyo_massamune_icon_64");
ITS(2341,66186,"units\asians\japanese\shogun\regecide_shogun_icon_64");
ITS(2343,66204);
ITT(2344,66237,"ui\eso\flag_dutch_icon");
ITT(2345,66239,"ui\eso\flag_portuguese_icon");
ITS(2346,66273);
ITS(2347,66277,"ui\techs\asians\Peacetime_Fishing");
ITS(2348,66281,"ui\techs\asians\European_Cannons");
ITS(2349,66285,"ui\techs\asians\European_Cannons");
ITS(2350,66389,"ui\home_city\hc_Stone_Castles");
ITS(2351,66392,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(2352,66400);
ITT(2353,66443,"ui\techs\asians\tech_dojo_upgrade2");
ITS(2355,66450);
ITS(2356,66457);
ITS(2357,66459);
ITS(2358,66461);
ITT(2359,66472,"ui\techs\asians\tech_spirit_medicine_icon_64");
ITS(2363,66513,"ui\techs\asians\tech_advance_to_regulars_icon_64");
ITT(2367,66600,"units\asians\consulate\british_armies\british_brigade_icon_64");
ITT(2368,66603,"units\asians\consulate\germany_brigade");
ITT(2369,66605,"units\asians\consulate\rus_armies\rus_brigade_icon_64");
ITT(2370,66607,"units\asians\consulate\french_armies\french_brigade_icon_64");
ITT(2371,66609,"units\asians\consulate\dutch_brigade");
ITT(2372,66611,"units\asians\consulate\spanish_brigade");
ITT(2373,66613,"units\asians\consulate\por_armies\por_brigade_icon_64");
ITT(2374,66615,"units\asians\consulate\ottoman_brigade");
ITT(2375,67133,"ui\techs\asians\disciplined_pikeman");
ITT(2376,67137,"ui\techs\asians\disciplined_stepperider");
ITT(2377,67141,"ui\techs\asians\honored_meteorhammer");
ITT(2378,67145,"ui\techs\asians\honored_stepperider");
ITT(2379,67149,"ui\techs\asians\honored_changdao");
ITT(2380,67153,"ui\techs\asians\honored_pikeman");
ITT(2381,67157,"ui\techs\asians\exalted_meteorhammer");
ITT(2382,67161,"ui\techs\asians\exalted_stepperider");
ITT(2383,67165,"ui\techs\asians\exalted_pikeman");
ITT(2384,67169,"ui\techs\asians\exalted_changdao");
ITT(2385,67682,"units\trains\train_icon_64x64");
ITT(2386,67684,"units\asians\shared\rickshaw\rickshaw2_icon_portrait");
ITS(2387,67702);
ITT(2389,68231,"ui\eso\flag_japanese_icon");
ITT(2391,68287,"units\asians\shared\wagon\japanese_town_center_wagon_icon_64");
ITT(2392,68288,"ui\techs\asians\tech_master_training");
ITT(2393,68289,"ui\techs\asians\tech_free_samurai");
ITT(2394,68291,"ui\ingame\icon_age_v");
ITS(2395,68307,"ui\techs\asians\tech_empress_dowager_icon_64");
ITS(2396,68311,"ui\home_city\hc_bakufu");
ITS(2397,68314);
ITT(2401,68387,"units\mercenaries\black_rider\black_rider_icon");
ITT(2402,68388,"units\mercenaries\black_rider\black_rider_icon");
ITT(2403,68389,"units\mercenaries\black_rider\black_rider_icon");
ITT(2404,68398,"units\mercenaries\black_rider\black_rider_icon");
ITT(2405,68399,"units\mercenaries\black_rider\black_rider_icon");
ITT(2406,68400,"units\mercenaries\black_rider\black_rider_icon");
ITS(2408,68493);
ITS(2409,68498);
ITS(2410,68523);
ITS(2411,68526);
ITT(2412,68563,"ui\techs\asians\honored_siege");
ITT(2413,68616,"ui\techs\asians\imperial_beureaucracy");
ITT(2414,68618,"ui\techs\asians\civil_servants");
ITT(2416,68623,"ui\eso\chinese_SPC_flag_icon_64");
ITT(2417,68625,"ui\eso\flag_japanese_icon");
ITT(2418,68627,"ui\eso\indian_SPC_flag_icon_64");
ITS(2426,68672,"ui\techs\asians\hc_the_raj");
ITS(2427,68674,"ui\home_city\HC_zen_diet_icon_64");
ITS(2430,68726,"ui\home_city\HC_conscript_sepoy_icon_64");
ITS(2431,68744);
ITS(2432,68749);
ITS(2433,68758,"ui\home_city\hc_seven_lucky_Gods");
ITS(2434,68860,"ui\techs\asians\Sumptuary_Laws");
ITS(2435,68864,"ui\techs\asians\Sumptuary_Laws");
ITS(2436,68876);
ITS(2437,68880);
ITS(2438,68886,"ui\techs/native\Land_Grab");
ITS(2439,68889,"ui\home_city\hc_Warring_States");
ITS(2440,68904,"ui\home_city\HC_ghurka_aid_icon_64");
ITS(2441,68908,"ui\home_city\HC_team_engineering_school_icon_64");
ITS(2442,68912,"ui\home_city\hc_team_art_of_war");
ITS(2443,68916,"ui\home_city\hc_nomads");
ITS(2444,68918,"ui\home_city\HC_team_sumptuary_laws_icon_64");
ITS(2445,68922,"ui\home_city\team_cheap_unit_upgrade_icon_64");
ITS(2446,68945,"ui\home_city\hc_manchu_attack");
ITS(2447,68949,"ui\home_city\hc_han_anti_cavalry_bonus");
ITS(2448,69004,"ui\home_city\hc_team_house_hitpoints");
ITS(2449,69008,"ui\techs\asians\HC_farmland_conservation_icon_64");
ITS(2450,69013,"ui\home_city\hc_Intervention");

ITS(196,69013,"ui\home_city\hc_Intervention"); //British Intervention
ITS(197,69013,"ui\home_city\hc_Intervention"); //Dutch Intervention
ITS(198,69013,"ui\home_city\hc_Intervention"); //French Intervention
ITS(199,69013,"ui\home_city\hc_Intervention"); //Germans Intervention
ITS(200,69013,"ui\home_city\hc_Intervention"); //Ottoman Intervention
ITS(201,69013,"ui\home_city\hc_Intervention"); //Russians Intervention
ITS(202,69013,"ui\home_city\hc_Intervention"); //Spanish Intervention
ITS(203,69013,"ui\home_city\hc_Intervention"); //Japanese Intervention
ITS(2451,69013,"ui\home_city\hc_Intervention"); //Portuguese Intervention

ITS(2452,69018,"ui\home_city\hc_Intervention");
ITS(2453,69021,"ui\home_city\hc_native_warrior_attack");
ITS(2454,69025,"ui\home_city\hc_native_warrior_attack");
ITS(2455,69028,"ui\home_city\hc_native_warrior_hp");
ITS(2456,69032,"ui\home_city\hc_native_warrior_hp");
ITS(2457,69035,"ui\home_city\HC_native_alliance_icon_64");
ITS(2458,69041,"ui\home_city\HC_native_alliance_icon_64");
ITS(2459,69044,"ui\home_city\HC_native_crafts_icon_64");
ITS(2460,69047,"ui\home_city\HC_native_crafts_icon_64");
ITS(2462,69118);
ITS(2463,69130,"ui\home_city\hc_east_india_company_combat");
ITS(2464,69143);
ITS(2465,69144);
ITS(2466,69192,"ui\home_city\HC_native_learning_icon_64");
ITS(2467,69195,"ui\home_city\HC_native_learning_icon_64");
ITT(2468,69200,"ui\techs\imperial_navy\imperial_navy");
ITS(2469,69205,"ui\techs\hc_mercenary_loyalty\hc_mercenary_loyalty");
ITS(2470,69207);
ITS(2471,69217,"ui\techs\asians\tech_western_reform_icon_64");
ITS(2473,69258);
ITS(2474,69261);
ITS(2475,69263);
ITS(2476,69267);
ITS(2477,69268);
ITS(2478,69269);
ITS(2479,69270);
ITS(2480,69272);
ITS(2481,69277,"ui\techs\asians\hc_morutaru_upgrade");
ITS(2482,69306);
ITS(2484,69415);
ITS(2485,69429,"ui\home_city\hc_elephant_combat");
ITT(2486,69456,"units\mercenaries\black_rider\black_rider_icon");
ITT(2487,69607,"units\mercenaries\black_rider\black_rider_icon");
ITT(2488,69608,"units\mercenaries\black_rider\black_rider_icon");
ITS(2491,69650,"ui\home_city\hc_Atonement");
ITS(2492,69655,"ui\home_city\hc_Atonement");
ITS(2493,69659,"ui\home_city\hc_Atonement");
ITS(2494,69663,"ui\techs\hc_admirality\hc_admirality");
ITT(2496,69796,"ui\home_city\hc_Atonement");
ITT(2497,69798,"ui\techs\asians\disciplined_ranged_infantry");
ITT(2498,69802,"ui\techs\asians\honored_ranged_infantry");
ITT(2499,69806,"ui\techs\asians\exalted_ranged_infantry");
ITT(2500,69826,"units\asians\shared\rickshaw\rickshaw2_icon");
ITT(2501,69828,"units\trains\train_icon_64x64");
ITS(2502,69850);
ITS(2503,69851);
ITS(2504,69864);
ITS(2505,69866);
ITS(2506,69868);
ITS(2507,69870);
ITS(2508,69872);
ITT(2510,70001,"ui\eso\flag_ottoman_icon");
ITT(2511,70003,"ui\eso\flag_french_icon");
ITS(2512,70212);
ITS(2513,70214);
ITS(2514,70216);
ITS(2515,70218);
ITS(2516,70220);
ITS(2517,70222);
ITS(2518,70223);
ITS(2519,70225,"ui\techs\hc_extensive_fortifications\hc_extensive_fortifications");
ITS(2520,70236); ///This is the 2x fishing upgrade for japan
ITS(2521,70239,"ui\techs\hc_improved_buildings\hc_improved_buildings");
ITS(2522,70242); ///2x wood
ITS(2523,70245); ///2x gold
ITS(2524,70258);
ITT(2525,70264,"ui\techs\asians\tech_shrine_resource_upgrade");
//ITT(2527,70306,"ui\techs\asians\tech_passive_convert_disciple_icon_64");
//ITT(2528,70317,"ui\techs\asians\tech_peasant_revolt_indian");
//ITT(2529,70319,"ui\techs\asians\tech_peasant_uprising_indian");
//ITT(2530,70322,"ui\techs\asians\tech_town_defense_indian");
//ITT(2531,70325,"ui\techs\asians\tech_city_defense_indian");
ITS(2532,70343,"ui\techs\hc_artillary_damage\hc_artillary_damage");
ITS(2533,70346,"ui\techs\hc_artillary_hitpoints\hc_artillary_hitpoints");
ITT(2534,70371,"ui\techs\asians\tech_legendary_natives");
ITS(2535,70415);
ITS(2536,70440);
ITT(2544,70491,"ui\ingame\icon_age_v");
ITS(2545,70496);
ITS(2546,70499);
ITS(2547,70507);
ITT(1567,46172,"spec\techs\BB_1567");
ITT(1516,45709,"spec\techs\BB_1516");
ITT(1518,45713,"spec\techs\BB_1518");
ITT(1568,46174,"spec\techs\BB_1568");
ITT(1569,46178,"spec\techs\BB_1569");
ITT(1128,43614,"spec\techs\BB_1128");
ITT(1519,45715,"spec\techs\BB_1519");
ITT(1571,46184,"spec\techs\BB_1571");
ITT(1139,43657,"spec\techs\BB_1139");
ITT(1570,46182,"spec\techs\BB_1570");
ITT(1140,43659,"spec\techs\BB_1140");
ITT(1558,46138,"spec\techs\BB_1558");
ITT(1527,45899,"spec\techs\BB_1527");
ITT(1563,46162,"spec\techs\BB_1563");
ITT(1142,43693,"spec\techs\BB_1142");
ITT(1526,45887,"spec\techs\BB_1526");
ITT(1521,45719,"spec\techs\BB_1521");
ITT(1517,45711,"spec\techs\BB_1517");
ITT(1566,46170,"spec\techs\BB_1566");
ITT(1523,45723,"spec\techs\BB_1523");
ITT(1557,46136,"spec\techs\BB_1557");
ITT(1141,43690,"spec\techs\BB_1141");
ITT(1522,45721,"spec\techs\BB_1522");
ITT(1565,46168,"spec\techs\BB_1565");
ITT(1143,43696,"spec\techs\BB_1143");
ITT(1129,43616,"spec\techs\BB_1129");
ITT(1564,46166,"spec\techs\BB_1564");
ITT(1520,45717,"spec\techs\BB_1520");
ITT(1130,43618,"spec\techs\BB_1130");
ITT(2228,65603,"spec\techs\UI_endrelations");
ITT(2229,65605,"spec\techs\UI_endrelations");
ITT(2230,65607,"spec\techs\UI_endrelations");
ITT(2231,65609,"spec\techs\UI_endrelations");
ITT(2232,65611,"spec\techs\UI_endrelations");
ITT(2233,65613,"spec\techs\UI_endrelations");
ITT(2234,65615,"spec\techs\UI_endrelations");
ITT(2290,65907,"spec\techs\UI_endrelations");
ITT(2365,66530,"spec\techs\UI_endrelations");
ITT(2366,66532,"spec\techs\UI_endrelations");
ITT(2390,68233,"spec\techs\UI_endisolation");
ITT(2419,68629,"spec\techs\UI_endrelations");
ITT(2420,68631,"spec\techs\UI_endrelations");
ITT(2421,68633,"spec\techs\UI_endrelations");
	cEf(" } ");
}
	
	cEf(" int isPROGRESSION(int new=-1, int old=-1){ ");
cEf(" if(new==168 && old==2102){return(1);} ");
cEf(" if(new==259 && old==1741){return(1);} ");
cEf(" if(new==263 && old==261){return(1);} ");
cEf(" if(new==264 && old==260){return(1);} ");
cEf(" if(new==267 && old==266){return(1);} ");
cEf(" if(new==270 && old==269){return(1);} ");
cEf(" if(new==272 && old==407){return(1);} ");
cEf(" if(new==296 && old==295){return(1);} ");
cEf(" if(new==298 && old==297){return(1);} ");
cEf(" if(new==303 && old==273){return(1);} ");
cEf(" if(new==310 && old==550){return(1);} ");
cEf(" if(new==311 && old==553){return(1);} ");
cEf(" if(new==317 && old==560){return(1);} ");
cEf(" if(new==318 && old==556){return(1);} ");
cEf(" if(new==319 && old==320){return(1);} ");
cEf(" if(new==325 && old==263){return(1);} ");
cEf(" if(new==328 && old==327){return(1);} ");
cEf(" if(new==331 && old==272){return(1);} ");
cEf(" if(new==332 && old==273){return(1);} ");
cEf(" if(new==333 && old==270){return(1);} ");
cEf(" if(new==340 && old==268){return(1);} ");
cEf(" if(new==343 && old==339){return(1);} ");
cEf(" if(new==345 && old==275){return(1);} ");
cEf(" if(new==346 && old==277){return(1);} ");
cEf(" if(new==347 && old==270){return(1);} ");
cEf(" if(new==354 && old==271){return(1);} ");
cEf(" if(new==355 && old==272){return(1);} ");
cEf(" if(new==356 && old==551){return(1);} ");
cEf(" if(new==357 && old==552){return(1);} ");
cEf(" if(new==358 && old==554){return(1);} ");
cEf(" if(new==359 && old==555){return(1);} ");
cEf(" if(new==360 && old==558){return(1);} ");
cEf(" if(new==361 && old==557){return(1);} ");
cEf(" if(new==362 && old==561){return(1);} ");
cEf(" if(new==373 && old==372){return(1);} ");
cEf(" if(new==390 && old==403){return(1);} ");
cEf(" if(new==394 && old==393){return(1);} ");
cEf(" if(new==395 && old==338){return(1);} ");
cEf(" if(new==398 && old==397){return(1);} ");	
cEf(" if(new==401 && old==267){return(1);} ");
cEf(" if(new==403 && old==262){return(1);} ");
cEf(" if(new==404 && old==265){return(1);} ");
cEf(" if(new==409 && old==410){return(1);} ");
cEf(" if(new==413 && old==263){return(1);} ");
cEf(" if(new==427 && old==426){return(1);} ");
cEf(" if(new==429 && old==428){return(1);} ");
cEf(" if(new==444 && old==445){return(1);} ");
cEf(" if(new==448 && old==298){return(1);} ");
cEf(" if(new==449 && old==293){return(1);} ");
cEf(" if(new==450 && old==264){return(1);} ");
cEf(" if(new==452 && old==272){return(1);} ");	cEf(" if(new==452 && old==331){return(1);} ");
cEf(" if(new==453 && old==339){return(1);} ");	cEf(" if(new==453 && old==343){return(1);} ");
cEf(" if(new==454 && old==347){return(1);} ");	cEf(" if(new==454 && old==270){return(1);} ");
cEf(" if(new==455 && old==275){return(1);} ");	cEf(" if(new==455 && old==345){return(1);} ");
cEf(" if(new==456 && old==340){return(1);} ");	cEf(" if(new==456 && old==268){return(1);} ");
cEf(" if(new==457 && old==263){return(1);} ");	cEf(" if(new==457 && old==325){return(1);} ");
cEf(" if(new==458 && old==304){return(1);} ");
cEf(" if(new==459 && old==271){return(1);} ");	cEf(" if(new==459 && old==354){return(1);} ");
cEf(" if(new==460 && old==273){return(1);} ");	cEf(" if(new==460 && old==303){return(1);} ");
cEf(" if(new==461 && old==275){return(1);} ");
cEf(" if(new==462 && old==272){return(1);} ");
cEf(" if(new==463 && old==268){return(1);} ");
cEf(" if(new==464 && old==270){return(1);} ");
cEf(" if(new==465 && old==263){return(1);} ");
cEf(" if(new==466 && old==267){return(1);} ");	cEf(" if(new==466 && old==401){return(1);} ");
cEf(" if(new==467 && old==273){return(1);} ");
cEf(" if(new==468 && old==270){return(1);} ");	cEf(" if(new==468 && old==333){return(1);} ");
cEf(" if(new==469 && old==263){return(1);} ");	cEf(" if(new==469 && old==413){return(1);} ");
cEf(" if(new==470 && old==272){return(1);} ");	cEf(" if(new==470 && old==355){return(1);} ");
cEf(" if(new==471 && old==328){return(1);} ");
cEf(" if(new==472 && old==344){return(1);} ");
cEf(" if(new==473 && old==404){return(1);} ");
cEf(" if(new==474 && old==394){return(1);} ");
cEf(" if(new==475 && old==319){return(1);} ");
cEf(" if(new==476 && old==352){return(1);} ");
cEf(" if(new==477 && old==274){return(1);} ");
cEf(" if(new==478 && old==271){return(1);} ");
cEf(" if(new==479 && old==290){return(1);} ");
cEf(" if(new==480 && old==289){return(1);} ");
cEf(" if(new==481 && old==291){return(1);} ");
cEf(" if(new==483 && old==497){return(1);} ");
cEf(" if(new==496 && old==427){return(1);} ");
cEf(" if(new==499 && old==310){return(1);} ");
cEf(" if(new==500 && old==356){return(1);} ");
cEf(" if(new==507 && old==504){return(1);} ");
cEf(" if(new==513 && old==559){return(1);} ");
cEf(" if(new==515 && old==981){return(1);} ");
cEf(" if(new==517 && old==1077){return(1);} ");
cEf(" if(new==518 && old==1078){return(1);} ");
cEf(" if(new==630 && old==395){return(1);} ");
cEf(" if(new==631 && old==390){return(1);} ");
cEf(" if(new==632 && old==336){return(1);} ");
cEf(" if(new==657 && old==630){return(1);} ");
cEf(" if(new==919 && old==988){return(1);} ");
cEf(" if(new==981 && old==514){return(1);} ");
cEf(" if(new==1001 && old==273){return(1);} ");cEf(" if(new==1001 && old==332){return(1);} ");
cEf(" if(new==1077 && old==348){return(1);} ");
cEf(" if(new==1079 && old==518){return(1);} ");
cEf(" if(new==1114 && old==1107){return(1);} ");
cEf(" if(new==1115 && old==1111){return(1);} ");
cEf(" if(new==1116 && old==1108){return(1);} ");
cEf(" if(new==1118 && old==1117){return(1);} ");
cEf(" if(new==1119 && old==1114){return(1);} ");
cEf(" if(new==1120 && old==1115){return(1);} ");
cEf(" if(new==1121 && old==1109){return(1);} ");
cEf(" if(new==1122 && old==1110){return(1);} ");
cEf(" if(new==1123 && old==1112){return(1);} ");
cEf(" if(new==1124 && old==1113){return(1);} ");
cEf(" if(new==1125 && old==1116){return(1);} ");
cEf(" if(new==1126 && old==1127){return(1);} ");
cEf(" if(new==1203 && old==1206){return(1);} ");
cEf(" if(new==1206 && old==1204){return(1);} ");
cEf(" if(new==1207 && old==1205){return(1);} ");
cEf(" if(new==1213 && old==1211){return(1);} ");
cEf(" if(new==1214 && old==1212){return(1);} ");
cEf(" if(new==1258 && old==1262){return(1);} ");
cEf(" if(new==1263 && old==1214){return(1);} ");
cEf(" if(new==1264 && old==1258){return(1);} ");
cEf(" if(new==1265 && old==1213){return(1);} ");
cEf(" if(new==1266 && old==1260){return(1);} ");
cEf(" if(new==1267 && old==1259){return(1);} ");
cEf(" if(new==1268 && old==1261){return(1);} ");
cEf(" if(new==1305 && old==1304){return(1);} ");
cEf(" if(new==1313 && old==1311){return(1);} ");
cEf(" if(new==1314 && old==1312){return(1);} ");
cEf(" if(new==1341 && old==1337){return(1);} ");
cEf(" if(new==1342 && old==1338){return(1);} ");
cEf(" if(new==1343 && old==1339){return(1);} ");
cEf(" if(new==1344 && old==1340){return(1);} ");
cEf(" if(new==1381 && old==1380){return(1);} ");
cEf(" if(new==1382 && old==1381){return(1);} ");
cEf(" if(new==1384 && old==1385){return(1);} ");
cEf(" if(new==1385 && old==1386){return(1);} ");
cEf(" if(new==1388 && old==1387){return(1);} ");
cEf(" if(new==1424 && old==1388){return(1);} ");
cEf(" if(new==1425 && old==1382){return(1);} ");
cEf(" if(new==1427 && old==1426){return(1);} ");
cEf(" if(new==1489 && old==1488){return(1);} ");
cEf(" if(new==1507 && old==1384){return(1);} ");
cEf(" if(new==1509 && old==1508){return(1);} ");
cEf(" if(new==1511 && old==1509){return(1);} ");
cEf(" if(new==1512 && old==1510){return(1);} ");
cEf(" if(new==1513 && old==1208){return(1);} ");
cEf(" if(new==1514 && old==1207){return(1);} ");
cEf(" if(new==1515 && old==1257){return(1);} ");
cEf(" if(new==1579 && old==1578){return(1);} ");
cEf(" if(new==1580 && old==1579){return(1);} ");
cEf(" if(new==1663 && old==1662){return(1);} ");
cEf(" if(new==1744 && old==1745){return(1);} ");
cEf(" if(new==1758 && old==1759){return(1);} ");
cEf(" if(new==1759 && old==1754){return(1);} ");
cEf(" if(new==1761 && old==1755){return(1);} ");
cEf(" if(new==1762 && old==1756){return(1);} ");
cEf(" if(new==1766 && old==1761){return(1);} ");
cEf(" if(new==1767 && old==1762){return(1);} ");
cEf(" if(new==1768 && old==1763){return(1);} ");
cEf(" if(new==1769 && old==1764){return(1);} ");
cEf(" if(new==1770 && old==2313){return(1);} ");
cEf(" if(new==1776 && old==1772){return(1);} ");
cEf(" if(new==1777 && old==1774){return(1);} ");
cEf(" if(new==1778 && old==1775){return(1);} ");
cEf(" if(new==1780 && old==1776){return(1);} ");
cEf(" if(new==1781 && old==1777){return(1);} ");
cEf(" if(new==1782 && old==1778){return(1);} ");
cEf(" if(new==1783 && old==1779){return(1);} ");
cEf(" if(new==1786 && old==1784){return(1);} ");
cEf(" if(new==1788 && old==1785){return(1);} ");
cEf(" if(new==1790 && old==1786){return(1);} ");
cEf(" if(new==1791 && old==1787){return(1);} ");
cEf(" if(new==1792 && old==1788){return(1);} ");
cEf(" if(new==1793 && old==1789){return(1);} ");
cEf(" if(new==1795 && old==1794){return(1);} ");
cEf(" if(new==1797 && old==1795){return(1);} ");
cEf(" if(new==1798 && old==1796){return(1);} ");
cEf(" if(new==1836 && old==1832){return(1);} ");
cEf(" if(new==1837 && old==1834){return(1);} ");
cEf(" if(new==1838 && old==1830){return(1);} ");
cEf(" if(new==1839 && old==1833){return(1);} ");
cEf(" if(new==1840 && old==1831){return(1);} ");
cEf(" if(new==1841 && old==1835){return(1);} ");
cEf(" if(new==1950 && old==2012){return(1);} ");
cEf(" if(new==1967 && old==1968){return(1);} ");
cEf(" if(new==1968 && old==1966){return(1);} ");
cEf(" if(new==1969 && old==1950){return(1);} ");
cEf(" if(new==1970 && old==1795){return(1);} ");
cEf(" if(new==1972 && old==2226){return(1);} ");
cEf(" if(new==2014 && old==2013){return(1);} ");
cEf(" if(new==2015 && old==2014){return(1);} ");
cEf(" if(new==2078 && old==1998){return(1);} ");
cEf(" if(new==2079 && old==2078){return(1);} ");
cEf(" if(new==2080 && old==2219){return(1);} ");
cEf(" if(new==2081 && old==2080){return(1);} ");
cEf(" if(new==2082 && old==2081){return(1);} ");
cEf(" if(new==2083 && old==2079){return(1);} ");
cEf(" if(new==2084 && old==2082){return(1);} ");
cEf(" if(new==2085 && old==2106){return(1);} ");
cEf(" if(new==2104 && old==2101){return(1);} ");
cEf(" if(new==2105 && old==2103){return(1);} ");
cEf(" if(new==2106 && old==168){return(1);} ");
cEf(" if(new==2218 && old==2217){return(1);} ");
cEf(" if(new==2226 && old==2225){return(1);} ");
cEf(" if(new==2311 && old==2412){return(1);} ");
cEf(" if(new==2312 && old==2314){return(1);} ");
cEf(" if(new==2316 && old==2315){return(1);} ");
cEf(" if(new==2320 && old==2321){return(1);} ");
cEf(" if(new==2329 && old==1969){return(1);} ");
cEf(" if(new==2378 && old==2376){return(1);} ");
cEf(" if(new==2380 && old==2375){return(1);} ");
cEf(" if(new==2381 && old==2377){return(1);} ");
cEf(" if(new==2382 && old==2378){return(1);} ");
cEf(" if(new==2383 && old==2380){return(1);} ");
cEf(" if(new==2384 && old==2379){return(1);} ");
cEf(" if(new==2413 && old==2414){return(1);} ");
cEf(" if(new==2498 && old==2497){return(1);} ");
cEf(" if(new==2499 && old==2498){return(1);} ");
	cEf(" return(0); ");
	cEf(" } ");

	cEf(" void loadadvancedimprovarrays(int wtv=-1){ ");
if(true){
ATT(1485,2217);
ATT(1485,2218);
ATT(1485,2101);
ATT(1485,2104);
ATT(1485,2102);
ATT(1485,168);
ATT(1485,2103);
ATT(1485,2105);
ATT(1485,2414);
ATT(1485,2413);
ATT(1485,2359);
ATT(1485,293);
ATT(1485,449);
ATT(1485,1386);
ATT(1485,260);
ATT(1485,264);
ATT(1485,410);
ATT(1485,409);
ATT(1485,381);
ATT(1485,1385);
ATT(1485,1384);
ATT(1581,1741);
ATT(1581,259);
ATT(286,261);
ATT(285,262);
ATT(286,263);
ATT(319,265);
ATT(304,266);
ATT(304,267);
ATT(306,268);
ATT(308,269);
ATT(308,270);
ATT(307,271);
ATT(313,407);
ATT(313,272);
ATT(312,273);
ATT(350,274);
ATT(314,275);
ATT(303,277);
ATT(1579,278);
ATT(303,278);
ATT(361,278);
ATT(353,278);
ATT(357,278);
ATT(755,278);
ATT(330,278);
ATT(319,278);
ATT(739,278);
ATT(705,278);
ATT(757,278);
ATT(745,278);
ATT(873,278);
ATT(1338,278);
ATT(986,278);
ATT(896,278);
ATT(1235,278);
ATT(1578,279);
ATT(1541,280);
ATT(1534,281);
ATT(1534,282);
ATT(1482,283);
ATT(1578,284);
ATT(286,285);
ATT(340,285);
ATT(313,285);
ATT(372,285);
ATT(763,285);
ATT(898,285);
ATT(1076,285);
ATT(1248,285);
ATT(312,286);
ATT(347,286);
ATT(354,286);
ATT(387,286);
ATT(335,286);
ATT(355,286);
ATT(516,286);
ATT(706,286);
ATT(746,286);
ATT(730,286);
ATT(736,286);
ATT(872,286);
ATT(871,286);
ATT(1534,287);
ATT(1534,288);
ATT(294,288);
ATT(297,288);
ATT(391,288);
ATT(429,288);
ATT(332,288);
ATT(1043,288);
ATT(713,288);
ATT(754,288);
ATT(1651,288);
ATT(309,289);
ATT(310,290);
ATT(318,291);
ATT(1463,292);
ATT(1518,294);
ATT(1485,295);
ATT(1485,296);
ATT(1485,297);
ATT(1485,298);
ATT(1485,299);
ATT(1517,300);
ATT(1517,-857);
ATT(312,303);
ATT(320,304);
ATT(1485,306);
ATT(1465,306);
ATT(1483,307);
ATT(1483,308);
ATT(1540,308);
ATT(1485,309);
ATT(1586,309);
ATT(323,550);
ATT(324,550);
ATT(323,310);
ATT(324,310);
ATT(325,553);
ATT(876,553);
ATT(325,311);
ATT(876,311);
ATT(1465,312);
ATT(330,313);
ATT(1578,314);
ATT(1484,314);
ATT(296,315);
ATT(332,315);
ATT(391,315);
ATT(330,560);
ATT(330,317);
ATT(331,556);
ATT(336,556);
ATT(331,318);
ATT(336,318);
ATT(334,320);
ATT(334,319);
ATT(286,325);
ATT(1482,326);
ATT(340,327);
ATT(340,328);
ATT(313,331);
ATT(312,332);
ATT(308,333);
ATT(344,334);
ATT(1580,335);
ATT(352,336);
ATT(302,338);
ATT(346,339);
ATT(306,340);
ATT(1465,341);
ATT(338,342);
ATT(1479,342);
ATT(346,343);
ATT(347,344);
ATT(314,345);
ATT(303,346);
ATT(308,347);
ATT(284,348);
ATT(1482,351);
ATT(351,352);
ATT(352,353);
ATT(307,354);
ATT(313,355);
ATT(353,551);
ATT(579,551);
ATT(880,551);
ATT(353,356);
ATT(880,356);
ATT(579,356);
ATT(354,552);
ATT(871,552);
ATT(354,357);
ATT(871,357);
ATT(355,554);
ATT(872,554);
ATT(355,358);
ATT(872,358);
ATT(357,555);
ATT(356,555);
ATT(357,359);
ATT(356,359);
ATT(358,558);
ATT(869,558);
ATT(358,360);
ATT(869,360);
ATT(360,557);
ATT(360,361);
ATT(361,561);
ATT(873,561);
ATT(361,362);
ATT(873,362);
ATT(1484,363);
ATT(1581,364);
ATT(1484,365);
ATT(355,366);
ATT(1482,367);
ATT(1483,368);
ATT(1482,368);
ATT(1540,368);
ATT(1579,369);
ATT(1485,370);
ATT(1484,371);
ATT(1586,372);
ATT(1586,373);
ATT(1586,377);
ATT(417,378);
ATT(1485,379);
ATT(461,382);
ATT(434,383);
ATT(716,383);
ATT(287,383);
ATT(919,383);
ATT(297,383);
ATT(391,384);
ATT(1534,385);
ATT(1482,385);
ATT(1483,385);
ATT(1540,385);
ATT(1485,386);
ATT(1485,388);
ATT(285,403);
ATT(285,390);
ATT(359,392);
ATT(344,393);
ATT(344,394);
ATT(302,395);
ATT(1609,397);
ATT(1609,398);
ATT(1609,399);
ATT(511,400);
ATT(304,401);
ATT(319,404);
ATT(391,406);
ATT(1482,408);
ATT(1485,411);
ATT(286,413);
ATT(1483,414);
ATT(1540,414);
ATT(1541,415);
ATT(348,416);
ATT(348,417);
ATT(348,418);
ATT(1548,420);
ATT(335,426);
ATT(335,427);
ATT(429,428);
ATT(429,429);
ATT(332,445);
ATT(332,444);
ATT(1484,447);
ATT(1579,447);
ATT(1485,448);
ATT(1485,450);
ATT(313,452);
ATT(346,453);
ATT(308,454);
ATT(314,455);
ATT(306,456);
ATT(286,457);
ATT(320,458);
ATT(307,459);
ATT(312,460);
ATT(314,461);
ATT(313,462);
ATT(306,463);
ATT(308,464);
ATT(286,465);
ATT(304,466);
ATT(312,467);
ATT(308,468);
ATT(286,469);
ATT(313,470);
ATT(340,471);
ATT(347,472);
ATT(319,473);
ATT(344,474);
ATT(334,475);
ATT(351,476);
ATT(350,477);
ATT(307,478);
ATT(310,479);
ATT(309,480);
ATT(318,481);
ATT(341,482);
ATT(345,497);
ATT(345,483);
ATT(441,485);
ATT(349,494);
ATT(511,495);
ATT(335,496);
ATT(323,499);
ATT(324,499);
ATT(353,500);
ATT(880,500);
ATT(579,500);
ATT(1465,503);
ATT(1480,504);
ATT(1485,506);
ATT(1480,507);
ATT(1581,509);
ATT(359,559);
ATT(577,559);
ATT(874,559);
ATT(359,513);
ATT(874,513);
ATT(577,513);
ATT(516,514);
ATT(516,981);
ATT(516,515);
ATT(284,1077);
ATT(284,517);
ATT(284,1078);
ATT(284,518);
ATT(1485,519);
ATT(1485,520);
ATT(1586,520);
ATT(338,520);
ATT(292,549);
ATT(1518,-562);
ATT(1548,563);
ATT(301,564);
ATT(338,568);
ATT(1465,570);
ATT(577,571);
ATT(579,572);
ATT(1480,573);
ATT(1581,574);
ATT(1463,575);
ATT(1480,576);
ATT(380,576);
ATT(1579,-577);
ATT(1547,578);
ATT(1485,599);
ATT(305,605);
ATT(300,606);
ATT(318,609);
ATT(294,611);
ATT(1485,612);
ATT(308,614);
ATT(352,614);
ATT(285,615);
ATT(302,615);
ATT(352,616);
ATT(308,616);
ATT(332,617);
ATT(429,617);
ATT(713,617);
ATT(1043,617);
ATT(1485,619);
ATT(1485,620);
ATT(1485,-621);
ATT(1485,622);
ATT(1485,623);
ATT(1642,623);
ATT(1482,624);
ATT(1483,625);
ATT(1485,626);
ATT(1485,627);
ATT(1485,628);
ATT(1584,629);
ATT(302,630);
ATT(285,631);
ATT(352,632);
ATT(1480,633);
ATT(1581,634);
ATT(1483,635);
ATT(1534,636);
ATT(379,637);
ATT(517,637);
ATT(509,638);
ATT(319,640);
ATT(286,641);
ATT(313,641);
ATT(308,642);
ATT(314,642);
ATT(314,643);
ATT(308,643);
ATT(308,644);
ATT(314,644);
ATT(1480,645);
ATT(1485,646);
ATT(1485,647);
ATT(1485,648);
ATT(1485,649);
ATT(1485,650);
ATT(287,651);
ATT(1485,652);
ATT(1586,653);
ATT(297,654);
ATT(1464,654);
ATT(932,654);
ATT(1485,655);
ATT(1485,656);
ATT(302,657);
ATT(1480,659);
ATT(1480,677);
ATT(304,678);
ATT(350,678);
ATT(1483,679);
ATT(1480,680);
ATT(335,681);
ATT(334,681);
ATT(351,681);
ATT(285,682);
ATT(302,682);
ATT(1548,724);
ATT(296,-739);
ATT(332,-739);
ATT(713,-739);
ATT(926,-739);
ATT(927,-739);
ATT(931,-739);
ATT(303,743);
ATT(312,743);
ATT(1578,-744);
ATT(1484,-744);
ATT(1541,-753);
ATT(744,-753);
ATT(308,754);
ATT(320,754);
ATT(1581,-757);
ATT(298,-764);
ATT(715,-764);
ATT(754,-764);
ATT(926,-764);
ATT(923,-764);
ATT(921,-764);
ATT(285,765);
ATT(344,765);
ATT(344,766);
ATT(285,766);
ATT(344,767);
ATT(285,767);
ATT(1541,-775);
ATT(1549,-775);
ATT(1540,-775);
ATT(350,776);
ATT(304,776);
ATT(1485,-780);
ATT(1485,-781);
ATT(335,786);
ATT(1483,-801);
ATT(1540,-801);
ATT(296,-802);
ATT(332,-802);
ATT(754,-802);
ATT(713,-802);
ATT(926,-802);
ATT(931,-802);
ATT(927,-802);
ATT(286,809);
ATT(313,809);
ATT(286,-810);
ATT(313,-810);
ATT(1277,-810);
ATT(898,-810);
ATT(1558,-810);
ATT(1076,-810);
ATT(1040,-810);
ATT(1248,-810);
ATT(293,-815);
ATT(509,-815);
ATT(673,-815);
ATT(672,-815);
ATT(867,-815);
ATT(720,-815);
ATT(929,-815);
ATT(925,-815);
ATT(971,-815);
ATT(1485,-816);
ATT(1464,817);
ATT(1533,-818);
ATT(1480,819);
ATT(340,824);
ATT(1483,-825);
ATT(516,831);
ATT(313,831);
ATT(1534,-832);
ATT(516,-832);
ATT(313,-832);
ATT(1534,833);
ATT(516,833);
ATT(313,833);
ATT(292,-836);
ATT(516,839);
ATT(313,839);
ATT(710,839);
ATT(709,839);
ATT(772,839);
ATT(930,839);
ATT(1534,839);
ATT(1586,-841);
ATT(1578,-848);
ATT(347,849);
ATT(286,849);
ATT(347,850);
ATT(286,850);
ATT(314,853);
ATT(308,853);
ATT(1534,-855);
ATT(516,-855);
ATT(313,-855);
ATT(1548,856);
ATT(429,-861);
ATT(332,-861);
ATT(713,-861);
ATT(1043,-861);
ATT(1483,864);
ATT(1480,865);
ATT(294,865);
ATT(285,868);
ATT(306,868);
ATT(312,868);
ATT(1482,-869);
ATT(306,870);
ATT(285,870);
ATT(312,870);
ATT(1483,875);
ATT(318,-876);
ATT(1285,-876);
ATT(916,-876);
ATT(1228,-876);
ATT(338,877);
ATT(338,878);
ATT(1485,-879);
ATT(434,-882);
ATT(314,-883);
ATT(346,-883);
ATT(307,-883);
ATT(742,-883);
ATT(708,-883);
ATT(895,-883);
ATT(903,-883);
ATT(297,-884);
ATT(311,-885);
ATT(425,-885);
ATT(404,-885);
ATT(832,-885);
ATT(1482,-886);
ATT(1548,-887);
ATT(312,-888);
ATT(347,-888);
ATT(335,-888);
ATT(319,-888);
ATT(706,-888);
ATT(746,-888);
ATT(745,-888);
ATT(961,-888);
ATT(896,-888);
ATT(301,-889);
ATT(487,-889);
ATT(743,-889);
ATT(920,-889);
ATT(1485,-890);
ATT(294,-893);
ATT(292,988);
ATT(292,919);
ATT(1581,921);
ATT(1465,922);
ATT(300,923);
ATT(1482,925);
ATT(1483,926);
ATT(287,928);
ATT(417,930);
ATT(297,931);
ATT(1586,936);
ATT(1586,937);
ATT(1485,938);
ATT(1485,939);
ATT(1480,-940);
ATT(1577,-940);
ATT(1590,-940);
ATT(285,941);
ATT(319,941);
ATT(303,941);
ATT(705,941);
ATT(739,941);
ATT(745,941);
ATT(896,941);
ATT(1485,942);
ATT(1485,943);
ATT(1485,944);
ATT(1485,945);
ATT(1485,946);
ATT(1485,947);
ATT(1485,948);
ATT(1485,949);
ATT(1485,950);
ATT(1485,951);
ATT(1485,952);
ATT(440,952);
ATT(667,952);
ATT(669,952);
ATT(668,952);
ATT(1548,957);
ATT(443,959);
ATT(289,959);
ATT(441,959);
ATT(511,959);
ATT(1581,-962);
ATT(510,964);
ATT(332,991);
ATT(1483,997);
ATT(303,1000);
ATT(312,1000);
ATT(312,1001);
ATT(305,1005);
ATT(341,1005);
ATT(349,1005);
ATT(348,1005);
ATT(332,1006);
ATT(335,1006);
ATT(318,1007);
ATT(1482,1009);
ATT(379,1012);
ATT(1581,1012);
ATT(312,1012);
ATT(443,1013);
ATT(429,-1018);
ATT(340,1021);
ATT(315,1023);
ATT(1109,1023);
ATT(1518,1024);
ATT(338,1027);
ATT(511,-1028);
ATT(1485,1030);
ATT(509,1031);
ATT(284,1031);
ATT(1465,-1038);
ATT(352,1039);
ATT(294,1040);
ATT(294,1043);
ATT(297,1046);
ATT(332,1055);
ATT(1483,1057);
ATT(304,1059);
ATT(672,1068);
ATT(1549,1069);
ATT(287,1071);
ATT(391,1073);
ATT(284,1079);
ATT(340,1102);
ATT(705,1107);
ATT(704,1108);
ATT(709,1109);
ATT(710,1110);
ATT(707,1111);
ATT(708,1112);
ATT(706,1113);
ATT(705,1114);
ATT(707,1115);
ATT(704,1116);
ATT(711,1117);
ATT(711,1118);
ATT(705,1119);
ATT(707,1120);
ATT(709,1121);
ATT(710,1122);
ATT(708,1123);
ATT(706,1124);
ATT(704,1125);
ATT(713,1127);
ATT(713,1126);
ATT(704,1128);
ATT(705,1128);
ATT(706,1128);
ATT(707,1130);
ATT(708,1130);
ATT(1483,1139);
ATT(710,1140);
ATT(709,1140);
ATT(711,1140);
ATT(760,1142);
ATT(741,1143);
ATT(707,1186);
ATT(708,1186);
ATT(1483,1187);
ATT(1482,1188);
ATT(1482,1189);
ATT(1482,1190);
ATT(716,1193);
ATT(739,1206);
ATT(739,1203);
ATT(739,1204);
ATT(738,1205);
ATT(738,1207);
ATT(742,1208);
ATT(745,1211);
ATT(744,1212);
ATT(745,1213);
ATT(744,1214);
ATT(294,1216);
ATT(705,1217);
ATT(704,1217);
ATT(706,1217);
ATT(1485,1218);
ATT(720,1219);
ATT(713,1220);
ATT(717,1223);
ATT(717,-1224);
ATT(750,-1224);
ATT(464,1236);
ATT(712,1236);
ATT(760,1237);
ATT(419,1237);
ATT(741,1238);
ATT(473,1238);
ATT(712,1239);
ATT(1482,-1251);
ATT(710,1255);
ATT(711,1255);
ATT(709,1255);
ATT(711,1256);
ATT(710,1256);
ATT(709,1256);
ATT(746,1257);
ATT(758,1262);
ATT(758,1258);
ATT(755,1259);
ATT(757,1260);
ATT(756,1261);
ATT(744,1263);
ATT(758,1264);
ATT(745,1265);
ATT(757,1266);
ATT(755,1267);
ATT(756,1268);
ATT(744,1276);
ATT(745,1284);
ATT(744,1284);
ATT(758,1284);
ATT(757,1295);
ATT(755,1295);
ATT(756,1295);
ATT(757,1296);
ATT(755,1296);
ATT(759,1296);
ATT(756,1296);
ATT(757,1297);
ATT(755,1297);
ATT(759,1297);
ATT(756,1297);
ATT(757,1298);
ATT(755,1298);
ATT(756,1298);
ATT(759,1298);
ATT(754,1303);
ATT(713,1303);
ATT(754,1304);
ATT(754,1305);
ATT(1548,1306);
ATT(315,-1307);
ATT(1109,-1307);
ATT(713,1310);
ATT(733,1311);
ATT(877,1311);
ATT(722,1312);
ATT(870,1312);
ATT(733,1313);
ATT(877,1313);
ATT(722,1314);
ATT(870,1314);
ATT(745,1321);
ATT(744,1322);
ATT(758,1323);
ATT(1485,1324);
ATT(757,1325);
ATT(755,1326);
ATT(759,1327);
ATT(756,1328);
ATT(419,1329);
ATT(1485,-1332);
ATT(1485,1333);
ATT(1485,1334);
ATT(1485,1335);
ATT(1485,-1336);
ATT(730,1337);
ATT(735,1338);
ATT(736,1339);
ATT(732,1340);
ATT(875,1340);
ATT(730,1341);
ATT(735,1342);
ATT(736,1343);
ATT(732,1344);
ATT(875,1344);
ATT(1485,1351);
ATT(1485,1352);
ATT(1483,1366);
ATT(1483,1367);
ATT(1483,1368);
ATT(767,1379);
ATT(1485,1380);
ATT(1485,1381);
ATT(1485,1382);
ATT(1485,1387);
ATT(1485,1388);
ATT(1485,1383);
ATT(1485,1389);
ATT(741,1392);
ATT(1581,1399);
ATT(768,1408);
ATT(767,1410);
ATT(766,1415);
ATT(742,1416);
ATT(746,1417);
ATT(760,1421);
ATT(1485,1424);
ATT(1586,1424);
ATT(1485,1425);
ATT(1518,1425);
ATT(787,1426);
ATT(787,1427);
ATT(1579,1476);
ATT(1485,1477);
ATT(1483,1479);
ATT(1586,1481);
ATT(733,1482);
ATT(732,1484);
ATT(875,1484);
ATT(1483,1485);
ATT(1534,1485);
ATT(1482,1485);
ATT(1540,1485);
ATT(1485,1486);
ATT(735,1487);
ATT(773,1488);
ATT(773,1489);
ATT(730,1490);
ATT(1485,1492);
ATT(1485,1493);
ATT(1586,1493);
ATT(1518,1494);
ATT(1535,1495);
ATT(1463,1496);
ATT(766,1497);
ATT(1579,1499);
ATT(1482,1501);
ATT(1485,1507);
ATT(766,1508);
ATT(766,1509);
ATT(768,1510);
ATT(766,1511);
ATT(768,1512);
ATT(742,1513);
ATT(738,1514);
ATT(746,1515);
ATT(1548,1516);
ATT(1548,1517);
ATT(739,1526);
ATT(738,1526);
ATT(746,1526);
ATT(337,1529);
ATT(743,1541);
ATT(743,1542);
ATT(1483,1557);
ATT(742,1558);
ATT(746,1558);
ATT(713,1573);
ATT(827,1578);
ATT(827,1579);
ATT(827,1580);
ATT(391,1589);
ATT(391,1592);
ATT(813,1605);
ATT(424,1606);
ATT(424,1607);
ATT(813,1608);
ATT(468,1609);
ATT(716,1609);
ATT(468,1610);
ATT(855,1611);
ATT(829,1614);
ATT(829,1615);
ATT(313,1616);
ATT(310,1625);
ATT(305,1625);
ATT(842,1625);
ATT(309,1625);
ATT(332,1626);
ATT(391,1626);
ATT(1517,1626);
ATT(294,1626);
ATT(314,1627);
ATT(1549,1628);
ATT(1485,1629);
ATT(1586,1629);
ATT(287,1630);
ATT(417,1630);
ATT(716,1630);
ATT(468,1630);
ATT(919,1630);
ATT(925,1630);
ATT(924,1630);
ATT(1586,1631);
ATT(318,1634);
ATT(344,1636);
ATT(306,1637);
ATT(1485,-1643);
ATT(824,1650);
ATT(824,1651);
ATT(311,1662);
ATT(404,1662);
ATT(654,1662);
ATT(424,1662);
ATT(725,1662);
ATT(425,1662);
ATT(311,1663);
ATT(404,1663);
ATT(654,1663);
ATT(424,1663);
ATT(725,1663);
ATT(425,1663);
ATT(313,1664);
ATT(814,1675);
ATT(816,1675);
ATT(815,1675);
ATT(817,1675);
ATT(977,1675);
ATT(996,1675);
ATT(1107,1675);
ATT(1035,1675);
ATT(974,1675);
ATT(987,1675);
ATT(1425,1675);
ATT(1427,1675);
ATT(1423,1675);
ATT(1420,1675);
ATT(1419,1675);
ATT(1418,1675);
ATT(1421,1675);
ATT(1426,1675);
ATT(1422,1675);
ATT(404,1679);
ATT(320,1682);
ATT(1548,1684);
ATT(509,1685);
ATT(442,1688);
ATT(292,1696);
ATT(286,1697);
ATT(391,1697);
ATT(443,1700);
ATT(720,1705);
ATT(824,1706);
ATT(716,1709);
ATT(417,1709);
ATT(768,1710);
ATT(744,1712);
ATT(713,1713);
ATT(754,1713);
ATT(739,1715);
ATT(746,1715);
ATT(738,1715);
ATT(745,1720);
ATT(758,1720);
ATT(744,1720);
ATT(1483,1721);
ATT(1483,1728);
ATT(1482,1729);
ATT(741,1731);
ATT(704,1732);
ATT(705,1732);
ATT(710,1732);
ATT(709,1733);
ATT(711,1733);
ATT(710,1733);
ATT(709,1735);
ATT(711,1735);
ATT(710,1735);
ATT(842,1745);
ATT(842,1744);
ATT(925,1748);
ATT(925,1749);
ATT(1556,1750);
ATT(938,1750);
ATT(1556,1751);
ATT(1577,1751);
ATT(1559,1754);
ATT(1561,1755);
ATT(1557,1756);
ATT(1556,1757);
ATT(1559,1759);
ATT(1559,1758);
ATT(1561,1761);
ATT(1557,1762);
ATT(1562,1763);
ATT(1563,1764);
ATT(1561,1766);
ATT(1557,1767);
ATT(1562,1768);
ATT(1563,1769);
ATT(1565,2313);
ATT(1565,1770);
ATT(1590,1771);
ATT(896,1772);
ATT(899,1773);
ATT(898,1774);
ATT(897,1775);
ATT(896,1776);
ATT(898,1777);
ATT(897,1778);
ATT(895,1779);
ATT(896,1780);
ATT(898,1781);
ATT(897,1782);
ATT(895,1783);
ATT(909,1784);
ATT(914,1785);
ATT(909,1786);
ATT(910,1787);
ATT(914,1788);
ATT(915,1789);
ATT(909,1790);
ATT(910,1791);
ATT(914,1792);
ATT(915,1793);
ATT(930,1794);
ATT(930,1795);
ATT(916,1796);
ATT(930,1797);
ATT(916,1798);
ATT(924,1799);
ATT(1485,1802);
ATT(1642,1802);
ATT(1465,1802);
ATT(1485,1806);
ATT(1485,1807);
ATT(1518,1808);
ATT(1460,1808);
ATT(1485,-1809);
ATT(1586,-1809);
ATT(1109,1810);
ATT(1485,1811);
ATT(1485,1812);
ATT(1485,1813);
ATT(1465,1815);
ATT(1485,1816);
ATT(1578,1817);
ATT(1585,1817);
ATT(1582,1818);
ATT(942,1819);
ATT(1485,1820);
ATT(947,1821);
ATT(966,1821);
ATT(1480,1822);
ATT(1485,1823);
ATT(1518,1823);
ATT(1483,1824);
ATT(1540,1824);
ATT(1482,1824);
ATT(944,1825);
ATT(1485,1826);
ATT(1579,1827);
ATT(944,1830);
ATT(969,1830);
ATT(948,1831);
ATT(970,1831);
ATT(945,1832);
ATT(967,1832);
ATT(942,1833);
ATT(968,1833);
ATT(899,1834);
ATT(1070,1834);
ATT(947,1835);
ATT(966,1835);
ATT(945,1836);
ATT(967,1836);
ATT(899,1837);
ATT(1070,1837);
ATT(944,1838);
ATT(969,1838);
ATT(942,1839);
ATT(968,1839);
ATT(948,1840);
ATT(970,1840);
ATT(947,1841);
ATT(966,1841);
ATT(894,1867);
ATT(988,1891);
ATT(915,1891);
ATT(913,1892);
ATT(909,1892);
ATT(910,1893);
ATT(912,1893);
ATT(914,1894);
ATT(913,1894);
ATT(915,1894);
ATT(989,1895);
ATT(909,1895);
ATT(1327,1895);
ATT(1326,1895);
ATT(911,1895);
ATT(926,1897);
ATT(1517,1898);
ATT(920,1900);
ATT(919,1901);
ATT(925,1902);
ATT(972,1902);
ATT(922,1903);
ATT(954,1909);
ATT(1463,-1917);
ATT(1482,1918);
ATT(1570,1919);
ATT(1557,1920);
ATT(1561,1920);
ATT(1569,1921);
ATT(1570,1922);
ATT(1569,1922);
ATT(1646,1922);
ATT(1569,1924);
ATT(1465,-1925);
ATT(1465,1926);
ATT(1464,1931);
ATT(1609,1931);
ATT(896,1940);
ATT(896,1941);
ATT(898,1942);
ATT(898,1943);
ATT(897,1944);
ATT(897,1945);
ATT(894,1946);
ATT(894,1947);
ATT(895,1948);
ATT(895,1949);
ATT(925,2012);
ATT(925,1950);
ATT(1463,1951);
ATT(1485,-1952);
ATT(1043,1953);
ATT(1043,1954);
ATT(1558,1966);
ATT(1558,1968);
ATT(1558,1967);
ATT(925,1969);
ATT(917,1970);
ATT(1564,1972);
ATT(292,1974);
ATT(1485,1975);
ATT(1586,1975);
ATT(1485,1977);
ATT(1069,1980);
ATT(1246,1981);
ATT(1043,1984);
ATT(1485,1985);
ATT(294,1992);
ATT(1551,1994);
ATT(1482,1995);
ATT(1552,1996);
ATT(1485,1998);
ATT(925,1999);
ATT(1548,-2002);
ATT(414,2011);
ATT(521,2011);
ATT(415,2011);
ATT(522,2011);
ATT(416,2011);
ATT(523,2011);
ATT(292,2011);
ATT(894,2013);
ATT(894,2014);
ATT(894,2015);
ATT(1646,2033);
ATT(292,2038);
ATT(1482,2039);
ATT(1483,2040);
ATT(1043,2041);
ATT(1485,2042);
ATT(1043,2043);
ATT(294,2044);
ATT(920,2046);
ATT(919,2047);
ATT(922,2048);
ATT(1552,2049);
ATT(932,2050);
ATT(1464,2050);
ATT(1485,2051);
ATT(1642,2051);
ATT(1465,2051);
ATT(1586,2052);
ATT(1586,2053);
ATT(1109,2054);
ATT(1485,2055);
ATT(1485,2056);
ATT(1485,2057);
ATT(1485,2058);
ATT(1485,2059);
ATT(1485,2060);
ATT(1485,2061);
ATT(1485,2062);
ATT(1548,2066);
ATT(1485,2078);
ATT(1485,2079);
ATT(1485,2219);
ATT(1485,2080);
ATT(1485,2081);
ATT(1485,2082);
ATT(1485,2083);
ATT(1485,2084);
ATT(1586,2084);
ATT(1485,2106);
ATT(1485,2085);
ATT(946,2091);
ATT(1518,2098);
ATT(1109,2137);
ATT(441,2142);
ATT(1564,2226);
ATT(1564,2225);
ATT(1463,2239);
ATT(926,2264);
ATT(1534,2265);
ATT(930,2265);
ATT(1485,2283);
ATT(1577,2299);
ATT(1052,2300);
ATT(918,2301);
ATT(1075,2302);
ATT(1646,2303);
ATT(1646,2304);
ATT(1646,2305);
ATT(1569,2305);
ATT(1590,2306);
ATT(1590,2307);
ATT(1590,2308);
ATT(1556,2310);
ATT(1577,2310);
ATT(1285,2412);
ATT(1285,2311);
ATT(1284,2314);
ATT(1284,2312);
ATT(1043,2315);
ATT(1043,2316);
ATT(1651,2321);
ATT(1651,2320);
ATT(1109,2322);
ATT(1284,2327);
ATT(1284,2328);
ATT(925,2329);
ATT(1609,2347);
ATT(1548,2348);
ATT(1548,2349);
ATT(1043,2350);
ATT(1043,2351);
ATT(1105,2353);
ATT(294,2363);
ATT(911,2375);
ATT(913,2376);
ATT(988,2377);
ATT(913,2378);
ATT(912,2379);
ATT(911,2380);
ATT(988,2381);
ATT(913,2382);
ATT(911,2383);
ATT(912,2384);
ATT(1568,2396);
ATT(1359,2409);
ATT(1485,2410);
ATT(1485,2411);
ATT(1047,2426);
ATT(1130,2427);
ATT(922,2431);
ATT(922,2432);
ATT(1551,2433);
ATT(287,2438);
ATT(417,2438);
ATT(919,2438);
ATT(925,2438);
ATT(924,2438);
ATT(468,2438);
ATT(716,2438);
ATT(1568,2439);
ATT(961,2440);
ATT(516,-2441);
ATT(313,-2441);
ATT(710,-2441);
ATT(709,-2441);
ATT(772,-2441);
ATT(930,-2441);
ATT(1534,-2441);
ATT(332,-2442);
ATT(713,-2442);
ATT(296,-2442);
ATT(926,-2442);
ATT(927,-2442);
ATT(931,-2442);
ATT(921,-2442);
ATT(715,-2442);
ATT(298,-2442);
ATT(754,-2442);
ATT(923,-2442);
ATT(925,2443);
ATT(1463,2445);
ATT(912,2446);
ATT(988,2446);
ATT(911,2446);
ATT(914,2446);
ATT(909,2447);
ATT(910,2447);
ATT(672,-2448);
ATT(925,-2448);
ATT(971,-2448);
ATT(720,-2448);
ATT(929,-2448);
ATT(867,-2448);
ATT(673,-2448);
ATT(509,-2448);
ATT(919,2449);
ATT(1581,2453);
ATT(1581,2454);
ATT(1581,2455);
ATT(1581,2456);
ATT(1581,2457);
ATT(1581,2458);
ATT(1558,2463);
ATT(1561,2463);
ATT(1575,2463);
ATT(511,2468);
ATT(1463,2471);
ATT(1285,2481);
ATT(1569,2485);
ATT(920,2491);
ATT(920,2492);
ATT(920,2493);
ATT(1548,2494);
ATT(814,2496);
ATT(816,2496);
ATT(815,2496);
ATT(817,2496);
ATT(977,2496);
ATT(996,2496);
ATT(1107,2496);
ATT(1035,2496);
ATT(974,2496);
ATT(987,2496);
ATT(1427,2496);
ATT(1425,2496);
ATT(1426,2496);
ATT(1422,2496);
ATT(1421,2496);
ATT(1423,2496);
ATT(1420,2496);
ATT(1419,2496);
ATT(1418,2496);
ATT(1575,2497);
ATT(1575,2498);
ATT(1575,2499);
ATT(713,2519);
ATT(332,2519);
ATT(429,2519);
ATT(1043,2519);
ATT(1586,2520);
ATT(1465,2521);
ATT(1485,2522);
ATT(1485,2523);
ATT(1551,2525);
ATT(1534,2532);
ATT(930,2532);
ATT(1534,2533);
ATT(930,2533);
ATT(1581,2534);
ATT(927,2392);
ATT(923,2392);
ATT(920,2392);
ATT(922,2392);
ATT(1568,2392);
ATT(1043,2392);
ATT(292,2392);
ATT(1043,2393);
ATT(813,1554);
ATT(920,1554);
ATT(813,1555);
ATT(920,1555);
ATT(813,1543);
ATT(920,1543);
ATT(813,1556);
ATT(920,1556);
ATT(813,2487);
ATT(920,2487);
ATT(813,2488);
ATT(920,2488);
ATT(813,193);
ATT(813,2406);
ATT(920,2406);
ATT(813,2405);
ATT(920,2405);
ATT(813,2404);
ATT(920,2404);
ATT(813,1544);
ATT(920,1544);
ATT(813,1559);
ATT(920,1559);
ATT(813,1552);
ATT(920,1552);
ATT(813,1551);
ATT(920,1551);
ATT(813,1550);
ATT(920,1550);
ATT(813,1549);
ATT(920,1549);
ATT(813,1548);
ATT(920,1548);
ATT(813,1547);
ATT(920,1547);
ATT(813,1553);
ATT(920,1553);
ATT(813,1545);
ATT(920,1545);
ATT(813,1546);
ATT(920,1546);
ATT(813,1560);
ATT(920,1560);
ATT(813,1562);
ATT(920,1562);
ATT(813,1561);
ATT(920,1561);
ATT(813,2401);
ATT(920,2401);
ATT(813,1743);
ATT(920,1743);
ATT(813,2402);
ATT(920,2402);
ATT(813,2403);
ATT(920,2403);
ATT(813,2486);
ATT(920,2486);
ATT(297,2489);
ATT(297,2490);
}
//Consulate stuff. Note: Until consulate logic can be processed to determine current alliance, this is not to be used.
/*
ATT(-1,-1,"AbstractVillager", "ypBigConsulateBritish");
ATT(-1,-1,"AbstractInfantry", "ypBigConsulateBritish");
ATT(-1,-1,"AbstractCavalry", "ypBigConsulateBritish");
ATT(-1,-1,"AbstractArtillery", "ypBigConsulateBritish");
ATT(-1,-1,"Building", "ypBigConsulatePortuguese");
ATT(-1,-1,"AbstractVillager", "ypBigConsulateRussians");
ATT(-1,-1,"AbstractVillager", "ypBigConsulateFrench");
ATT(-1,-1,"AbstractWagon", "ypBigConsulateFrench");
ATT(-1,-1,"AbstractFishingBoat", "ypBigConsulateFrench");
ATT(-1,-1,"AbstractArtillery", "ypBigConsulateOttomans");
ATT(-1,-1,"Building", "ypBigConsulateOttomans");
ATT(-1,-1,"AbstractVillager", "ypBigConsulateOttomans");
ATT(-1,-1,"AbstractCavalry", "ypBigConsulateOttomans");
ATT(-1,-1,"AbstractInfantry", "ypBigConsulateOttomans");
ATT(-1,-1,"ypWarAcademy", "ypBigConsulateGermans");
ATT(-1,-1,"FortFrontier", "ypBigConsulateGermans");
ATT(-1,-1,"ypCastle", "ypBigConsulateGermans");
ATT(-1,-1,"AbstractInfantry", "ypBigConsulateJapanese");
ATT(-1,-1,"AbstractCavalry", "ypBigConsulateJapanese");
ATT(-1,-1,"AbstractArtillery", "ypBigConsulateJapanese");
ATT(-1,-1,"AbstractVillager", "ypBigConsulateJapanese");
*/
	cEf(" } ");

	cEf(" void loadadvancedremovarrays(int wtv=-1){ ");
ATTR(767,385);
ATTR(759,385);
ATTR(759,624);
ATTR(767,625);
ATTR(833,839);
ATTR(767,1479);
ATTR(917,1951);
ATTR(1556,1951);
ATTR(833,2441);
ATTR(1586,168);
ATTR(1586,260);
ATTR(1586,264);
ATTR(1586,293);
ATTR(1586,295);
ATTR(1586,296);
ATTR(1586,297);
ATTR(1586,298);
ATTR(1586,379);
ATTR(1586,386);
ATTR(1586,388);
ATTR(1586,409);
ATTR(1586,410);
ATTR(1586,411);
ATTR(1586,448);
ATTR(1586,449);
ATTR(1586,450);
ATTR(1586,506);
ATTR(1586,519);
ATTR(1586,599);
ATTR(1586,619);
ATTR(1586,620);
ATTR(1586,621);
ATTR(1586,626);
ATTR(1586,627);
ATTR(1586,628);
ATTR(1586,646);
ATTR(1586,647);
ATTR(1586,648);
ATTR(1586,649);
ATTR(1586,650);
ATTR(1586,652);
ATTR(1586,655);
ATTR(1586,656);
ATTR(1586,780);
ATTR(1586,781);
ATTR(1586,816);
ATTR(1586,879);
ATTR(1586,890);
ATTR(1586,938);
ATTR(1586,939);
ATTR(1586,942);
ATTR(1586,943);
ATTR(1586,944);
ATTR(1586,945);
ATTR(1586,946);
ATTR(1586,947);
ATTR(1586,949);
ATTR(1586,950);
ATTR(1586,951);
ATTR(1586,1030);
ATTR(1586,1324);
ATTR(1586,1332);
ATTR(1586,1333);
ATTR(1586,1334);
ATTR(1586,1335);
ATTR(1586,1336);
ATTR(1586,1351);
ATTR(1586,1352);
ATTR(1586,1380);
ATTR(1586,1381);
ATTR(1586,1382);
ATTR(1586,1384);
ATTR(1586,1385);
ATTR(1586,1386);
ATTR(1586,1387);
ATTR(1586,1388);
ATTR(1586,1389);
ATTR(1586,1477);
ATTR(1586,1486);
ATTR(1586,1492);
ATTR(1586,1507);
ATTR(1586,1806);
ATTR(1586,1807);
ATTR(1586,1811);
ATTR(1586,1816);
ATTR(1586,1820);
ATTR(1586,1826);
ATTR(1586,1977);
ATTR(1586,1985);
ATTR(1586,1998);
ATTR(1586,2055);
ATTR(1586,2056);
ATTR(1586,2057);
ATTR(1586,2058);
ATTR(1586,2059);
ATTR(1586,2060);
ATTR(1586,2061);
ATTR(1586,2062);
ATTR(1586,2078);
ATTR(1586,2079);
ATTR(1586,2080);
ATTR(1586,2081);
ATTR(1586,2082);
ATTR(1586,2083);
ATTR(1586,2085);
ATTR(1586,2101);
ATTR(1586,2102);
ATTR(1586,2103);
ATTR(1586,2104);
ATTR(1586,2105);
ATTR(1586,2106);
ATTR(1586,2217);
ATTR(1586,2218);
ATTR(1586,2219);
ATTR(1586,2283);
ATTR(1586,2410);
ATTR(1586,2411);
ATTR(1586,2413);
ATTR(1586,2414);
ATTR(1586,2522);
ATTR(1586,2523);
ATTR(1552,1926);
	cEf(" } ");

	cEf(" void togglegperr(int wtv=-1){ ");
	cEf(" showGperR=-1*showGperR; ");
	cEf(" } ");

	cEf(" void turnongperr(int wtv=-1){ ");
	cEf(" showGperR=1; ");
	cEf(" } ");
	
	cEf(" void turnoffgperr(int wtv=-1){ ");
	cEf(" showGperR=-1; ");
	cEf(" } ");

	cEf(" void togglepopg(int wtv=-1){ ");
	cEf(" showPopGraphic=-1*showPopGraphic; gadgetToggle(\"messageWindow\"); ");
	cEf(" } ");

	cEf(" void toggleadjusteco(int wtv=-1){ ");
	cEf(" adjustecopop=-1*adjustecopop; ");
	cEf(" } ");
	
	cEf(" void toggledebugmode(int wtv=-1){ ");
	cEf(" debugmode=-1*debugmode; ");
	cEf(" } ");
	
	cEf(" void togglefog(int wtv=-1){ ");
	cEf(" justfogoff=-1*justfogoff; ");
	cEf(" if(justfogoff==1){trSetFogAndBlackmap(true,true);}else{trSetFogAndBlackmap(false,false);} ");
	cEf(" } ");

	cEf(" int getSUid(int wtv=-1){ ");
	cEf(" int result=-1; ");
	
	cEf(" int todaysquery=0; int querysize=0; ");

	cEf(" for(p=0;<="+cNumNonObsPlayers+"){ ");
	cEf(" xsSetContextPlayer(p); kbLookAtAllUnitsOnMap(); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"LockOn\"+p); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, p, true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, UTcorrect(1509)); "); //All
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(i=0;<querysize){ ");
	cEf(" trUnitSelectClear();trUnitSelectByID(kbUnitQueryGetResult(todaysquery,i)); ");
	cEf(" if(trUnitIsSelected()){result=kbUnitQueryGetResult(todaysquery,i);break;} ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" } ");
	
	cEf(" return(result); ");
	cEf(" } ");
	
	cEf(" void togglecameralockonunit(int wtv=-1){ ");
	cEf(" int utid=-1; cameralockonunit=-1*cameralockonunit; ");
	cEf(" if(cameralockonunit==1){ ");
	cEf(" utid=getSUid(); ");
	cEf(" if(utid>-1){ ");
	cEf(" trUnitSelectClear(); ");
	cEf(" trUnitSelectByID(utid); ");
	cEf(" cameralockonunitid=utid; ");
	cEf(" trCameraPanWithUnit(true,,-1); ");
	cEf(" trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else{trCameraPanWithUnit(false,,-1); ","} ");
	cEf(" } ");
	
	cEf(" void turnoncameralockonunit(int wtv=-1){ ");
	cEf(" int utid=-1; cameralockonunit=1; ");
	cEf(" utid=getSUid(); ");
	cEf(" if(utid>-1){ ");
	cEf(" trUnitSelectClear(); ");
	cEf(" trUnitSelectByID(utid); ");
	cEf(" cameralockonunitid=utid; ");
	cEf(" trCameraPanWithUnit(true,,-1); ");
	cEf(" trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" } ");
	
	cEf(" void turnoffcameralockonunit(int wtv=-1){ ");
	cEf(" int utid=-1; cameralockonunit=-1; ");
	cEf(" cameralockonunitid=-1; ");
	cEf(" trCameraPanWithUnit(false,,-1); ");
	cEf(" } ");
	
/*	cEf(" void refreshcameralock(int wtv=-1){ ");
	cEf(" if(cameralockonunit==1){ ");
	cEf(" trUnitSelectByID(cameralockonunit); ");
	cEf(" if(trUnitAlive()==false){ ");
	cEf(" cameralockonunit=-1;cameralockonunitid=-1; ");
	cEf(" trCameraPanWithUnit(false,,-1); kat(\"lel it ded\"); ");
	cEf(" } ");
	cEf(" trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" } "); */

	cEf(" int RestrictedUnitCount(int plyr=-1, int utid=-1, int radius=0, int utype=-1){ ");
	cEf(" int result=-1; ");
	cEf(" int todaysquery=0; int querysize=0; ");
	cEf(" xsSetContextPlayer(plyr); kbLookAtAllUnitsOnMap(); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"GenericSearch\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, plyr, true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, utype); ");
	cEf(" kbUnitQuerySetPosition(todaysquery,kbUnitGetPosition(utid)); ");
	cEf(" kbUnitQuerySetMaximumDistance(todaysquery,radius); ");
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" result=querysize; ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" return(result); ");
	cEf(" } ");

	cEf(" string repZ(int numtimes=1, string base=\" \"){ ");
	cEf(" string output=\"\"; ");
	cEf(" for(t=0; <numtimes){output=output+base;} ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" int SPlengthZ(int number=0) { ");
	cEf(" int lt=1; int powa=10; ");
	cEf(" while(powa<=number){powa=powa*10; lt=lt+1;} ");
	cEf(" return(2*lt); ");
	cEf(" } ");

	cEf(" string numAlignZ(int num=0, int maxwidth=4, int alignment=0){ ");
	cEf(" string output=\"\"; ");
	cEf(" if(alignment==0){output=num+repZ(maxwidth-SPlengthZ(num));} ");
	cEf(" else if(alignment==1){output=repZ(maxwidth-SPlengthZ(num))+num;} ");
	cEf(" else if(alignment==2){} ");
	cEf(" else if(alignment==3){output=repZ(maxwidth-4)+num+repZ(4-SPlengthZ(num));} ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" void resourcecircle(int radius=1){ ");
	cEf(" int utid=-1; int count=0; string name=\"\"; string output=\"\"; ");
	cEf(" utid=getSUid(); ");
	cEf(" if(radius<0){output=\"<color=1,1,1><bgcolor=0,0,0,1> Resources left on map: </bgcolor>\";} ");
	cEf(" else{output=\"<color=1,1,1><bgcolor=0,0,0,1> Queried \"+utid+\" within distance of \"+radius+\" m: </bgcolor>\";} ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1542));name=\"Huntable\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1518));name=\"Herdable\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1634));name=\"AbstractFruit\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1594));name=\"Tree\"; "); //Actually Wood
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1612));name=\"AbstractMine\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1643));name=\"AbstractWhale\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" count=RestrictedUnitCount(0,utid,radius,UTcorrect(1644));name=\"AbstractFish\"; ");
	cEf(" output=output+\"\n<bgcolor=0,0,0,1>\"+","numAlignZ(count,9,1)+\"</bgcolor> <bgcolor=0.2,0.2,0.2,0.8> \"+name+\" </bgcolor>\"; ");
	cEf(" kat(output); ");
	cEf(" } ");

	cEf(" int amodb(int a=1, int b=1){ ");
	cEf(" int temp=a/b; temp=a-temp*b; ");
	cEf(" return(temp); ");
	cEf(" } ");

//Max, min functions
	cEf(" int max(int a=-1,int b=-1) { ");
	cEf(" if(a>b){return(a);} ");
	cEf(" return(b); ");
	cEf(" } ");

	cEf(" int min(int a=-1,int b=-1) { ");
	cEf(" if(a<b){return(a);} ");
	cEf(" return(b); ");
	cEf(" } ");

//And one for strings to help with the scoreboard
	cEf(" string strmax(string a=\"\", string b=\"\") { ");
	cEf(" if(a>b){return(a);} ");
	cEf(" return(b); ");
	cEf(" } ");

//Various array functions
	cEf(" void resetstrarray(int i=-1) { ");
	cEf(" int size=xsArrayGetSize(i); ");
	cEf(" for(k=0; <size){xsArraySetString(i,k,\"\");} ");
	cEf(" } ");
	
	cEf(" int sizestrarray(int i=-1) { ");
	cEf(" int size=xsArrayGetSize(i); ");
	cEf(" for(k=0; <size){if(xsArrayGetString(i,k)==\"\"){return(k);}} ");
	cEf(" return(size); ");
	cEf(" } ");

	cEf(" int sizeintarray(int i=-1) { ");
	cEf(" int size=xsArrayGetSize(i); ");
	cEf(" for(k=0; <size){if(xsArrayGetInt(i,k)==-1){return(k);}} ");
	cEf(" return(size); ");
	cEf(" } ");

	cEf(" void arrayaddstr(int i=-1, string add=\"\") { ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetString(i,arrayindex)==\"\"){xsArraySetString(i,arrayindex,add); break;} ");
	cEf(" } ");
	cEf(" } ");
	
	cEf(" void arrayaddarraystr(int i=-1, int j=-1) { ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(j)){ ");
	cEf(" if(xsArrayGetString(j,arrayindex)==\"\"){break;}else{arrayaddstr(i,xsArrayGetString(j,arrayindex));} ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void arraydelstr(int i=-1) { ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetString(i,arrayindex)==\"\"){xsArraySetString(i,arrayindex-1,\"\"); break;} ");
	cEf(" else if((arrayindex+1)==xsArrayGetSize(i)){xsArraySetString(i,arrayindex,\"\"); break;} ");
	cEf(" } ");
	cEf(" } ");

	cEf(" int arraygetstrloc(int i=-1, string search=\"\"){ ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetString(i,arrayindex)==search){return(arrayindex);} ");
	cEf(" } ");
	cEf(" return(-1); ");
	cEf(" } ");

//Gets index of the next blank or \"|\" in the cmd array.
	cEf(" int conplete(int i=0){ ");
	cEf(" string tempchara=\"\"; int output=xsArrayGetSize(CnCMDS); ");
	cEf(" for(z=(i+1);<output){ ");
	cEf(" tempchara=xsArrayGetString(CnCMDS,z); ");
	cEf(" if(tempchara==\"|\" || tempchara==\"\"){return(z);} ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" int char2int(string ipt=\"-1\"){ ");
	cEf(" if(ipt==\"0\"){return(0);} ");
	cEf(" if(ipt==\"1\"){return(1);} ");
	cEf(" if(ipt==\"2\"){return(2);} ");
	cEf(" if(ipt==\"3\"){return(3);} ");
	cEf(" if(ipt==\"4\"){return(4);} ");
	cEf(" if(ipt==\"5\"){return(5);} ");
	cEf(" if(ipt==\"6\"){return(6);} ");
	cEf(" if(ipt==\"7\"){return(7);} ");
	cEf(" if(ipt==\"8\"){return(8);} ");
	cEf(" if(ipt==\"9\"){return(9);} ");
	cEf(" return(-1); ");
	cEf(" } ");
	
	cEf(" int parseint(int arrayid=-1, int from=0, int to=0){ ");
	cEf(" int output=-1; ");
	cEf(" for(arrayindex=from; <=to){ ");
	cEf(" if(arrayindex==from){output=0;} ");
	cEf(" output=output*10+char2int(xsArrayGetString(arrayid,arrayindex)); ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");
	
	cEf(" string parsestr(int arrayid=-1, int from=0, int to=0){ ");
	cEf(" string output=\"\"; ");
	cEf(" for(arrayindex=from; <=to){ ");
	cEf(" output=output+xsArrayGetString(arrayid,arrayindex); ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

//Set default camera
	cEf(" void sdc(int wtv=-1){configSetInt(\"maxZoom\",60);","configSetInt(\"normalZoom\",50);configSetInt(\"minZoom\",29);} ");
//Apply camera position
	cEf(" void acp(int wtv=-1){cameraRotate();cameraRotate();} ");
//Set camera zoom
	cEf(" void scz(float dist=0){configSetInt(\"maxZoom\",dist);","configSetInt(\"normalZoom\",dist);configSetInt(\"minZoom\",dist);} ");

//In future perhaps allow copy paste of functions
	cEf(" void consolecommand(int wtv=-1){ ");
	cEf(" string funcname=\"\"; int OBloc=arraygetstrloc(CnINPT,\"(\"); int CBloc=arraygetstrloc(CnINPT,\")\"); ");
	cEf(" string inputstr=\"\"; string ext=\"\"; int vc=0; ");
	cEf(" int inputint=0; ");
	cEf(" if(OBloc>0 && CBloc<0){arrayaddstr(CnINPT,\")\");CBloc=arraygetstrloc(CnINPT,\")\");} ");
	cEf(" if(OBloc>0 && CBloc>OBloc){ ");
	cEf(" funcname=parsestr(CnINPT,0,OBloc-1); ");
	cEf(" if(funcname==\"camzoom\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);if(InI(inputint,50,300)){scz(inputint);acp();sdc();}","else{kat(\"<bgcolor=0,1,0,0.7><color=1,1,1>Zoom distance must be between 50 and 300.</color></bgcolor>\");}} ");
	cEf(" else if(funcname==\"camnormal\"){sdc();acp();} ");
	cEf(" else if(funcname==\"play\"){if(arraygetstrloc(CnINPT,\".\")==-1){ext=\".mp3\";}inputstr=parsestr(CnINPT,OBloc+1,CBloc-1);","trMusicStop();trFadeOutAllSounds(3);trSoundPlayFN(inputstr+ext);vc=1;} ");
	cEf(" else if(funcname==\"playx\"){if(arraygetstrloc(CnINPT,\".\")==-1){ext=\".mp3\";}inputstr=parsestr(CnINPT,OBloc+1,CBloc-1);","trSoundPlayFN(inputstr+ext);vc=1;} ");
	cEf(" else if(funcname==\"mute\"){trMusicStop();trFadeOutAllSounds(3);} ");
	cEf(" else if(funcname==\"unmute\"){trMusicPlayCurrent();trUnblockAllSounds();} ");
	cEf(" else if(funcname==\"fade\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);if(InI(inputint,0,60))","{trFadeOutAllSounds(inputint);}else{kat(\"<bgcolor=0,1,0,0.7><color=1,1,1>Requires fade time"," between 0 and 60</color></bgcolor>\");}} ");
	cEf(" else if(funcname==\"nexttrack\"){trPlayNextMusicTrack();} ");
//	cEf(" else if(funcname==\"track\"){saveconsolehistory=-1*saveconsolehistory;} ");
	cEf(" else if(funcname==\"fog\"){togglefog();} ");
	cEf(" else if(funcname==\"hcmd1\"){kat(\"%d\");} ");
	cEf(" else if(funcname==\"hcmd2\"){gadgetReal(\"player status\"); modeEnter(\"GameMenu\");} ");
	cEf(" else if(funcname==\"hcmd3\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);","kat(inputint+\"-\"+trTechStatusCheck(1,inputint,0));} ");
	cEf(" else if(funcname==\"fixui\"){ ");
	cEf(" gadgetUnreal(\"uimain-Score-SpecContainer\"); gadgetUnreal(\"victoryDisplay\"); ");
	cEf(" gadgetUnreal(\"unitselectionpanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelNatMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelAsiMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelEurMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"minimapPanel-SpecContainer\"); gadgetUnreal(\"commandpanel2-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SocketPanel2-SpecContainer\"); gadgetUnreal(\"TreasurePanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SocketPanel2-SpecContainer\"); gadgetUnreal(\"TreasurePanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"unitstatpanel3-SpecContainer\"); ");
	cEf(" } ");
	cEf(" else if(funcname==\"unitticker\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);","if(inputint==1){enableunitticker=1;}else{enableunitticker=0;}} ");
	cEf(" else if(funcname==\"lighting\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);if(InI(inputint,0,120))","{uiApplyLightingSet(inputint);}else{kat(\"<bgcolor=0,1,0,0.7><color=1,1,1>Requires index"," between 1 and 120</color></bgcolor>\");}} ");
	cEf(" else if(funcname==\"scrollstep\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);if(InI(inputint,1,100))","{scrollincrement=inputint;}else{kat(\"<bgcolor=0,1,0,0.7><color=1,1,1>Requires a step"," between 1 and 100</color></bgcolor>\");}} ");
	cEf(" else if(funcname==\"rdist\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);resourcecircle(inputint);} ");
	cEf(" else if(funcname==\"sfx\"){inputint=parseint(CnINPT,OBloc+1,CBloc-1);if(InI(inputint,0,5))","{trCameraShake(2,inputint);trSoundPlayFN(\"buildingdeath.wav\");}else{kat(\"<bgcolor=0,1,0,0.7><color=1,1,1>Requires intensity"," between 1 and 5</color></bgcolor>\");}} ");
	cEf(" else if(funcname==\"gpr\"){togglegperr();} ");
	cEf(" else if(funcname==\"rescurrent\"){trackInsert();trackAddWaypoint();trackPlay(-1,10001);} ");
	cEf(" else if(funcname==\"restotal\"){trackInsert();trackAddWaypoint();trackPlay(-1,10002);} ");
	cEf(" else if(funcname==\"resincome\"){trackInsert();trackAddWaypoint();trackPlay(-1,10003);} ");
	cEf(" else if(funcname==\"reslost\"){trackInsert();trackAddWaypoint();trackPlay(-1,10004);} ");
	cEf(" else if(funcname==\"popgraphic\"){togglepopg();} ");
	cEf(" else if(funcname==\"resetcolours\"){resetDefaultPlayerColors();} ");
	cEf(" else if(funcname==\"resetcolors\"){resetDefaultPlayerColors();} ");
	cEf(" if(vc==1 && saveconsolehistory==1){arrayaddstr(CnCMDS,\"|\");arrayaddarraystr(CnCMDS,CnINPT);saveconsolehistory=0;} ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" kat(\"<bgcolor=1,0,0,0.7><color=1,1,1>Invalid function:\n\"+parsestr(CnINPT,0,xsArrayGetSize(CnINPT)-1)","+\"</color></bgcolor>\"); ");
	cEf(" } ");
	cEf(" } ");
/////
//Consolation to be moved around as necessary
//After each add str in yINP, check to see if an autocomplete exists?

	cEf(" string yCPT(int wtv=-1){ ");
	cEf(" string result=\"\"; int bestmatchfinindex=0; int bestmatchlength=0; ");
	cEf(" for(i=0;<sizestrarray(CnCMDS)){ ");
	cEf(" if(xsArrayGetString(CnCMDS,i-1)==\"|\"){ ");
	cEf(" 	for(k=0;<sizestrarray(CnINPT)){ ");
	cEf(" 	if(xsArrayGetString(CnCMDS,i+k)==xsArrayGetString(CnINPT,k))","{if(bestmatchlength<(k+1)){bestmatchfinindex=(i+k);bestmatchlength=k+1;}} ");
	cEf(" 	else{break;} ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" if(sizestrarray(CnINPT)>bestmatchlength || bestmatchlength==0){return(\"\");} ");
	//Otherwise there is something to return so we should return it.
	//cEf(" return(result+bestmatchfinindex+\"|\"+bestmatchlength); ");
	cEf(" for(q=bestmatchfinindex+1;<conplete(bestmatchfinindex)){result=result+xsArrayGetString(CnCMDS,q);} ");
	cEf(" return(result); ");
	cEf(" } ");

	cEf(" void yINP(string add=\"\"){arrayaddstr(CnINPT,add);consoleautocomplete=yCPT();} ");
	cEf(" void yCMD(string add=\"\"){arrayaddstr(CnCMDS,add);} ");

//note commands are NOT case sensitive.
	cEf(" void CS_space(int wtv=-1){yINP(\" \");} ");
	cEf(" void CS_comma(int wtv=-1){yINP(\",\");} ");
	cEf(" void CS_period(int wtv=-1){yINP(\".\");} ");
	cEf(" void CS_dash(int wtv=-1){yINP(\"-\");} ");
	cEf(" void CS_slash(int wtv=-1){yINP(\"/\");} ");
	cEf(" void CS_asterisk(int wtv=-1){yINP(\"*\");} ");
	cEf(" void CS_openbracket(int wtv=-1){yINP(\"(\");} ");
	cEf(" void CS_closebracket(int wtv=-1){yINP(\")\");} ");

	cEf(" void CS_tab(int wtv=-1){ ");
	cEf(" string result=\"\"; int bestmatchfinindex=0; int bestmatchlength=0; ");
	cEf(" for(i=0;<sizestrarray(CnCMDS)){ ");
	cEf(" if(xsArrayGetString(CnCMDS,i-1)==\"|\"){ ");
	cEf(" 	for(k=0;<sizestrarray(CnINPT)){ ");
	cEf(" 	if(xsArrayGetString(CnCMDS,i+k)==xsArrayGetString(CnINPT,k))","{if(bestmatchlength<(k+1)){bestmatchfinindex=(i+k);bestmatchlength=k+1;}} ");
	cEf(" 	else{break;} ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" if(sizestrarray(CnINPT)>bestmatchlength || bestmatchlength==0){} ");
	cEf(" else if(consoleautocomplete>\"\"){for(q=bestmatchfinindex+1;<conplete","(bestmatchfinindex)){arrayaddstr(CnINPT,xsArrayGetString(CnCMDS,q));}} ");
	cEf(" consoleautocomplete=\"\"; ");
	cEf(" } ");

	cEf(" void CS_enter(int wtv=-1){consolecommand();resetstrarray(CnINPT);consoleautocomplete=\"\";} ");
	cEf(" void CS_esc(int wtv=-1){editMode(\"none\");showconsole=0;} ");
	cEf(" void CS_backspace(int wtv=-1){arraydelstr(CnINPT);consoleautocomplete=\"\";} ");
for(i=0;<10){CharaCon(""+i,""+i);}
for(i=1;<=52){CharaCon(Num2Let(i),Num2Let(i));}
	cEf(" void CS_NABLE(int wtv=-1){if(showconsole==0){showconsole=1;editMode(\"earthquake\");}else{showconsole=0;editMode(\"none\");}} ");

	cEf(" void loadconsolecommands(int wtv=-1){ ");
	cEf(" yCMD(\"|\");yCMD(\"c\");yCMD(\"a\");yCMD(\"m\"); ");
	cEf(" yCMD(\"z\");yCMD(\"o\");yCMD(\"o\");yCMD(\"m\");yCMD(\"(\")",";yCMD(\"|\");yCMD(\"c\");yCMD(\"a\"); ");
	cEf(" yCMD(\"m\");yCMD(\"n\");yCMD(\"o\");yCMD(\"r\");yCMD(\"m\")",";yCMD(\"a\");yCMD(\"l\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"p\");yCMD(\"l\");yCMD(\"a\");yCMD(\"y\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"p\");yCMD(\"l\");yCMD(\"a\");yCMD(\"y\");yCMD(\"x\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"n\");yCMD(\"e\");yCMD(\"x\");yCMD(\"t\"); ");
	cEf(" yCMD(\"t\");yCMD(\"r\");yCMD(\"a\");yCMD(\"c\");yCMD(\"k\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"m\");yCMD(\"u\");yCMD(\"t\");yCMD(\"e\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"u\");yCMD(\"n\");yCMD(\"m\");yCMD(\"u\");yCMD(\"t\");yCMD(\"e\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"f\");yCMD(\"a\");yCMD(\"d\");yCMD(\"e\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"f\");yCMD(\"o\");yCMD(\"g\");yCMD(\"(\");yCMD(\"|\");yCMD(\"l\"); ");
	cEf(" yCMD(\"i\");yCMD(\"g\");yCMD(\"h\");yCMD(\"t\");yCMD(\"i\");yCMD(\"n\");yCMD(\"g\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"r\");yCMD(\"d\");yCMD(\"i\");yCMD(\"s\");yCMD(\"t\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"s\");yCMD(\"f\");yCMD(\"x\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"g\");yCMD(\"p\");yCMD(\"r\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"p\");yCMD(\"o\");yCMD(\"p\");yCMD(\"g\");yCMD(\"r\");yCMD(\"a\"); ");
	cEf(" yCMD(\"p\");yCMD(\"h\");yCMD(\"i\");yCMD(\"c\");yCMD(\"(\"); ");
	cEf(" yCMD(\"|\");yCMD(\"f\");yCMD(\"i\");yCMD(\"x\");yCMD(\"u\");yCMD(\"i\");yCMD(\"(\"); ");
	cEf(" } ");

	cEf(" void resetintarray(int i=-1) { ");
	cEf(" int size=xsArrayGetSize(i); ");
	cEf(" for(k=0; <size){xsArraySetInt(i,k,-1);} ");
	cEf(" } ");

	cEf(" void arrayaddint(int i=-1, int add=-1) { ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)==-1){xsArraySetInt(i,arrayindex,add); break;} ");
	cEf(" } ");
	cEf(" } ");

//Special for handling shipment timing arrays.
	cEf(" int anshptiming(int i=-1){ ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)!=-1 && xsArrayGetInt(i,arrayindex+1)==-1){return(xsArrayGetInt(i,arrayindex)); break;} ");
	cEf(" } ");
	cEf(" return(trTimeMS()); ");
	cEf(" } ");

	cEf(" int lastshpentry(int i=-1){ ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)!=-1 && xsArrayGetInt(i,arrayindex+1)==-1){return(xsArrayGetInt(i,arrayindex)); break;} ");
	cEf(" } ");
	cEf(" return(0); ");
	cEf(" } ");
//-----------

	cEf(" void arrayaddintunique(int i=-1, int add=-1) { ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)==add){break;} ");
	cEf(" else if(xsArrayGetInt(i,arrayindex)==-1){xsArraySetInt(i,arrayindex,add); break;} ");
	cEf(" } ");
	cEf(" } ");

//fixes any -1 gaps
	cEf(" void arrayfixint(int i=-1) { ");
	cEf(" int temp=0; int fw=0; int cur=0; ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" cur=xsArrayGetInt(i,arrayindex);fw=xsArrayGetInt(i,arrayindex+1); ");
	cEf(" if(cur==-1){xsArraySetInt(i,arrayindex,fw);xsArraySetInt(i,arrayindex+1,-1);} ");
	cEf(" } ");
	cEf(" } ");

///DO NEXT PLZ
//Same but will also replace any values deemed obsolete by the function before a blank space is found.
//Uses values scaled by 10 for comparison
	cEf(" void arrayaddintspecial(int i=-1, int add=-1) { ");
	cEf(" int temp=0; for(arrayindex=0; <xsArrayGetSize(i)){ temp=xsArrayGetInt(i,arrayindex); ");
	cEf(" if(temp==-1){xsArraySetInt(i,arrayindex,add); break;} ");
	cEf(" else if(temp==add || isPROGRESSION(add,temp)==1)","{xsArraySetInt(i,arrayindex,add); break;} ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void arrayremoveint(int i=-1, int rem=-1) { ");
	cEf(" for(arrayindex=0;<xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)==rem)","{xsArraySetInt(i,arrayindex,-1);arrayfixint(i);break;} ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void arrayremovelastint(int i=-1){ ");
	cEf(" for(arrayindex=0; <xsArrayGetSize(i)){ ");
	cEf(" if(xsArrayGetInt(i,arrayindex)!=-1 && xsArrayGetInt(i,arrayindex+1)==-1){xsArraySetInt(i,arrayindex,-1); break;} ");
	cEf(" } ");
	cEf(" } ");

	cEf(" int arraylengthint(int i=-1) { int length=0; ");
	cEf(" int size=xsArrayGetSize(i); ");	
	cEf(" for(arrayindex=0; <size){ ");
	cEf(" if(arrayindex==size-1){length=size; break;} ");
	cEf(" if(xsArrayGetInt(i,arrayindex)==-1){length=arrayindex; break;} ");
	cEf(" } ");
	cEf(" return(length); } ");
//For efficiency try to limit size to 20 as this is O(n^2)
	cEf(" void bubblesortascendintarray(int r=-1){ ");
	cEf(" int n=arraylengthint(r); int tempY1=0; int tempY2=0; ");
	cEf(" for(x=0;<n){ ");
	cEf(" 	for(y=0;<n-1){ ");
	cEf(" 		tempY1=xsArrayGetInt(r,y); tempY2=xsArrayGetInt(r,y+1); ");
	cEf(" 		if(tempY1>tempY2){ ");
	cEf(" 		xsArraySetInt(r,y,tempY2);xsArraySetInt(r,y+1,tempY1); ");
	cEf(" 		} ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" } ");
//rearrange later.
/////////////////////////////
	cEf(" void shiftintarray(int i=-1, int add=0) { ");
	cEf(" bool fullarray=false; ");
	cEf(" int arraysize=xsArrayGetSize(i); ");
	cEf(" if(xsArrayGetInt(i,arraysize-1)!=-1){fullarray=true;} ");
	cEf(" if(fullarray==true){ ");
	cEf(" 	for(q=0;<(arraysize-1)){ ");
	cEf(" 	 xsArraySetInt(i,q,xsArrayGetInt(i,q+1)); ");
	cEf(" 	} ");
	cEf(" 	xsArraySetInt(i,arraysize-1,add); ");
	cEf(" } ");
	cEf(" else{ ");	
	cEf(" 	for(q=0;<arraysize){ ");
	cEf(" 	if(xsArrayGetInt(i,q)==-1){xsArraySetInt(i,q,add); break;} ");	
	cEf(" 	} ");
	cEf(" } ");	
	cEf(" } ");

	cEf(" void updateunspentres(int wtv=-1){ ");
	cEf(" int temptotal=0; ");	
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); temptotal=kbResourceGet(0)+kbResourceGet(1)+kbResourceGet(2); ");
	cEf(" shiftintarray(D1P"+p+",temptotal); ");	
}	
	cEf(" } ");


///////////////////////////////

//Assumes that the arrays are of suitable sizes.
	cEf(" void cloneintarray(int from=-1, int to=-1){ ");
	cEf(" for(i=0;<xsArrayGetSize(to)){xsArraySetInt(to,i,xsArrayGetInt(from,i));} ");
	cEf(" } ");

	cEf(" void clonestrarray(int from=-1, int to=-1){ ");
	cEf(" for(i=0;<xsArrayGetSize(to)){xsArraySetString(to,i,xsArrayGetString(from,i));} ");
	cEf(" } ");

	cEf(" void cloneimprovarrays(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" cloneintarray(ImIC,C1P"+p+"); ");
}
	cEf(" } ");

	cEf(" string unitart(int unit=-1, int plyr=1){ ");
	cEf(" string output=\"\"; int myciv=0; string cf=\"\"; ");
	cEf(" output=xsArrayGetString(PrIP,unit); ");
	cEf(" if(unit==-1){return(\"spec\bbg0\");} ");
	cEf(" if(unit==9001){return(\"shadows_selections/nugget_selection/nugget\");} ");
	cEf(" 		if(output==\"\"){ ");
//Eventually will have to change to vary according to unit and civ. DOING NOW
	cEf(" 		xsSetContextPlayer(plyr); myciv=kbGetCiv(); cf=kbGetProtoUnitName(xsArrayGetInt(PrID,unit)); ");
	
	cEf(" 		if(cf==\"FishingBoat\" || cf==\"ypFishingBoatAsian\"){ ");
	cEf(" 		if(InI(myciv,15,17)){return(\"ui\units/native_fishing_boat_portrait\");} ");
	cEf(" 		if(InI(myciv,19,19)){return(\"units\asians/naval\fishing_boat_asian\chinese_fishing_boat_icon_portrait\");} ");
	cEf(" 		if(InI(myciv,20,20)){return(\"units\asians/naval\fishing_boat_asian\chinese_fishing_boat_icon_portrait\");} ");
	cEf(" 		if(InI(myciv,21,21)){return(\"units\asians/naval\fishing_boat_asian\indian_fishing_boat_icon_portrait\");} ");
	cEf(" 		return(\"units/naval\fishing_ship\fishing_ship_icon_portrait\"); ");
	cEf(" 		} ");
	cEf(" 		else if(cf==\"ypIrregular\"){ ");
	cEf(" 		if(InI(myciv,21,21)){return(\"units\asians\shared\irregular\indian_irregular_gun_icon_portrait\");} ");
	cEf(" 		return(\"units\asians\shared\irregular\asian_irregular_gun_icon_portrait\"); ");
	cEf(" 		} ");
	cEf(" 		else if(cf==\"ypPeasant\"){ ");
	cEf(" 		if(InI(myciv,21,21)){return(\"units\asians\shared\irregular\indian_irregular_icon_portrait\");} ");
	cEf(" 		return(\"units\asians\shared\irregular\asian_irregular_spear_icon_portrait\"); ");
	cEf(" 		} ");
	cEf(" 		else if(cf==\"ypCastle\"){ ");
	cEf(" 		if(InI(myciv,20,20)){return(\"buildings\asian_civs\castle\China\chinese_castle_icon_portrait\");} ");
	cEf(" 		if(InI(myciv,21,21)){return(\"buildings\asian_civs\castle\Indian\indian_castle_icon_portrait\");} ");
	cEf(" 		return(\"buildings\asian_civs\castle\Japan\japan_castle_icon_portrait\"); ");
	cEf(" 		} ");
	
	cEf(" 		return(\"spec\prog\R50\"); ");
	cEf(" 		} ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string techart(int tech=-1){ ");
	cEf(" string output=\"\"; ");
	cEf(" output=xsArrayGetString(ImIP,tech); ");
	cEf(" 		if(output==\"\"){ ");
	cEf(" 		return(\"spec\bbg0\"); ");
	cEf(" 		} ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string cumstring(int array=0, int a=0, int z=0, int precedarray=-1){ ");
	cEf(" string output=\"\"; ");
	cEf(" if(precedarray>-1){ ");
	cEf(" for(r=a;<z){ ");
	cEf(" if(xsArrayGetString(precedarray,r)>\"\"){output=output+xsArrayGetString(precedarray,r);} ");
	cEf(" else{output=output+xsArrayGetString(array,r);} ");
	cEf(" } ");	
	cEf(" } ");
	cEf(" else{ ");
	cEf(" for(k=a;<z){ ");
	cEf(" output=output+xsArrayGetString(array,k); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string fullstr(int array=0){ ");
	cEf(" string output=\"\"; ");
	cEf(" for(k=0;<xsArrayGetSize(array)){ ");
	cEf(" output=output+xsArrayGetString(array,k); ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" void loadTPs(int plyr=-1){ ");
	cEf(" int result=0; int todaysquery=0; int querysize=0; ");
	cEf(" xsSetContextPlayer(0); kbLookAtAllUnitsOnMap(); ");	
	cEf(" todaysquery=kbUnitQueryCreate(\"TPCounter\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, 0, true); ");
	cEf(" kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, 490); ");
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" TPids=xsArrayCreateInt(querysize,-1,\"TradingPostIDs\"); ");
	cEf(" for(i=0;<querysize){xsArraySetInt(TPids,i,kbUnitQueryGetResult(todaysquery,i));} ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" } ");

//Remove all dead paddies from the list by setting id to -1
//Add all new alive paddy ids to the first -1 spot in paddy ids and set resource to -1
//Then search for any alive paddies switching resource and multiply resource by -1
	cEf(" void loadPADIs(int plyr=-1){ ");
	cEf(" int result=0; int todaysquery=0; int querysize=0; int temp=0; int existsinarray=0; ");
	cEf(" xsSetContextPlayer(plyr); kbLookAtAllUnitsOnMap(); ");	
//STEP 1
	cEf(" todaysquery=kbUnitQueryCreate(\"PaddiezDed\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, plyr, true); ");
	cEf(" kbUnitQuerySetState(todaysquery,cUnitStateDead); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, 919); "); //919=ypRicePaddy
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(r=0;<querysize){temp=kbUnitQueryGetResult(todaysquery,r); ");
	cEf(" for(i=0;<"+12*cNumNonObsPlayers+"){ ");
	cEf(" if(xsArrayGetInt(PADIids,i)==temp){xsArraySetInt(PADIids,i,-1);xsArraySetInt(PADIrez,i,-1);} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
//STEP 2
	cEf(" todaysquery=kbUnitQueryCreate(\"PaddiezLiv\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, plyr, true); ");
	cEf(" kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, 919); "); //919=ypRicePaddy
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(r=0;<querysize){existsinarray=0; temp=kbUnitQueryGetResult(todaysquery,r); ");
	cEf(" for(i=0;<"+12*cNumNonObsPlayers+"){ ");
	cEf(" if(xsArrayGetInt(PADIids,i)==temp){existsinarray=1;break;} ");
	cEf(" } ");
	cEf(" if(existsinarray!=1){ ");
	cEf(" for(i=0;<"+12*cNumNonObsPlayers+"){ ");
	cEf(" if(xsArrayGetInt(PADIids,i)==-1){xsArraySetInt(PADIids,i,temp);xsArraySetInt(PADIrez,i,-1);break;} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
//STEP 3
	cEf(" todaysquery=kbUnitQueryCreate(\"PaddiezBuzy\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, plyr, true); ");
	cEf(" kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, 919); "); //919=ypRicePaddy
	cEf(" kbUnitQuerySetActionType(todaysquery, 42); "); //Switching states
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(r=0;<querysize){temp=kbUnitQueryGetResult(todaysquery,r); ");
	cEf(" for(i=0;<"+12*cNumNonObsPlayers+"){ ");
	cEf(" if(xsArrayGetInt(PADIids,i)==temp){xsArraySetInt(PADIrez,i,-1*xsArrayGetInt(PADIrez,i));break;} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");

	cEf(" } ");

//---------------------------------------------------------
	cEf(" rule _ConstantLoader active runImmediately { ");
//	cEf(" trChatSetStatus(false); ");
	cEf(" if(trIsGadgetVisible(\"SpecEnableMusic-1\")){MusicOverAesthetics=1;} ");
	cEf(" if(trIsGadgetVisible(\"SpecEnableUnitTicker-1\")){enableunitticker=1;} ");
	cEf(" FP=trCurrentPlayer(); if(trGetWorldDifficulty() == 4){nabvl=1;} ");
	cEf(" xsSetContextPlayer(0); setbaseline(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" P"+p+"StartXP=kbResourceGetXP("+p+"); P"+p+"StartAge=kbGetAgeForPlayer("+p+"); ");
}
	cEf(" PrID=xsArrayCreateInt("+cNumAllTypes+",-1,\"ProtoIDs\");   ");
	cEf(" PrNM=xsArrayCreateString("+cNumAllTypes+",\"\",\"ProtoNames\");   ");
	cEf(" PrDC=xsArrayCreateInt("+cNumAllTypes+",-1,\"ProtoStringIDs\");   ");
	cEf(" PrIP=xsArrayCreateString("+cNumAllTypes+",\"\",\"ProtoImgPaths\");   ");

	cEf(" ImIC=xsArrayCreateInt("+cNumAllTechs+",-1,\"TechShipIndicators\");   ");
	cEf(" ImDC=xsArrayCreateInt("+cNumAllTechs+",-1,\"TechShipStringIDs\");   ");
	cEf(" ImIP=xsArrayCreateString("+cNumAllTechs+",\"\",\"TechShipImgPaths\");   ");
	
//For consolation :( maximum of 99 characters
	cEf(" CnINPT=xsArrayCreateString(99,\"\",\"ConsoleInput\");   ");
	cEf(" CnCMDS=xsArrayCreateString(300,\"\",\"ConsoleCommands\");   ");
//To store the decompiled arguments of a command at some point. Maximum of 10.
	cEf(" CnDCMP=xsArrayCreateFloat(10,-1.0,\"ConsoleCommandArguments\");   ");

//For AdvancedUnitUpgrades tracking :O up to a maximum of 20 visible?
	cEf(" AdUUDisplay=xsArrayCreateInt(20,-1,\"AdvancedUnitUpgradesDisplay\");   ");
	cEf(" AdUUPDisplay=xsArrayCreateInt(20,-1,\"AdvancedUnitUpgradesProgressDisplay\");   ");
	cEf(" AdUSDisplay=xsArrayCreateInt(20,-1,\"AdvancedUnitShipmentUpsDisplay\");   ");
	
	cEf(" AdUG_initial=xsArrayCreateString(25,\"\",\"AdvancedUnitUpgradesGraphicIni\");   ");
	cEf(" AdUG_final=xsArrayCreateString(25,\"\",\"AdvancedUnitUpgradesGraphicFin\");   ");

//For AgeBarDisplay
	cEf(" ABDisplay=xsArrayCreateString(6,\"\",\"AgeBarDisplay\");   ");
	cEf(" ABDisplayPrior=xsArrayCreateString(6,\"\",\"AgeBarDisplayPrior\");   ");

	cEf(" BABDisplay=xsArrayCreateString(6,\"\",\"BackAgeBarDisplay\");   ");
	cEf(" BABDisplayPrior=xsArrayCreateString(6,\"\",\"BackAgeBarDisplayPrior\");   ");

//These two are static. Should build the loading of them into a similar method as to units.
	cEf(" AdUUDType=xsArrayCreateInt("+cNumTrackedTechs+",-1,\"AdvancedUnitUpgradesDisplayUnitTypeStorage\");");
	cEf(" AdUUDTech=xsArrayCreateInt("+cNumTrackedTechs+",-1,\"AdvancedUnitUpgradesDisplayTechnologyStorage\");");
	cEf(" AdUUDTTT=xsArrayCreateInt("+cNumTrackedTechs+",-1,\"AdvancedUnitUpgradesDisplayIsTeamTech\");");

	cEf("AdUUDRType=xsArrayCreateInt("+cNumTrackedTechsRemoved+",-1,\"AdvancedUnitUpgradesDisplayUnitTypeRemovalStorage\");");
	cEf("AdUUDRTech=xsArrayCreateInt("+cNumTrackedTechsRemoved+",-1,\"AdvancedUnitUpgradesDisplayTechnologyRemovalStorage\");");

///For scrolling. Allow up to 3 sub-divisions per player. HARDCODED
	cEf(" DivInx=xsArrayCreateInt("+3*cNumNonObsPlayers+",0,\"ScrollingIndices\");   ");
	cEf(" DivTyp=xsArrayCreateInt("+3*cNumNonObsPlayers+",0,\"SubdivisionTypes\");   ");
	cEf(" DivLgt=xsArrayCreateInt("+3*cNumNonObsPlayers+",0,\"SubdivisionLengths\");   ");
//Note that it is admittedly redundant to have the latter 2 so large, but so be it.

///For rice paddy logic. Assume no more than (12*Number of player) paddies will ever exist at one time.
	cEf(" PADIids=xsArrayCreateInt("+12*cNumNonObsPlayers+",-1,\"RicePaddyIDs\");   ");
	cEf(" PADIrez=xsArrayCreateInt("+12*cNumNonObsPlayers+",-1,\"RicePaddyResource\");   ");

//For find unit cycling
	cEf(" FindUnitTracker=xsArrayCreateInt(20,-1,\"FindDatCycle\"); ");
	
	cEf(" PlTM=xsArrayCreateInt("+(cNumberNonGaiaPlayers+1)+",-1,\"PlayerTeams\"); ");

//Now need to create player-specific arrays. These start off empty/default and are updated in real-time.
for(p=1;<=cNumNonObsPlayers){
	cEf(" A1P"+p+"=xsArrayCreateInt("+cNumAllTypes+",-1,\"P"+p+"LifUnits\");   ");
	cEf(" A2P"+p+"=xsArrayCreateInt("+cNumAllTypes+",-1,\"P"+p+"DedUnits\");   ");
	cEf(" A3P"+p+"=xsArrayCreateInt("+cNumAllTypes+",-1,\"P"+p+"QueUnits\");   ");

	cEf(" B1P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurEcoUnits\");   ");
	cEf(" B2P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurMilUnits\");   ");
	cEf(" B3P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurWatUnits\");   ");
	cEf(" B4P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurAllUnits\");   ");
	cEf(" B5P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurQqqUnits\");   ");
	cEf(" B6P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"CurDedUnits\");   ");

	cEf(" C1P"+p+"=xsArrayCreateInt("+cNumAllTechs+",-1,\"P"+p+"ImprovementsIndicator\");   ");
	cEf(" C2P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"Techs_Completed\");   ");
	cEf(" C3P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"Techs_Timestamps\");   ");
	cEf(" C4P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"Techs_Researching\");   ");
	cEf(" C5P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"Shipments\");   ");
	cEf(" C6P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"Shipments_Timestamps\");   ");
	cEf(" C7P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"TechsShipments\");   ");
	cEf(" C8P"+p+"=xsArrayCreateInt(150,-1,\"P"+p+"TechsShipments_Timestamps\");   ");

	cEf(" D1P"+p+"=xsArrayCreateInt(30,-1,\"P"+p+"UnspentRes\");   ");	
	
	cEf(" E1P"+p+"=xsArrayCreateInt("+cNumAllTypes+",0,\"P"+p+"UnitScreenshot\");   ");
	cEf(" E2P"+p+"=xsArrayCreateInt("+cNumAllTypes+",0,\"P"+p+"UnitDeltas\");   ");
	cEf(" E3P"+p+"=xsArrayCreateInt(10,-1,\"P"+p+"ShipmentExpirys\");   "); //Honestly if you have more than 10 in queue then you nub. NEED TO WORK ON

	cEf(" E4P"+p+"=xsArrayCreateInt("+cNumAllTypes+",0,\"P"+p+"UnitScreenshotSHP\");   ");
	cEf(" E5P"+p+"=xsArrayCreateInt("+cNumAllTypes+",0,\"P"+p+"UnitDeltasSHP\");   ");

	cEf(" F1P"+p+"=xsArrayCreateInt(1000,-1,\"P"+p+"UnitTickerID\");   ");
	cEf(" F2P"+p+"=xsArrayCreateInt(1000,-1,\"P"+p+"UnitTickerCount\");   ");
}

//And finally, arrays for the Gdisplay.
	cEf(" Gplyr=xsArrayCreateInt(64,-1,\"Gplayer\"); ");
	cEf(" Gtype=xsArrayCreateInt(64,-1,\"Gtaipu\"); ");
	cEf(" Gbase=xsArrayCreateInt(64,-1,\"Gjump\"); ");
	cEf(" Gindex=xsArrayCreateInt(64,-1,\"Gtoaru\"); ");
	cEf(" Ggrafix=xsArrayCreateString(64,\"\",\"Gdisplay\"); ");
	cEf(" GgrafixTOP=xsArrayCreateString(64,\"\",\"GdisplayKEK\"); ");
	cEf(" Gtext=xsArrayCreateString(64,\"\",\"Gtekshi\"); ");

	cEf(" loadTPs(); loadprotoarrays(); loadimprovarrays(); cloneimprovarrays();");
	cEf(" loadadvancedimprovarrays(); loadadvancedremovarrays(); loadconsolecommands(); initializeteamarray(); ");
	cEf(" trEventSetHandler(13337,\"deployUIFromRec\"); ");
if(IDesignRMS==1){
	cEf(" trPlayerSetHCAccess(FP,false); ");
}
	cEf(" xsDisableSelf(); return; }");
//---------------------------------------------------------
	
	cEf(" int aexpb(int number=0, int exponent=0){ ");
	cEf(" int result=1; ");
	cEf(" for(i=1; <=exponent){result=result*number;} ");
	cEf(" return(result); ");
	cEf(" } ");
	
	cEf(" int configparser(int configindex=-1){ ");
	cEf(" int result=0; ");
	cEf(" for(i=0; <=10){if(trIsGadgetVisible","(\"SpecCustomConfig-\"+configindex+\"-pv\"+i)){result=result+aexpb(2,i);}} ");
	cEf(" return(result); ");
	cEf(" } ");
	
	cEf(" void loadcustomconfig(int wtv=-1){ ");
for(c=0;<numconfigvariables){
	cEf(" "+configVar(c)+"=configparser("+c+"); ");
}
	cEf(" } ");

	cEf(" void savecustomconfig(int wtv=-1){ ");
	cEf(" string output=\"specUI-\"; ");
for(c=0;<numconfigvariables-1){
	cEf(" output=output+"+configVar(c)+"+\",\"; ");
}
	cEf(" output=output+"+configVar(numconfigvariables-1)+"; ");
	cEf(" kat(output);saveCamera(output); ");
	cEf(" } ");

	cEf(" void hideviewlockoverlays(int wtv=-1){ ");
	cEf(" for(s="+(3-cNumNonObsPlayers/2)+";<"+(3+cNumNonObsPlayers/2)+"){gadgetUnreal(\"Spec_ViewLock_\"+s);} ");
	cEf(" } ");

	cEf(" void noviewlock(int wtv=-1){cameralockonplayer=0;hideviewlockoverlays();} ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" void viewlock"+p+"(int wtv=-1){cameralockonplayer=column"+p+"player;hideviewlockoverlays(); ");
	cEf(" gadgetReal(\"Spec_ViewLock_"+(p+(2-cNumNonObsPlayers/2))+"\");");
	cEf(" } ");
}

	cEf(" void handleplayerouts(int wtv=-1){ ");
for(f=1;<=cNumNonObsPlayers){
	cEf(" if((kbIsPlayerResigned("+rPFromNorth(f)+") || kbHasPlayerLost("+rPFromNorth(f)+")) && P"+rPFromNorth(f)+"alive==1)","{P"+rPFromNorth(f)+"alive=0;gadgetUnreal(\"Spec_PlayerLabel_"+f+"_P"+rPFromNorth(f)+"\");","gadgetReal(\"Spec_PlayerDead_"+f+"_P"+rPFromNorth(f)+"\");} ");
}
	cEf(" } ");

	cEf(" void handleendgame(int wtv=-1){ ");
	cEf(" int team1defeats=0; int team2defeats=0; ");
	cEf(" 	for(p=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" 		if(kbIsPlayerResigned(p) || kbHasPlayerLost(p)){ ");
	cEf(" 		if(xsArrayGetInt(PlTM,p)==1){team1defeats=team1defeats+1;}else{team2defeats=team2defeats+1;} ");
	cEf(" 		} ");
	cEf(" 	} ");
	cEf(" if(team1defeats=="+(cNumNonObsPlayers/2)+" || team2defeats=="+(cNumNonObsPlayers/2)+"){ ");
	cEf(" if(FP>"+cNumNonObsPlayers+"){trackPlay(0);trCameraPanWithUnit(false,,-1);trSetFogAndBlackmap(false,false); ");
	cEf(" gadgetReal(\"Spec_Flag_2_0\");gadgetReal(\"Spec_Flag_3_0\"); ");
if(cNumNonObsPlayers>2){cEf(" gadgetReal(\"Spec_Flag_1_0\");gadgetReal(\"Spec_Flag_4_0\"); ");}
if(cNumNonObsPlayers>4){cEf(" gadgetReal(\"Spec_Flag_0_0\");gadgetReal(\"Spec_Flag_5_0\"); ");}
	cEf(" } ");
	cEf(" trUnitSelectClear(); ");
	cEf(" for(m="+rmGetUnitPlaced(BCOSIMBATMAN,0)+";<="+rmGetUnitPlaced(BCOSIMBATMAN,rmGetNumberUnitsPlaced(BCOSIMBATMAN)-1)+"){ ");
	cEf(" trUnitSelectByID(m);trUnitChangeProtoUnit(\"CinematicBlock\");trUnitSelectClear(); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	
	cEf(" void updateATMeco(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B1P"+p+"); ");
	cEf(" 	for(i=0;<"+cNumEcoTypes+"){ ");
	cEf(" 	if(xsArrayGetInt(A1P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B1P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");
	cEf(" void updateATMmil(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B2P"+p+"); ");
	cEf(" 	for(i="+cNumEcoTypes+";<"+(cNumEcoTypes+cNumMilTypes)+"){ ");
	cEf(" 	if(xsArrayGetInt(A1P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B2P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");
	cEf(" void updateATMwat(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B3P"+p+"); ");
	cEf(" 	for(i="+(cNumEcoTypes+cNumMilTypes)+";<"+(cNumEcoTypes+cNumMilTypes+cNumWatTypes)+"){ ");
	cEf(" 	if(xsArrayGetInt(A1P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B3P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");
	cEf(" void updateATMall(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B4P"+p+"); ");
	cEf(" 	for(i=0;<"+(cNumAllTypes)+"){ ");
	cEf(" 	if(xsArrayGetInt(A1P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B4P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");

	cEf(" void updateATMque(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B5P"+p+"); ");
	cEf(" 	for(i=0;<"+(cNumAllTypes)+"){ ");
	cEf(" 	if(xsArrayGetInt(A2P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B5P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");

	cEf(" void updateATMded(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(B6P"+p+"); ");
//for base eco types
	cEf(" 	for(b=0;<14){ ");
	cEf(" 	if(xsArrayGetInt(A3P"+p+",b)>0){ ");
	cEf(" 	arrayaddint(B6P"+p+",b); ");
	cEf(" 	} ");
	cEf(" 	} ");
//for others
	cEf(" 	for(i="+cNumEcoTypes+";<"+(cNumAllTypes)+"){ ");
	cEf(" 	if(xsArrayGetInt(A3P"+p+",i)>0){ ");
	cEf(" 	arrayaddint(B6P"+p+",i); ");
	cEf(" 	} ");
	cEf(" 	} ");
}
	cEf(" } ");

//Call it in the thing that handles techs.
	cEf(" void handleRevolt(int tID=0, int plyr=-1){ ");
	cEf(" int myciv=0; ");
	cEf(" xsSetContextPlayer(plyr); myciv=kbGetCiv(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" if(column"+p+"player==plyr){gadgetUnreal(\"Spec_Flag_\"+("+p+"+"+(2-cNumNonObsPlayers/2)+")+\"_\"+myciv); ");
	cEf(" gadgetReal(\"Spec_Flag_\"+("+p+"+"+(2-cNumNonObsPlayers/2)+")+\"_\"+(tID-1478));} ");
}
for(p=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+p+"){has"+p+"Rev=1;} ");
}
	cEf(" } ");

for(p=1;<=cNumNonObsPlayers){
	cEf(" void echoPlayerShipmentString"+p+"(int tID=-1){ ");
	cEf(" string echoOutput=\"{\"+xsArrayGetInt(ImDC,tID)+\"}\"+\"Tech ID \"+tID; ");
	cEf(" 	if(hasUI==1){ ");
//FLAGGED
for(flagposition=1;<=6){
if(rPFromWest(flagposition)==p){cEf(" trOverlayText(echoOutput,1,flag"+(flagposition+(2-cNumNonObsPlayers/2))+"Xpos-flagXleeway,60,59+2*flagXleeway,\"\"); ");
cEf(" gadgetReal(\"Spec_ShipmentEcho_"+(flagposition+(2-cNumNonObsPlayers/2))+"_P"+p+"\");gadgetToggle(\"Spec_ShipmentEcho_"+(flagposition+(2-cNumNonObsPlayers/2))+"_P"+p+"\"); ");}
}
	cEf(" 	} ");
	cEf(" 	else{ ");
	cEf(" 	kat(\"Player "+p+" Has Sent Shipment:\");kat(\"{\"+xsArrayGetInt(ImDC,tID)+\"}\"); ");
	cEf(" 	} ");
	cEf(" } ");
}
	cEf(" void handleshpchecksum(int array=0, int ciksum=0){ ");
	cEf(" if(ciksum==0){} ");
CKSUM(50896,1854);
CKSUM(140896,1855);
CKSUM(90896,1856);
CKSUM(160896,1857);
CKSUM(70898,1858);
CKSUM(50898,1859);
CKSUM(140898,1860);
CKSUM(80898,1861);
CKSUM(30894,1865);
CKSUM(50894,1866);
CKSUM(70894,1867);
CKSUM(60894,2096);
CKSUM(60897,1862);
CKSUM(50897,1863);
CKSUM(80897,1864);
CKSUM(40897,2097);
CKSUM(40895,1868);
CKSUM(60895,1869);
CKSUM(70895,2536);
CKSUM(21284,2323);
CKSUM(31284,2324);
CKSUM(41284,2482);
CKSUM(31285,2325);
CKSUM(41285,2326);
CKSUM(21130,2006);
CKSUM(41130,2007);
CKSUM(71130,2008);
CKSUM(30414,992);
CKSUM(20935,2514);
CKSUM(20521,2515);
CKSUM(30415,993);
CKSUM(20937,2516);
CKSUM(20522,2517);
CKSUM(30416,994);
CKSUM(10440,2518);
CKSUM(21012,1993);
CKSUM(41012,2224);
CKSUM(20404,2478);
CKSUM(30404,2479);
CKSUM(30950,2476);
CKSUM(11282,1804);
CKSUM(21282,1805);
CKSUM(51109,1956);
CKSUM(31109,2535);
CKSUM(81109,2480);
CKSUM(10953,1958);
CKSUM(10952,2235);
CKSUM(20952,2236);
CKSUM(11246,2237);
CKSUM(50386,1979);
CKSUM(101335,1965);
CKSUM(150386,2484);
CKSUM(40949,1964);
CKSUM(100734,1959);
CKSUM(111070,1961);
CKSUM(291070,1962);
CKSUM(32008,1914);
CKSUM(81922,1916);
CKSUM(51359,1915);
CKSUM(250871,1665);
CKSUM(200877,1667);
CKSUM(300874,1668);
CKSUM(300873,1669);
CKSUM(300880,1670);
CKSUM(300869,1671);
CKSUM(300870,1672);
CKSUM(202445,1674);
CKSUM(100763,1689);
CKSUM(50387,1690);
CKSUM(150439,1692);
CKSUM(30445,1695);
CKSUM(90907,1875);
CKSUM(300968,1912);
CKSUM(230966,1935);
CKSUM(111745,2004);
CKSUM(80970,2298);
CKSUM(30905,2505);
CKSUM(10522,2343);
CKSUM(40937,2023);
CKSUM(80914,2524);
CKSUM(60766,1711);
CKSUM(70710,1734);
CKSUM(151245,1661);
CKSUM(40939,1604);
CKSUM(60757,1286);
CKSUM(200745,1722);
CKSUM(90756,1707);
CKSUM(50609,1654);
CKSUM(100302,1655);
CKSUM(60313,1656);
CKSUM(80306,1657);
CKSUM(70307,1658);
CKSUM(100286,1659);
CKSUM(40320,1660);
CKSUM(40444,1693);
CKSUM(20349,1701);
//These basically are combinations with the same checksum so we treat them slightly differently.
	cEf(" else if(ciksum==20523){xsArraySetInt(array,716,2);xsArraySetInt(array,2513,2);} ");
	cEf(" else if(ciksum==20939){xsArraySetInt(array,1603,2);xsArraySetInt(array,2512,2);} ");
	cEf(" else if(ciksum==50937){xsArraySetInt(array,2024,2);xsArraySetInt(array,2222,2);} ");
	cEf(" } ");

for(p=1;<=cNumNonObsPlayers){

	cEf(" void handleshipmenttimings"+p+"(int wtv=-1){ ");
	cEf(" int instaspentship=0; int instaspentgold=0; int jkplus=40000;");
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" instaspentship=kbTotalResourceGet(6)-kbResourceGet(6); instaspentgold=kbTotalResourceGet(0)-kbResourceGet(0); ");
	cEf(" if((instaspentgold-zuttogold"+p+")>100){jkplus=60000;} ");
	cEf(" if(kbGetTechPercentComplete(1899)==1){jkplus=jkplus/4;} "); //Confucius' Gift YPHCConfusciousGift
	cEf(" if(kbGetTechPercentComplete(2009)==1){jkplus=jkplus/2;} "); //Spanish Consulate Tech ypConsulateSpanishFasterShipments
//	cEf(" for(c=0;<(instaspentship-zuttoship"+p+")){trChatSendToPlayer(0,FP,\"F:\"+(instaspentfood-zuttofood"+p+")+\" W:\"+(","instaspentwood-zuttowood"+p+")+\" G:\"+(instaspentgold-zuttogold"+p+"));} ");
	cEf(" for(c=0;<(instaspentship-zuttoship"+p+")){arrayaddint(E3P"+p+",anshptiming(E3P"+p+")+jkplus);} ");//kat(\"\"+(anshptiming(E3P"+p+")+jkplus));} ");

//If shipment is cancelled, we assume that the last in queue has been cancelled.
	cEf(" for(d=0;<(zuttoship"+p+"-instaspentship)){arrayremovelastint(E3P"+p+");} ");
	
	cEf(" zuttoship"+p+"=instaspentship; zuttogold"+p+"=instaspentgold; ");
	cEf(" } ");
//Del food=income-spent
//Del totalfood=income

//spent=Del totalfood-Del food
//=newtotal-oldtotal-(new current-old current)
//=(newtotal-newcurrent)-(oldtotal-oldcurrent)
	cEf(" void predictshipmentarrival"+p+"(int wtv=-1){ ");
	cEf(" int mirai=xsArrayGetInt(E3P"+p+",0); int prid=0; int temp=0; int checksum=0; ");
	cEf(" xsSetContextPlayer("+p+"); ");
//Buffer of 100 MS.
	cEf(" if(mirai>-1 && (trTimeMS()>(mirai-150)) && (trTimeMS()<(mirai-50))){ ");
//	cEf(" kat(\"IT'S ARRIVING!\"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" prid=xsArrayGetInt(PrID,i); ");
	cEf(" temp=kbUnitCount("+p+",prid,cUnitStateAlive)+kbUnitCount("+p+",prid,cUnitStateDead); ");
	cEf(" xsArraySetInt(E4P"+p+",i,temp); ");
	cEf(" } ");
	cEf(" } ");

	cEf(" else if(mirai>-1 && trTimeMS()>(mirai+100)){xsArraySetInt(E3P"+p+",0,-1);arrayfixint(E3P"+p+"); ");
//	cEf(" kat(\"Shipment arrived at \"+trTimeMS()); ");
	cEf(" for(j=0;<"+cNumAllTypes+"){ ");
	cEf(" prid=xsArrayGetInt(PrID,j); ");
	cEf(" temp=kbUnitCount("+p+",prid,cUnitStateAlive)+kbUnitCount("+p+",prid,cUnitStateDead)-xsArrayGetInt(E4P"+p+",j); ");
	cEf(" xsArraySetInt(E5P"+p+",j,temp); ");
//	cEf(" if(temp>0){kat(\"SHP PREDICTION: +\"+temp+\" \"+kbGetProtoUnitName(prid));} ");
	cEf(" if(temp>0){checksum=checksum+temp*10000+prid;} ");
	cEf(" } ");
	cEf(" } ");

//There needs to have been at least 8 seconds since the last shipment was recorded in order for this to kick in.
	cEf(" if((trTime()-lastshpentry(C6P"+p+"))>8){ ");
	cEf(" handleshpchecksum(C1P"+p+",checksum); ");
	cEf(" } ");

	cEf(" } ");
}

//NB only STANDARD consulate types.
	cEf(" bool canReResearch(int i=0){ ");
	cEf(" if(i==2099){return(true);} ");
	cEf(" if(InI(i,2108,2112)){return(true);} ");
	cEf(" if(i==2212){return(true);} ");
	cEf(" if(i==2289){return(true);} ");
	cEf(" if(i==2389){return(true);} ");
	cEf(" if(InI(i,2228,2234)){return(true);} ");
	cEf(" if(i==2290){return(true);} ");
	cEf(" if(i==2390){return(true);} ");
	cEf(" return(false); ");
	cEf(" } ");

//Note that could also just remove problems then apply arrayfixint.
for(p=1;<=cNumNonObsPlayers){
	cEf(" void correctresearchingarrays"+p+"(int wtv=-1){ ");
	cEf(" int sokomade=arraylengthint(C4P"+p+"); int oboiteru=0; int kyou=-1; ");
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<sokomade){ ");
	cEf(" kyou=xsArrayGetInt(C4P"+p+",i);xsArraySetInt(C4P"+p+",i,-1); ");
	cEf(" if(kbGetTechPercentComplete(kyou)<1){ ");
	cEf(" xsArraySetInt(C4P"+p+",oboiteru,kyou);oboiteru=oboiteru+1; ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
}

for(p=1;<=cNumNonObsPlayers){
	cEf(" void updateimprovarrays"+p+"(int FR=0,int TO="+cNumAllTechs+"){ ");
	cEf(" int indicator=0; float progress=0; ");
//this is the problematic one./////
//Maybe just have a filter that checks if any are completed, and then removes from array.
//	cEf(" resetintarray(C4P"+p+"); xsSetContextPlayer("+p+"); ");
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=FR;<TO){ ");
	cEf(" progress=kbGetTechPercentComplete(i); ");
	cEf(" if(progress>0){ ");
	cEf(" 		if(progress==1){ ");
	cEf(" 			indicator=xsArrayGetInt(C1P"+p+",i); ");
	cEf(" 			if(indicator>0){ ");
	cEf(" 			if(indicator==1){ ");
	cEf(" 			arrayaddint(C2P"+p+",i); arrayaddint(C3P"+p+",trTime()); ");
	cEf(" 			arrayaddint(C7P"+p+",i); arrayaddint(C8P"+p+",trTime()); ");
	cEf(" 			xsArraySetInt(C1P"+p+",i,0); ");
	cEf(" 			if(InI(i,1531,1538)){handleRevolt(i,"+p+");} ");
	cEf(" 			} ");
	cEf(" 			else{ ");
	cEf(" 			arrayaddint(C5P"+p+",i); arrayaddint(C6P"+p+",trTime()); ");
	cEf(" 			arrayaddint(C7P"+p+",i); arrayaddint(C8P"+p+",trTime()); ");
	cEf(" 			xsArraySetInt(C1P"+p+",i,0); ");
//To deal with intervention being a bit tricky
	cEf(" 			if(i==2450 || i==2452){ ");
	cEf(" 			for(k=196;<204){xsArraySetInt(C1P"+p+",k,0);} ");
	cEf(" 			xsArraySetInt(C1P"+p+",2451,0); ");
	cEf(" 			} ");
//End intervention tricksters
	cEf(" 			echoPlayerShipmentString"+p+"(i); ");
	cEf(" 			} ");

	cEf(" 			if(xsArrayGetInt(Gplyr,0)=="+p+" && InI(xsArrayGetInt(Gtype,0),7,8)){scrollingindex1=-1;} ");
	cEf(" 			else if(xsArrayGetInt(Gplyr,Glinewidth-1)=="+p+" && InI(xsArrayGetInt(Gtype,Glinewidth-1),7,8)){scrollingindex3=-1;} ");
	cEf(" 			else if(xsArrayGetInt(Gplyr,Glinewidth)=="+p+" && InI(xsArrayGetInt(Gtype,Glinewidth),7,8)){scrollingindex2=-1;} ");
	cEf(" 			else if(xsArrayGetInt(Gplyr,2*Glinewidth-1)=="+p+" && InI(xsArrayGetInt(Gtype,2*Glinewidth-1),7,8)){scrollingindex4=-1;} ");
	cEf(" 			else if(xsArrayGetInt(Gplyr,2*Glinewidth)=="+p+" && InI(xsArrayGetInt(Gtype,2*Glinewidth),7,8)){scrollingindex5=-1;} ");
	cEf(" 			else if(xsArrayGetInt(Gplyr,3*Glinewidth-1)=="+p+" && InI(xsArrayGetInt(Gtype,3*Glinewidth-1),7,8)){scrollingindex6=-1;} ");

	cEf(" 			} ");

	cEf(" 		} ");
	cEf(" 		else{ ");
	cEf(" 		if(canReResearch(i)){xsArraySetInt(C1P"+p+",i,1);} ");
	cEf(" 		arrayaddintunique(C4P"+p+",i); ");
	cEf(" 		} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
}
	
	cEf(" void updateimprovarrays(int FR=0,int TO="+cNumAllTechs+"){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" updateimprovarrays"+p+"(FR,TO); ");
}
	cEf(" } ");
	
	cEf(" void clearstartingtechs(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" resetintarray(C2P"+p+"); resetintarray(C3P"+p+"); resetintarray(C7P"+p+"); resetintarray(C8P"+p+"); ");
}
	cEf(" } ");

//Recover from old file if need.
	cEf(" void sendtestchat(int wtv=-1){ ");
//	cEf(" trSetCounterDisplay(\"{18691}\"); ");
//	cEf(" trSetCounterDisplay(\"\"); ");
	cEf(" } ");

	cEf(" string int2timeZ(int convert=0) { ");
	cEf(" string Ioutput=\"\"; int Imin=0; int Isec=0; ");
	cEf(" Imin=convert/60; Isec=convert-Imin*60; ");
	cEf(" if(Imin>0){Ioutput=Ioutput+Imin+\":\";} ");
	cEf(" else{Ioutput=Ioutput+\"0:\";} ");
	cEf(" if(Isec<10){Ioutput=Ioutput+\"0\"+Isec;} else{Ioutput=Ioutput+Isec;} ");
	cEf(" return(Ioutput); ");
	cEf(" } ");

for(p=1;<=cNumNonObsPlayers){
/*
	cEf(" void screenshotunittotals"+p+"(int wtv=-1){ ");
	cEf(" int prid=0; int temp=0; ");
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" prid=xsArrayGetInt(PrID,i); ");
	cEf(" temp=kbUnitCount("+p+",prid,cUnitStateAlive)+kbUnitCount("+p+",prid,cUnitStateDead); ");
	cEf(" xsArraySetInt(E1P"+p+",i,temp); ");
	cEf(" } ");
	cEf(" } ");
*/

//call this right before shipment arrives and right after shipment arrives
	cEf(" void handleunitTrecording"+p+"(int wtv=-1){ ");
	cEf(" int prid=0; int temp=0; int tstamp=0; ");
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" prid=xsArrayGetInt(PrID,i); ");
	cEf(" temp=kbUnitCount("+p+",prid,cUnitStateAlive)+kbUnitCount("+p+",prid,cUnitStateDead); ");
	cEf(" xsArraySetInt(E2P"+p+",i,temp-xsArrayGetInt(E1P"+p+",i)); ");
	cEf(" xsArraySetInt(E1P"+p+",i,temp); ");
//	cEf(" if(xsArrayGetInt(E2P"+p+",i)>0){kat(\"[P"+p+" @ \"+int2timeZ(trTime())+\"] + \"+kbGetProtoUnitName(prid)+\" x\"+xsArrayGetInt(E2P"+p+",i));} ");
	cEf(" if(xsArrayGetInt(E2P"+p+",i)>0){ ");
	cEf(" if(tstamp==0){tstamp=1;arrayaddint(F1P"+p+",9001);arrayaddint(F2P"+p+",trTime());} ");
	cEf(" arrayaddint(F1P"+p+",i);arrayaddint(F2P"+p+",xsArrayGetInt(E2P"+p+",i)); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");


}

	cEf(" void graphicprocess(int INIarray=-1,int FINarray=-1){ ");
	cEf(" string current=\"\"; string new=\"\"; ");
	cEf(" for(i=0;<min(xsArrayGetSize(INIarray),xsArrayGetSize(FINarray))){ ");
	cEf(" current=xsArrayGetString(INIarray,i); new=xsArrayGetString(FINarray,i); ");
	cEf(" if(current==\"\" && new==\"\"){} ");
	cEf(" else if(current>\"\" && new==\"\"){gadgetUnreal(current);} ");
	cEf(" else if(current==\"\" && new>\"\"){gadgetReal(new);} ");
	cEf(" else if(current != new){gadgetUnreal(current);gadgetReal(new);} ");
	cEf(" } ");
	cEf(" } ");

//if dtekcount is>5, then show scrolls; similarly for dshpcount. need to show scrolls based on availability. similarly in hide, need to hide scrolls.
	cEf(" void showrelevanttechtracks(int wtv=-1){ ");
	cEf(" int redshift=0; int greenshift=0; ");
	cEf(" for(at=5*dtekpage;<min(5*(dtekpage+1),sizeintarray(AdUUDisplay))){if(xsArrayGetInt(AdUUDisplay,at)!=-1){redshift++;}}");
	cEf(" for(as=5*dshppage;<min(5*(dshppage+1),sizeintarray(AdUSDisplay))){if(xsArrayGetInt(AdUSDisplay,as)!=-1){greenshift++;}}");
	cEf(" for(t=5*dtekpage;<min(5*(dtekpage+1),sizeintarray(AdUUDisplay))){ ");
	cEf(" if(xsArrayGetInt(AdUUDisplay,t)!=-1){ ");
//	cEf(" gadgetReal(\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");
//	cEf(" gadgetReal(\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"O-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" xsArraySetString(AdUG_final,((5-redshift)+amodb(t,5)),\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");
	cEf(" xsArraySetString(AdUG_final,((10-redshift)+amodb(t,5)),\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"O-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" if(xsArrayGetInt(AdUUPDisplay,t)>0){ ");
//	cEf(" gadgetReal(\"SP\"+xsArrayGetInt(AdUUPDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" xsArraySetString(AdUG_final,((15-redshift)+amodb(t,5)),\"SP\"+xsArrayGetInt(AdUUPDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	cEf(" for(s=5*dshppage;<min(5*(dshppage+1),sizeintarray(AdUSDisplay))){ ");
	cEf(" if(xsArrayGetInt(AdUSDisplay,s)!=-1){ ");
//	cEf(" gadgetReal(\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"-\"+","((5-greenshift)+amodb(s,5))); ");
//	cEf(" gadgetReal(\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"O-\"+","((5-greenshift)+amodb(s,5))); ");

	cEf(" xsArraySetString(AdUG_final,((20-greenshift)+amodb(s,5)),\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"-\"+","((5-greenshift)+amodb(s,5))); ");
	cEf(" xsArraySetString(AdUG_final,((25-greenshift)+amodb(s,5)),\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"O-\"+","((5-greenshift)+amodb(s,5))); ");

	cEf(" } ");
	cEf(" } ");

	cEf(" } ");

//Need to somehow shift these appropriately.
	cEf(" void hiderelevanttechtracks(int wtv=-1){ ");
	cEf(" int redshift=0; int greenshift=0; ");
	cEf(" for(at=5*dtekpage;<min(5*(dtekpage+1),sizeintarray(AdUUDisplay))){if(xsArrayGetInt(AdUUDisplay,at)!=-1){redshift++;}}");
	cEf(" for(as=5*dshppage;<min(5*(dshppage+1),sizeintarray(AdUSDisplay))){if(xsArrayGetInt(AdUSDisplay,as)!=-1){greenshift++;}}");
	cEf(" for(t=5*dtekpage;<min(5*(dtekpage+1),sizeintarray(AdUUDisplay))){ ");
	cEf(" if(xsArrayGetInt(AdUUDisplay,t)!=-1){ ");
//	cEf(" gadgetUnreal(\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");
//	cEf(" gadgetUnreal(\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"O-\"+","((5-redshift)+amodb(t,5))); ");
	cEf(" xsArraySetString(AdUG_initial,((5-redshift)+amodb(t,5)),\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");
	cEf(" xsArraySetString(AdUG_initial,((10-redshift)+amodb(t,5)),\"S\"+xsArrayGetInt(AdUUDisplay,t)+\"O-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" if(xsArrayGetInt(AdUUPDisplay,t)>0){ ");
//	cEf(" gadgetUnreal(\"SP\"+xsArrayGetInt(AdUUPDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");
	cEf(" xsArraySetString(AdUG_initial,((15-redshift)+amodb(t,5)),\"SP\"+xsArrayGetInt(AdUUPDisplay,t)+\"-\"+","((5-redshift)+amodb(t,5))); ");

	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	cEf(" for(s=5*dshppage;<min(5*(dshppage+1),sizeintarray(AdUSDisplay))){ ");
	cEf(" if(xsArrayGetInt(AdUSDisplay,s)!=-1){ ");
//	cEf(" gadgetUnreal(\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"-\"+","((5-greenshift)+amodb(s,5))); ");
//	cEf(" gadgetUnreal(\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"O-\"+","((5-greenshift)+amodb(s,5))); ");

	cEf(" xsArraySetString(AdUG_initial,((20-greenshift)+amodb(s,5)),\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"-\"+","((5-greenshift)+amodb(s,5))); ");
	cEf(" xsArraySetString(AdUG_initial,((25-greenshift)+amodb(s,5)),\"S\"+xsArrayGetInt(AdUSDisplay,s)+\"O-\"+","((5-greenshift)+amodb(s,5))); ");

	cEf(" } ");
	cEf(" } ");
	cEf(" } ");

//Cleans up the arrays
	cEf(" void handleadvancedtechremoval(int pa=-1, int prid=-1){ ");
	cEf(" int utid=-1; int ttid=-1; ");
	cEf(" if(prid>-1){ ");
	cEf(" for(moo=0;<xsArrayGetSize(AdUUDRType)){ ");
	cEf(" utid=xsArrayGetInt(AdUUDRType,moo); ttid=xsArrayGetInt(AdUUDRTech,moo); ");
	cEf(" if(kbProtoUnitIsType(pa,prid,UTcorrect(utid))){ ");
	cEf(" if(xsArrayGetInt(ImIC,ttid)==1){arrayremoveint(AdUUDisplay,ttid);} ");
	cEf(" else if(xsArrayGetInt(ImIC,ttid)==2){arrayremoveint(AdUSDisplay,ttid);} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");

//AdUUPDisplay
	cEf(" void updateadvancedtechprogress(int pa=-1){ ");
	cEf(" int temp=0; int tempcomplete=0; xsSetContextPlayer(pa); ");
	cEf(" resetintarray(AdUUPDisplay); ");
	cEf(" for(moo=0;<xsArrayGetSize(AdUUDisplay)){ ");
	cEf(" temp=xsArrayGetInt(AdUUDisplay,moo); ");
	cEf(" if(temp>0){tempcomplete=100*kbGetTechPercentComplete(temp);","if(InI(tempcomplete,1,99)){xsArraySetInt(AdUUPDisplay,moo,tempcomplete);}} ");
	cEf(" } ");
	cEf(" } ");


//THIS NEEDS TO BE UPDATED SO AS TO REDUCE LAG AT SOME POINT.
	cEf(" void handleadvancedtechtracking(int wtv=-1){ ");
	cEf(" int todaysquery=0; int querysize=0; int pa=-1; int prid=-1; ","int utid=-1; int ttid=-1; int ittt=-1; string output=\"\"; ");
	cEf(" for(p=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" xsSetContextPlayer(p); kbLookAtAllUnitsOnMap(); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"TechTracking\"+p); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, p, true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, UTcorrect(1509)); "); //All
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(i=0;<querysize){ ");
	cEf(" trUnitSelectClear();trUnitSelectByID(kbUnitQueryGetResult(todaysquery,i)); ");
	cEf(" if(trUnitIsSelected()){prid=kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i));pa=p;","","break;} ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" if(pa>-1){break;} ");
	cEf(" } ");
	cEf(" trUnitSelectClear(); ");
	
	cEf(" if(ATTsi==1){prid=-1;} ");

	cEf(" hiderelevanttechtracks(); ");// Basically, make these RECORD what is there only! then at the end have function that consolidates.

	cEf(" resetintarray(AdUUDisplay);resetintarray(AdUSDisplay); ");

	cEf(" if(prid>-1){passivetracking=1; ");
	cEf(" for(moo=0;<xsArrayGetSize(AdUUDType)){ ");
	cEf(" utid=xsArrayGetInt(AdUUDType,moo); ttid=xsArrayGetInt(AdUUDTech,moo); ittt=xsArrayGetInt(AdUUDTTT,moo); ");
	cEf(" if(kbProtoUnitIsType(pa,prid,UTcorrect(utid))){ ");
	cEf(" 	if(ittt==1){ ");
	cEf(" 	for(pie=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" 	if(xsArrayGetInt(PlTM,pie)==xsArrayGetInt(PlTM,pa)){ ");
	cEf(" 	xsSetContextPlayer(pie); ");
	cEf(" 	if(kbGetTechPercentComplete(ttid)>0){ ");
	cEf(" 	if(xsArrayGetInt(ImIC,ttid)==1){arrayaddintspecial(AdUUDisplay,ttid);} ");
	cEf(" 	else if(xsArrayGetInt(ImIC,ttid)==2){arrayaddintspecial(AdUSDisplay,ttid);} ");
	cEf(" 	} ");
	cEf(" 	} ");
	cEf(" 	} ");
	cEf(" 	} ");
	cEf(" 	else{ ");
	cEf(" 	if(kbGetTechPercentComplete(ttid)>0){ ");
	cEf(" 	if(xsArrayGetInt(ImIC,ttid)==1){arrayaddintspecial(AdUUDisplay,ttid);} ");
	cEf(" 	else if(xsArrayGetInt(ImIC,ttid)==2){arrayaddintspecial(AdUSDisplay,ttid);} ");
	cEf(" 	} ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" handleadvancedtechremoval(pa,prid); updateadvancedtechprogress(pa); ");
	cEf(" showrelevanttechtracks(); ");//
	cEf(" }else{passivetracking=0;} ");

	cEf(" graphicprocess(AdUG_initial,AdUG_final);resetstrarray(AdUG_initial);resetstrarray(AdUG_final); "); //may need to put this in a more appropriate place
	cEf(" } ");
	
	cEf(" void ATTpageNEXT(int wtv=-1){ATTsi=1;handleadvancedtechtracking();ATTsi=0;","dtekpage=dtekpage+1;dshppage=dshppage+1;handleadvancedtechtracking();} ");
	cEf(" void ATTpagePREV(int wtv=-1){ATTsi=1;handleadvancedtechtracking();ATTsi=0;","dtekpage=dtekpage-1;dshppage=dshppage-1;if(dtekpage<0 || dshppage<0){dtekpage=0;dshppage=0;}handleadvancedtechtracking();} ");
	cEf(" void ATTpageZERO(int wtv=-1){ATTsi=1;handleadvancedtechtracking();ATTsi=0;","dtekpage=0;dshppage=0;handleadvancedtechtracking();} ");

//	cEf(" void handleATTZero(int wtv=-1){ATTpageZERO();} ");
//Temporarily using the latter so as to reduce lag on click.
	cEf(" void handleATTZero(int wtv=-1){handleadvancedtechtracking();} ");

	cEf(" void flareraidz(int wtv=-1){ ");
	cEf(" int todaysquery=0; int querysize=0; int tID=0; int prID=0; trBlockAllSounds(); ");
	cEf(" for(pa=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" xsSetContextPlayer(pa); kbLookAtAllUnitsOnMap(); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"AllLiveMilitary\"+pa); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, pa, true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, UTcorrect(1479)); "); //MilitaryUnits
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" for(i=0;<querysize){ ");
	cEf(" tID=kbUnitGetTargetUnitID(kbUnitQueryGetResult(todaysquery,i)); ");
	cEf(" prID=kbGetUnitBaseTypeID(tID); ");
	cEf(" 	if(kbProtoUnitIsType(pa,prID,UTcorrect(1618))){ "); //1618= ValidIdleVillager
	cEf(" 	trMinimapFlare(FP,0.3,kbUnitGetPosition(tID),true); ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" } ");
	cEf(" trUnblockAllSounds(); xsSetContextPlayer(FP); ");
	cEf(" } ");

	cEf(" void sendrehostchat(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" trChatSendToPlayer(FP,"+p+",\"rehost\"); ");
}
	cEf(" } ");

	cEf(" void validateSpecUI(int wtv=-1){ ");
	cEf(" if(trIsGadgetVisible(\""+Num2Let(29)+Num2Let(8)+Num2Let(5)+Num2Let(1)+Num2Let(20)+"-"+Num2Let(47)+Num2Let(35)+"\")){trSetUserControls(false);} ");
	cEf(" } ");

	cEf(" void setAgeUpPCT(int plyr=-1,int amount=0){ ");
	for(p=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+p+"){AGE_PROG_"+p+"=amount;AGE_ING_"+p+"=1;} ");
	}
	cEf(" } ");

	cEf(" void updAgeUpTXT(int plyr=-1){ ");
	for(p=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+p+"){if(AGE_PROG_"+p+">0){AGE_TEXT_"+p+"=\"<color=0,1,0>\"+AGE_PROG_"+p+"+\"^</color> \";}else{AGE_TEXT_"+p+"=\"\";}} ");
	}
	cEf(" } ");

	cEf(" void updAgeBarArray(int plyr=-1){ ");
	cEf(" int temp=0; ");
	for(f=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+rPFromWest(f)+"){if(AGE_ING_"+rPFromWest(f)+"==1){temp=AGE_PROG_"+rPFromWest(f)+"/5;temp=temp*5;xsArraySetString(ABDisplay",","+(f-1)+",\"Spec_AgeupProgress_\"+"+(f+(2-cNumNonObsPlayers/2))+"+\"_\"+temp);xsArraySetString(BABDisplay,"+(f-1)+",\"Spec_AgeupProgress_\"+"+(f+(2-cNumNonObsPlayers/2))+"+\"_BG\");}","else{xsArraySetString(ABDisplay,"+(f-1)+",\"\");xsArraySetString(BABDisplay,"+(f-1)+",\"\");} } ");
	}
	cEf(" } ");

	//store ageupbar in a string, can be blank if necessary.
	cEf(" void processages(int wtv=-1){ ");
	for(p=1;<=cNumNonObsPlayers){
	cEf(" AGE_ING_"+p+"=0; ");
	}
	cEf(" for(plyr=1;<="+cNumNonObsPlayers+"){ ");
	cEf(" xsSetContextPlayer(plyr); ");
	cEf(" if(1<0){} ");
for(k=522; <= 528){AgeUpPCT(k);}for(k=537; <= 544){AgeUpPCT(k);}AgeUpPCT(546);AgeUpPCT(579);AgeUpPCT(580);
AgeUpPCT(597);AgeUpPCT(660);for(k=662; <= 676){AgeUpPCT(k);}for(k=684; <= 687){AgeUpPCT(k);}for(k=697; <= 704){AgeUpPCT(k);}
AgeUpPCT(1002);AgeUpPCT(1076);AgeUpPCT(1098);AgeUpPCT(1099);for(k=1144; <= 1147){AgeUpPCT(k);}
AgeUpPCT(1149);AgeUpPCT(1150);for(k=1152; <= 1163){AgeUpPCT(k);}for(k=1428; <= 1444){AgeUpPCT(k);}
for(k=1446; <= 1468){AgeUpPCT(k);}AgeUpPCT(2100);AgeUpPCT(2107);AgeUpPCT(2138);AgeUpPCT(2139);
for(k=2144; <= 2203){AgeUpPCT(k);}AgeUpPCT(2394);AgeUpPCT(2544);
//	cEf(" updAgeUpTXT(plyr); ");

	cEf(" clonestrarray(ABDisplay,ABDisplayPrior);clonestrarray(BABDisplay,BABDisplayPrior); ");
	cEf(" updAgeBarArray(plyr); ");
	cEf(" graphicprocess(ABDisplayPrior,ABDisplay);graphicprocess(BABDisplayPrior,BABDisplay); ");

	cEf(" } ");
	cEf(" } ");

	cEf(" void populatelifearrays(int wtv=-1){ ");
	cEf(" kbLookAtAllUnitsOnMap(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" xsArraySetInt(A1P"+p+",i,kbUnitCount("+p+",xsArrayGetInt(PrID,i),cUnitStateAlive)); ");
	cEf(" } ");
}
	cEf(" } ");

	cEf(" void populatequeuearrays(int wtv=-1){ ");
	cEf(" kbLookAtAllUnitsOnMap(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" xsArraySetInt(A2P"+p+",i,kbUnitCount("+p+",xsArrayGetInt(PrID,i),cUnitStateBuilding)","+kbUnitCount("+p+",xsArrayGetInt(PrID,i),cUnitStateQueued)); ");
	cEf(" } ");
}
	cEf(" } ");

//could create multiple timestamp arrays later on
	cEf(" void populatedeatharrays(int wtv=-1){ ");
	cEf(" kbLookAtAllUnitsOnMap(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" for(i=0;<"+cNumAllTypes+"){ ");
	cEf(" xsArraySetInt(A3P"+p+",i,kbUnitCount("+p+",xsArrayGetInt(PrID,i),cUnitStateDead)); ");
	cEf(" } ");
}
	cEf(" } ");

//Bunch of functions
	cEf(" string rep(int numtimes=1, string base=\" \"){ ");
	cEf(" string output=\"\"; ");
	cEf(" for(t=0; <numtimes){output=output+base;} ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" int SPlength(int number=0) { ");
	cEf(" int lt=1; int powa=10; ");
	cEf(" while(powa<=number){powa=powa*10; lt=lt+1;} ");
	cEf(" return(2*lt); ");
	cEf(" } ");

//Dead Space //CHANGE TO REMOVE RELIANCE ON TEXTUREID FUNCTION AS IT HAS BEEN SHOWN TO BE INCONSISTENT
//Maybe need CS() function for colorspace.
	cEf(" string DS(int deadspace=1, int textrID=3){ ");
	cEf(" string output=\"\"; ");
//	cEf(" output=\"<icon=\"+deadspace+\"(TextureID(\"+textrID+\"))>\"; ");
	cEf(" output=\"<icon=\"+deadspace+\"(spec/nuthin)>\"; ");
	cEf(" if(debugmode==1){return(\"<icon=\"+deadspace+\"(z)>\");} ");
	cEf(" return(output); ");
	cEf(" } ");

//Score Icons
	cEf(" string SC(int width=1, string exten=\"\"){ ");
	cEf(" string output=\"\"; ");
	cEf(" output=\"<icon=\"+width+\"(ui\ingame/\"+exten+\")>\"; ");
	cEf(" return(output); ");
	cEf(" } ");
	
//Decimal Point'd
	cEf(" string DPd(float input=0.5, int points=0){ ");
	cEf(" string output=\"\"; float temp=input; int tempint=input; int temprmd=0; ");
	cEf(" for(k=0;<points){temp=temp*10; tempint=tempint*10;} ");
	cEf(" temprmd=temp-tempint; tempint=input; ");
	cEf(" output=tempint+\".\"+temprmd; ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string colourize(string input=\"\", int plyr=-1, string colstring=\"0,0,0\"){ ");
	cEf(" string output=\"\"; ");
	cEf(" if(plyr==-1){ ");
	cEf(" output=\"<color=\"+colstring+\">\"+input+\"</color>\"; ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" output=\"<color={playerColor(\"+plyr+\")}>\"+input+\"</color>\"; ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");
	
	cEf(" string fontize(string input=\"\", string font=\"ScoreFont 12\"){ ");
	cEf(" string output=\"\"; ");
	cEf(" output=\"<font=\"+font+\">\"+input+\"</font>\"; ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string numAlign(int num=0, int maxwidth=4, int alignment=0){ ");
	cEf(" string output=\"\"; ");
	cEf(" if(alignment==0){output=num+rep(maxwidth-SPlength(num));} ");
	cEf(" else if(alignment==1){output=rep(maxwidth-SPlength(num))+num;} ");
	cEf(" else if(alignment==2){} ");
	cEf(" else if(alignment==3){output=rep(maxwidth-4)+num+rep(4-SPlength(num));} ");
	cEf(" return(output); ");
	cEf(" } ");
	
//Convert integer to 00:00 format
	cEf(" string int2time(int convert=0) { ");
	cEf(" string Ioutput=\"\"; int Imin=0; int Isec=0; ");
	cEf(" Imin=convert/60; Isec=convert-Imin*60; ");
	cEf(" if(Imin>0){Ioutput=Ioutput+Imin+\":\";} ");
	cEf(" else{Ioutput=Ioutput+\"0:\";} ");
	cEf(" if(Isec<10){Ioutput=Ioutput+\"0\"+Isec;} else{Ioutput=Ioutput+Isec;} ");
	cEf(" return(Ioutput); ");
	cEf(" } ");

	cEf(" string displayR(int input=0){ ");
	cEf(" string output=\"\"; int length=SPlength(input); ");
	cEf(" if(input<1){output=DS(disR1);} ");
	cEf(" else if(length==2){ ");
	cEf(" output=output+DS(disR2)+input; ");
	cEf(" } ");
	cEf(" else if(length==4){ ");
	cEf(" output=output+DS(disR3)+input; ");
	cEf(" } ");
	cEf(" else if(length==6){ ");
	cEf(" output=output+DS(disR4)+input; ");
	cEf(" } ");

	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string displayT(int input=0){ ");
	cEf(" string output=\"\"; ");
	cEf(" output=output+int2time(input); ");
	cEf(" if(input<600){output=DS(disT1)+output;} ");
	cEf(" if(input<0){output=DS(disT2);} ");
	cEf(" return(output); ");
	cEf(" } ");

//Handles shipment stuff
if(true){

	cEf(" int extraXP(int plyr=-1){ ");
	cEf(" int current=kbResourceGetXP(plyr); ");
	cEf(" int deduct=0; ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+p+"){deduct=P"+p+"StartXP;} ");
}
	cEf(" return(current-deduct); ");
	cEf(" } ");

if(true){
	cEf(" int SHPperc(int civ=1, float XP=0) { ");
	cEf(" int perc=0; int temp=0;");
//Spain
	cEf(" if(civ==1){ ");
	cEf(" 	if(XP<225){perc=100*XP/225;} ");
xpPC(484,225,259);xpPC(782,484,298);xpPC(1124,782,342);xpPC(1517,1124,393);
xpPC(1969,1517,452);xpPC(2490,1969,521);xpPC(3089,2490,599);
xpPC(3777,3089,688);xpPC(4568,3777,791);xpPC(5478,4568,910);
xpPC(6526,5478,1048);xpPC(7729,6526,1203);xpPC(9113,7729,1384);
xpPC(10706,9113,1593);xpPC(12536,10706,1830);xpPC(14642,12536,2106);
xpPC(17064,14642,2422);xpPC(19563,17064,2499);
	cEf(" 	else {temp=(XP-19563)/2500; perc=(XP-19563-temp*2500)/25;} ");
	cEf(" } ");
//Germany
	cEf(" else if(civ==7){ ");
	cEf(" 	if(XP<330){perc=100*XP/330;} ");
xpPC(710,330,380);xpPC(1146,710,436);xpPC(1648,1146,502);xpPC(2225,1648,577);
xpPC(2889,2225,664);xpPC(3652,2889,763);xpPC(4530,3652,878);xpPC(5539,4530,1009);
xpPC(6700,5539,1161);xpPC(8035,6700,1335);xpPC(9571,8035,1536);
xpPC(11336,9571,1765);xpPC(13367,11336,2031);xpPC(15701,13367,2334);xpPC(18202,15701,2501);
	cEf(" 	else {temp=(XP-18202)/2500; perc=(XP-18202-temp*2500)/25;} ");
	cEf(" } ");
//Japan and China
	cEf(" else if(civ==19 || civ==20){ ");
	cEf(" 	if(XP<301){perc=100*XP/301;} ");
xpPC(647,301,346);xpPC(1045,647,398);xpPC(1505,1045,460);xpPC(2037,1505,532);
xpPC(2652,2037,615);xpPC(3366,2652,714);xpPC(4193,3366,827);xpPC(5153,4193,960);
xpPC(6269,5153,1116);xpPC(7570,6269,1301);xpPC(9064,7570,1494);xpPC(10784,9064,1720);
xpPC(12762,10784,1978);xpPC(15035,12762,2273);xpPC(17535,15035,2500);
	cEf(" 	else {temp=(XP-17535)/2500; perc=(XP-17535-temp*2500)/25;} ");
	cEf(" } ");
//India
	cEf(" else if(civ==21){ ");
	cEf(" 	if(XP<324){perc=100*XP/324;} ");
xpPC(697,324,373);xpPC(1125,697,428);xpPC(1618,1125,493);
xpPC(2185,1618,567);xpPC(2836,2185,651);xpPC(3585,2836,749);
xpPC(4447,3585,862);xpPC(5439,4447,992);xpPC(6578,5439,1139);
xpPC(7889,6578,1311);xpPC(9397,7889,1508);xpPC(11130,9397,1733);
xpPC(13123,11130,1993);xpPC(15416,13123,2293);xpPC(17916,15416,2500);
	cEf(" 	else {temp=(XP-17916)/2500; perc=(XP-17916-temp*2500)/25;} ");
	cEf(" } ");
//Others
	cEf(" else { ");
	cEf(" 	if(XP<300){perc=100*XP/300;} ");
xpPC(645,300,345);xpPC(1042,645,397);xpPC(1498,1042,456);xpPC(2023,1498,525);
xpPC(2626,2023,603);xpPC(3320,2626,694);xpPC(4118,3320,798);
xpPC(5036,4118,918);xpPC(6091,5036,1055);
xpPC(7304,6091,1213);xpPC(8701,7304,1397);
xpPC(10305,8701,1604);xpPC(12152,10305,1847);xpPC(14274,12152,2122);
xpPC(16716,14274,2442);xpPC(19215,16716,2499);
	cEf(" 	else {temp=(XP-19215)/2500; perc=(XP-19215-temp*2500)/25;} ");
	cEf(" } ");
	cEf(" return(perc); ");
	cEf(" } ");
}

//add a variable which processes revolt one-time  if a nub has revolted.
	cEf(" bool hasRevolted(int plyr=-1){ ");
	cEf(" bool output=false; ");
	cEf(" xsSetContextPlayer(plyr); ");
	cEf(" for(d=1531;<=1538){ ");
	cEf(" if(kbGetTechPercentComplete(d)==1){output=true; break;} ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string agetext(int plyr=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" if(plyr=="+p+"){return(AGE_TEXT_"+p+");} ");
}
	cEf(" return(\"\"); ");
	cEf(" } ");

	cEf(" int numTPLC(int plyr=-1){ ");
	cEf(" int result=0; ");
	cEf(" for(i=0;<xsArrayGetSize(TPids)){if(trPlayerControlsSocket(plyr,\"\"+xsArrayGetInt(TPids,i))){result++;}} ");
	cEf(" return(result); ");
	cEf(" } ");
	
	cEf(" void echoSTARTLOCS(int wtv=-1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" kat(\"Player "+p+" position: ("+rmPlayerLocXFraction(p)+","+rmPlayerLocZFraction(p)+")\"); ");
}
	cEf(" } ");

//Assuming it is a non-silk-road TP setting.
	cEf(" string plyrTPHeader(int plyr=-1,int TPHL=600){ ");
	cEf(" string output=rep(6); int numTRS=0; int numTPs=0; int numSRTPs=0; int TPHds=TPHL; xsSetContextPlayer(plyr); ");
	cEf(" numTPs=kbUnitCount(plyr,292,2); numSRTPs=kbUnitCount(plyr,1303,2); ");
	cEf(" numTRS=numTPLC(plyr); ");
	cEf(" for(t=0;<numTRS+numSRTPs){output=output+SC(16,\"trade_route\"); TPHds=TPHds-16;} ");
	cEf(" for(t=0;<(numTPs-numTRS)){output=output+SC(16,\"native_settlement\"); TPHds=TPHds-16;} ");
	cEf(" return(DS(TPHds)+output); ");
	cEf(" } ");

	cEf(" string popInfo(int plyr=-1){ ");
	cEf(" string output=\"\"; int popProj=0; int popSpace=0; int totlh=0; ");
	cEf(" xsSetContextPlayer(plyr); ");
	cEf(" popProj=kbGetPop(); popSpace=kbGetPopCap(); ");
	cEf(" totlh=14-SPlength(popProj)-SPlength(popSpace); ");
	cEf(" totlh=totlh/2; ");
	cEf(" output=rep(totlh)+popProj+\" / \"+popSpace+rep(totlh); ");
	cEf(" if(popProj>=popSpace){ ");
	cEf(" output=\"<bgcolor=1,1,1,0.5><color=1,0,0>\"+output+\"</color></bgcolor>\"; ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string plyrHeader1(int plyr=-1){ ");
	cEf(" int curAge=kbGetAgeForPlayer(plyr); ");
	cEf(" string output=SC(16,\"score_age_\"+(curAge+1))+popInfo(plyr); ");
	cEf(" if(curAge==3){if(hasRevolted(plyr)){output=SC(16,\"score_revolution\")+popInfo(plyr);}} ");
	cEf(" output=DS(headerstarter)+output+rep(tpsubspacing2); ");
	cEf(" return(output+plyrTPHeader(plyr,tpbigspacing2)); ");
	cEf(" } ");

	cEf(" string plyrHeader2(int plyr1=-1, int plyr2=-2){ ");
	cEf(" int curAge=kbGetAgeForPlayer(plyr1); ");
	cEf(" string output=SC(16,\"score_age_\"+(curAge+1))+popInfo(plyr1); ");
	cEf(" if(curAge==3){if(hasRevolted(plyr1)){output=SC(16,\"score_revolution\")+popInfo(plyr1);}} ");
	cEf(" output=DS(headerstarter)+output+rep(tpsubspacing4); ");
	cEf(" output=output+plyrTPHeader(plyr1,tpbigspacing4); ");
	cEf(" curAge=kbGetAgeForPlayer(plyr2); ");
	cEf(" output=output+DS(headerstarter)+SC(16,\"score_age_\"+(curAge+1))+popInfo(plyr2); ");
	cEf(" if(curAge==3){if(hasRevolted(plyr2)){output=output+DS(headerstarter)+","SC(16,\"score_revolution\")+popInfo(plyr2);}} ");
	cEf(" output=output+rep(tpsubspacing4); ");
	cEf(" output=output+plyrTPHeader(plyr2,tpbigspacing4); ");
	cEf(" return(output); ");
	cEf(" } ");

for(r=0;<3){
	cEf(" int kbGetResIncome"+r+"(int plyr=-1){ ");
	cEf(" int result=0; ");
for(p=1;<=cNumNonObsPlayers){cEf(" if(plyr=="+p+"){result=Del"+resName(r)+"_"+p+"; return(result);} ");}
	cEf(" return(result); ");
	cEf(" } ");
}
	cEf(" int kbGetResIncome7(int plyr=-1){ ");
	cEf(" int result=0; ");
for(p=1;<=cNumNonObsPlayers){cEf(" if(plyr=="+p+"){result=DelTrade_"+p+"; return(result);} ");}
	cEf(" return(result); ");
	cEf(" } ");



for(r=0;<4){
	cEf(" int kbPopGathr"+resName(r)+"(int plyr=-1){ ");
for(p=1;<=cNumNonObsPlayers){cEf(" if(plyr=="+p+"){return(PopGathr"+resName(r)+"_"+p+");} ");}
	cEf(" return(0); ");
	cEf(" } ");
}

for(r=-1;<3){
	cEf(" int kbDeadCost"+resName(r)+"(int plyr=-1){ ");
for(p=1;<=cNumNonObsPlayers){cEf(" if(plyr=="+p+"){return(DeadCost"+resName(r)+"_"+p+");} ");}
	cEf(" return(0); ");
	cEf(" } ");
}

////
	cEf(" string resLine1(int plyr1=1){ ");
	cEf(" string output=\"\"; ");
	cEf(" int val1=0; int val2=0; int val3=0; int val4=0; ");
	cEf(" int left=0; int rite=0; ");
	cEf(" string str1=\"\"; string str2=\"\"; string str3=\"\"; string str4=\"\"; ");
	cEf(" if(ResDispType==1){ ");
	cEf(" xsSetContextPlayer(plyr1); ");
	cEf(" val1=kbResourceGet(2); val2=kbResourceGet(1); ");
	cEf(" val3=kbResourceGet(0); val4=kbResourceGet(7); ");
	cEf(" } ");
	cEf(" else if(ResDispType==2){ ");
	cEf(" xsSetContextPlayer(plyr1); ");
	cEf(" val1=kbTotalResourceGet(2); val2=kbTotalResourceGet(1); ");
	cEf(" val3=kbTotalResourceGet(0); val4=kbTotalResourceGet(7); ");
	cEf(" } ");
	cEf(" else if(ResDispType==3){ ");
	cEf(" val1=kbGetResIncome2(plyr1); val2=kbGetResIncome1(plyr1); ");
	cEf(" val3=kbGetResIncome0(plyr1); val4=kbGetResIncome7(plyr1); ");
	cEf(" } ");
	cEf(" else if(ResDispType==4){ ");
	cEf(" val1=kbDeadCostFood(plyr1); val2=kbDeadCostWood(plyr1); ");
	cEf(" val3=kbDeadCostGold(plyr1); val4=kbDeadCostTrade(plyr1); ");
	cEf(" } ");

	cEf(" if(ResDispType==1 || ResDispType==2 || ResDispType==4){ ");
	cEf(" str1=str1+numAlign(val1,11); ");
	cEf(" str2=str2+numAlign(val2,11); ");
	cEf(" str3=str3+numAlign(val3,11); ");
	cEf(" str4=str4+numAlign(val4,11); ");
	cEf(" } ");
	cEf(" else if(ResDispType==3){ ");
	cEf(" left=val1/100; rite=val1-left*100; ");
	cEf(" str1=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val2/100; rite=val2-left*100; ");
	cEf(" str2=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val3/100; rite=val3-left*100; ");
	cEf(" str3=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val4/100; rite=val4-left*100; ");
	cEf(" str4=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" } ");
	cEf(" str1=SC(35,\"resource_food\")+str1; ");
	cEf(" str2=SC(35,\"resource_wood\")+str2; ");
	cEf(" str3=SC(35,\"resource_gold\")+str3; ");
	cEf(" str4=SC(35,\"resource_trade\")+str4; ");

	cEf(" if(showGperR==1){ ");
	cEf(" str1=numAlign(kbPopGathrFood(plyr1),4)+str1; ");
	cEf(" str2=numAlign(kbPopGathrWood(plyr1),4)+str2; ");
	cEf(" str3=numAlign(kbPopGathrGold(plyr1),4)+str3; ");
	cEf(" str4=numAlign(kbPopGathrIdle(plyr1),4)+str4; ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" str1=str1+rep(4); ");
	cEf(" str2=str2+rep(4); ");
	cEf(" str3=str3+rep(4); ");
	cEf(" str4=str4+rep(4); ");
	cEf(" } ");
	cEf(" output=output+str1+\"\n\"; ");
	cEf(" output=output+str2+\"\n\"; ");
	cEf(" output=output+str3+\"\n\"; ");
	cEf(" if(plyr1==resline1player){ ");
	cEf(" output=output+str4+cumstring(Gtext,0,Glinewidth); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" output=output+str4+cumstring(Gtext,Glinewidth,2*Glinewidth); ");
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");
////
	cEf(" string resLine2(int plyr1=1, int plyr2=2){ ");
	cEf(" string output=\"\"; ");
	cEf(" int val1=0; int val2=0; int val3=0; int val4=0; ");
	cEf(" int val5=0; int val6=0; int val7=0; int val8=0; ");
	cEf(" int left=0; int rite=0; ");
	cEf(" string str1=\"\"; string str2=\"\"; string str3=\"\"; string str4=\"\"; ");
	cEf(" string str5=\"\"; string str6=\"\"; string str7=\"\"; string str8=\"\"; ");
	cEf(" if(ResDispType==1){ ");
	cEf(" xsSetContextPlayer(plyr1); ");
	cEf(" val1=kbResourceGet(2); val2=kbResourceGet(1); ");
	cEf(" val3=kbResourceGet(0); val4=kbResourceGet(7); ");
	cEf(" xsSetContextPlayer(plyr2); ");
	cEf(" val5=kbResourceGet(2); val6=kbResourceGet(1); ");
	cEf(" val7=kbResourceGet(0); val8=kbResourceGet(7); ");
	cEf(" } ");
	cEf(" else if(ResDispType==2){ ");
	cEf(" xsSetContextPlayer(plyr1); ");
	cEf(" val1=kbTotalResourceGet(2); val2=kbTotalResourceGet(1); ");
	cEf(" val3=kbTotalResourceGet(0); val4=kbTotalResourceGet(7); ");
	cEf(" xsSetContextPlayer(plyr2); ");
	cEf(" val5=kbTotalResourceGet(2); val6=kbTotalResourceGet(1); ");
	cEf(" val7=kbTotalResourceGet(0); val8=kbTotalResourceGet(7); ");
	cEf(" } ");
	cEf(" else if(ResDispType==3){ ");
	cEf(" val1=kbGetResIncome2(plyr1); val2=kbGetResIncome1(plyr1); ");
	cEf(" val3=kbGetResIncome0(plyr1); val4=kbGetResIncome7(plyr1); ");
	cEf(" val5=kbGetResIncome2(plyr2); val6=kbGetResIncome1(plyr2); ");
	cEf(" val7=kbGetResIncome0(plyr2); val8=kbGetResIncome7(plyr2); ");
	cEf(" } ");
	cEf(" else if(ResDispType==4){ ");
	cEf(" val1=kbDeadCostFood(plyr1); val2=kbDeadCostWood(plyr1); ");
	cEf(" val3=kbDeadCostGold(plyr1); val4=kbDeadCostTrade(plyr1); ");
	cEf(" val5=kbDeadCostFood(plyr2); val6=kbDeadCostWood(plyr2); ");
	cEf(" val7=kbDeadCostGold(plyr2); val8=kbDeadCostTrade(plyr2); ");
	cEf(" } ");

	cEf(" if(ResDispType==1 || ResDispType==2 || ResDispType==4){ ");
	cEf(" str1=str1+numAlign(val1,11); ");
	cEf(" str2=str2+numAlign(val2,11); ");
	cEf(" str3=str3+numAlign(val3,11); ");
	cEf(" str4=str4+numAlign(val4,11); ");
	cEf(" str5=str5+numAlign(val5,11); ");
	cEf(" str6=str6+numAlign(val6,11); ");
	cEf(" str7=str7+numAlign(val7,11); ");
	cEf(" str8=str8+numAlign(val8,11); ");
	cEf(" } ");
	cEf(" else if(ResDispType==3){ ");
	cEf(" left=val1/100; rite=val1-left*100; ");
	cEf(" str1=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val2/100; rite=val2-left*100; ");
	cEf(" str2=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val3/100; rite=val3-left*100; ");
	cEf(" str3=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val4/100; rite=val4-left*100; ");
	cEf(" str4=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val5/100; rite=val5-left*100; ");
	cEf(" str5=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val6/100; rite=val6-left*100; ");
	cEf(" str6=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val7/100; rite=val7-left*100; ");
	cEf(" str7=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" left=val8/100; rite=val8-left*100; ");
	cEf(" str8=left+\".\"+rite+rep(10-SPlength(left)-SPlength(rite)); ");
	cEf(" } ");

	cEf(" str1=SC(35,\"resource_food\")+str1; ");
	cEf(" str2=SC(35,\"resource_wood\")+str2; ");
	cEf(" str3=SC(35,\"resource_gold\")+str3; ");
	cEf(" str4=SC(35,\"resource_trade\")+str4; ");
	cEf(" str5=SC(35,\"resource_food\")+str5; ");
	cEf(" str6=SC(35,\"resource_wood\")+str6; ");
	cEf(" str7=SC(35,\"resource_gold\")+str7; ");
	cEf(" str8=SC(35,\"resource_trade\")+str8; ");

	cEf(" if(showGperR==1){ ");
	cEf(" str1=numAlign(kbPopGathrFood(plyr1),4)+str1; ");
	cEf(" str2=numAlign(kbPopGathrWood(plyr1),4)+str2; ");
	cEf(" str3=numAlign(kbPopGathrGold(plyr1),4)+str3; ");
	cEf(" str4=numAlign(kbPopGathrIdle(plyr1),4)+str4; ");
	cEf(" str5=numAlign(kbPopGathrFood(plyr2),4)+str5; ");
	cEf(" str6=numAlign(kbPopGathrWood(plyr2),4)+str6; ");
	cEf(" str7=numAlign(kbPopGathrGold(plyr2),4)+str7; ");
	cEf(" str8=numAlign(kbPopGathrIdle(plyr2),4)+str8; ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" str1=str1+rep(4); ");
	cEf(" str2=str2+rep(4); ");
	cEf(" str3=str3+rep(4); ");
	cEf(" str4=str4+rep(4); ");
	cEf(" str5=str5+rep(4); ");
	cEf(" str6=str6+rep(4); ");
	cEf(" str7=str7+rep(4); ");
	cEf(" str8=str8+rep(4); ");
	cEf(" } ");

	cEf(" output=output+str1+DS(reslinespacing)+str5+\"\n\"; ");
	cEf(" output=output+str2+DS(reslinespacing)+str6+\"\n\"; ");
	cEf(" output=output+str3+DS(reslinespacing)+str7+\"\n\"; ");

	cEf(" if(plyr1==resline1player){ ");
	cEf(" output=output+str4+cumstring(Gtext,0,Glinewidth/2-1)+str8+cumstring(Gtext,Glinewidth/2+1,Glinewidth); ");
	cEf(" } ");
	cEf(" else if(plyr1==resline2player){ ");
	cEf(" output=output+str4+cumstring(Gtext,Glinewidth,1.5*Glinewidth-1)+str8+cumstring(Gtext,1.5*Glinewidth+1,2*Glinewidth); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" output=output+str4+cumstring(Gtext,2*Glinewidth,2.5*Glinewidth-1)+str8+cumstring(Gtext,2.5*Glinewidth+1,3*Glinewidth); ");
	cEf(" } ");

	cEf(" return(output); ");
	cEf(" } ");
////FIX THIS LATER! FOR NOW FIX SCROLLING/INFO AS WELL AS TOGGLE DESIGN FOR E.G. SHOW G PER R
////FIX SCOREBOARD NOW AS WELL. LOOKS LIKE COLOUR BG IS BEST
	cEf(" string shipInfo(int wtv=-1){ ");
	cEf(" string output=\"\"+DS(shpdetailsstarter"+cNumNonObsPlayers+"); ");
	cEf(" int numShipments=0; ");
if(cTeamSize==1){
	cEf(" xsSetContextPlayer(column1player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column2player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(sbdeadspace+shpdetailsspacing)+numAlign(numShipments,4,1); ");
}
else if(cTeamSize==2){
	cEf(" xsSetContextPlayer(column1player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column2player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column3player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(sbdeadspace+shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column4player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
}
else if(cTeamSize==3){
	cEf(" xsSetContextPlayer(column1player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column2player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column3player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column4player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(sbdeadspace+shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column5player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
	cEf(" xsSetContextPlayer(column6player); numShipments=kbResourceGet(6); ");
	cEf(" output=output+DS(shpdetailsspacing)+numAlign(numShipments,4,1); ");
}
	cEf(" return(output); ");
	cEf(" } ");

	cEf(" string progBar(int plyr=-1){ ");
	cEf(" string output=\"\"; xsSetContextPlayer(plyr); int civid=kbGetCiv();");
	cEf(" int numBars=(SHPperc(civid,extraXP(plyr))*shpbarlength)/100; ");
	cEf(" output=colourize(rep(numBars,\"'\"),-1,\"0,1,0.2\"); ");
	cEf(" output=output+colourize(rep(shpbarlength-numBars,\"'\"),-1); ");
	cEf(" return(output); ");
	cEf(" } ");
	
	cEf(" string daGraphic(float val1=0, float val2=0, float val3=0, float val4=0, float val5=0, float val6=0, int DP=0){ ");
	cEf(" string output=\"\"; int maxlength=5; float total=val1+val2+val3+val4+val5+val6; ");
	cEf(" int leftVAL=0; int rightVAL=0; int tempINT=0; float tempFLT=0; ");
	cEf(" string leftSTR=\"\"; string rightSTR=\"\"; ");
	cEf(" if(total==0){ ");
	cEf(" output=\"N/A\"; ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" if(SPlength(total)+1>maxlength){maxlength=SPlength(total)+1;} ");
if(cTeamSize==1){
	cEf(" leftVAL=val1; rightVAL=val2; ");
	cEf(" if(DP>0){leftSTR=DPd(val1,DP)+rep(maxlength-SPlength(leftVAL)); ");
	cEf(" rightSTR=rep(maxlength-SPlength(rightVAL))+DPd(val2,DP);} ");
	cEf(" else{leftSTR=numAlign(leftVAL,maxlength); ");
	cEf(" rightSTR=numAlign(rightVAL,maxlength,1);} ");
	cEf(" output=output+leftSTR; ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" tempFLT=(0.5+(val"+p+"*graphiclength)/total); tempINT=tempFLT; ");
	cEf(" output=output+\"<icon=\"+tempINT+\"(effects\impacts\4by4whitesquare)({playerColor(\"+column"+p+"player+\")})>\"; ");
if(p==1){cEf(" output=output+\"<icon=(3)(effects\impacts\4by4whitesquare)(0)>\"; ");}
}
	cEf(" output=output+rightSTR; ");
}
else if(cTeamSize==2){
	cEf(" leftVAL=(val1+val2); rightVAL=(val3+val4); ");
	cEf(" if(DP>0){leftSTR=DPd(val1+val2,DP)+rep(maxlength-SPlength(leftVAL)); ");
	cEf(" rightSTR=rep(maxlength-SPlength(rightVAL))+DPd(val3+val4,DP);} ");
	cEf(" else{leftSTR=numAlign(leftVAL,maxlength); ");
	cEf(" rightSTR=numAlign(rightVAL,maxlength,1);} ");
	cEf(" output=output+leftSTR; ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" tempFLT=(0.5+(val"+p+"*graphiclength)/total); tempINT=tempFLT; ");
	cEf(" output=output+\"<icon=\"+tempINT+\"(effects\impacts\4by4whitesquare)({playerColor(\"+column"+p+"player+\")})>\"; ");
if(p==2){cEf(" output=output+\"<icon=(3)(effects\impacts\4by4whitesquare)(0)>\"; ");}
}
	cEf(" output=output+rightSTR; ");
}
else if(cTeamSize==3){
	cEf(" leftVAL=(val1+val2+val3); rightVAL=(val4+val5+val6); ");
	cEf(" if(DP>0){leftSTR=DPd(val1+val2+val3,DP)+rep(maxlength-SPlength(leftVAL)); ");
	cEf(" rightSTR=rep(maxlength-SPlength(rightVAL))+DPd(val4+val5+val6,DP);} ");
	cEf(" else{leftSTR=numAlign(leftVAL,maxlength); ");
	cEf(" rightSTR=numAlign(rightVAL,maxlength,1);} ");
	cEf(" output=output+leftSTR; ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" tempFLT=(0.5+(val"+p+"*graphiclength)/total); tempINT=tempFLT; ");
	cEf(" output=output+\"<icon=\"+tempINT+\"(effects\impacts\4by4whitesquare)({playerColor(\"+column"+p+"player+\")})>\"; ");
if(p==3){cEf(" output=output+\"<icon=(3)(effects\impacts\4by4whitesquare)(0)>\"; ");}
}
	cEf(" output=output+rightSTR; ");
}
	cEf(" } ");
	cEf(" return(output); ");
	cEf(" } ");



//If adjust, we include cdb and banks as 1.25 and 4.25?
	cEf(" string popGraphic(int wtv=-1){ ");
	cEf(" string output=\"\"; int totalpopVil=0; int totalpopMil=0; ");
	cEf(" string mpstring=\"Military Unit Population\"; ");
	cEf(" string epstring=\"Economic Unit Population\"; ");
	cEf(" if(adjustecopop==1){epstring=\"Recalculated Economic Unit Population\";} ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer(column"+p+"player); ");
	cEf(" int popVil"+p+"=0; int popMil"+p+"=0; ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,284,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+2*kbUnitCount(column"+p+"player,510,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,379,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,517,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,721,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,928,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,1130,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,1047,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,315,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+kbUnitCount(column"+p+"player,1109,2); ");

	cEf(" popMil"+p+"=popMil"+p+"+trPlayerGetPopulation(column"+p+"player)-popVil"+p+"; ");

	cEf(" if(adjustecopop==1){ ");
	cEf(" popVil"+p+"=popVil"+p+"+4*kbUnitCount(column"+p+"player,338,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+4*kbUnitCount(column"+p+"player,963,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+10*kbUnitCount(column"+p+"player,348,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+0.8*kbUnitCount(column"+p+"player,971,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+0.25*kbUnitCount(column"+p+"player,379,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+0.25*kbUnitCount(column"+p+"player,517,2); ");

	cEf(" popVil"+p+"=popVil"+p+"+2.00*kbUnitCount(column"+p+"player,1136,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+2.00*kbUnitCount(column"+p+"player,1151,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+2.00*kbUnitCount(column"+p+"player,1152,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+2.00*kbUnitCount(column"+p+"player,1153,2); ");

	cEf(" popVil"+p+"=popVil"+p+"+5.00*kbUnitCount(column"+p+"player,1217,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+8.00*kbUnitCount(column"+p+"player,1218,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+11.00*kbUnitCount(column"+p+"player,1219,2); ");
	cEf(" popVil"+p+"=popVil"+p+"+12.00*kbUnitCount(column"+p+"player,1220,2); ");
	
	cEf(" if(kbGetTechPercentComplete(1677)==1){popVil"+p+"=popVil"+p+"+2;} ");
	cEf(" if(kbGetTechPercentComplete(2292)==1){popVil"+p+"=popVil"+p+"+2;} ");
	
	cEf(" if(kbGetTechPercentComplete(1678)==1){popVil"+p+"=popVil"+p+"+2.5;} ");
	cEf(" if(kbGetTechPercentComplete(2293)==1){popVil"+p+"=popVil"+p+"+2.5;} ");
	cEf(" if(kbGetTechPercentComplete(2319)==1){popVil"+p+"=popVil"+p+"+2.5;} ");
	
	cEf(" if(kbGetTechPercentComplete(1676)==1){popVil"+p+"=popVil"+p+"+2;} ");
	cEf(" if(kbGetTechPercentComplete(2291)==1){popVil"+p+"=popVil"+p+"+2;} ");
	
	cEf(" if(kbGetTechPercentComplete(1726)==1){popVil"+p+"=popVil"+p+"+2.3;} ");
	cEf(" if(kbGetTechPercentComplete(1803)==1){popVil"+p+"=popVil"+p+"+4;} ");
	
	cEf(" if(kbGetTechPercentComplete(2434)==1){popVil"+p+"=popVil"+p+"+1.8;} ");
	cEf(" if(kbGetTechPercentComplete(2435)==1){popVil"+p+"=popVil"+p+"+1.8;} ");
	
	cEf(" if(kbGetTechPercentComplete(2444)==1){popVil"+p+"=popVil"+p+"+1.2;} ");
	
	cEf(" } ");

	cEf(" totalpopVil=totalpopVil+popVil"+p+"; totalpopMil=totalpopMil+popMil"+p+"; ");
}

if(cTeamSize==1){
	cEf(" output=output+\"<font=GraphicLabel 10>\"+mpstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popMil1,popMil2); ");
	cEf(" output=output+\"\n<font=GraphicLabel 10> \n\"+epstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popVil1,popVil2); ");
}
else if(cTeamSize==2){
	cEf(" output=output+\"<font=GraphicLabel 10>\"+mpstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popMil1,popMil2,popMil3,popMil4); ");
	cEf(" output=output+\"\n<font=GraphicLabel 10> \n\"+epstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popVil1,popVil2,popVil3,popVil4); ");
}
else if(cTeamSize==3){
	cEf(" output=output+\"<font=GraphicLabel 10>\"+mpstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popMil1,popMil2,popMil3,popMil4,popMil5,popMil6); ");
//	cEf(" output=output+\"\n \n\"; ");
	cEf(" output=output+\"\n<font=GraphicLabel 10> \n\"+epstring+\"</font>\n\"; ");
	cEf(" output=output+daGraphic(popVil1,popVil2,popVil3,popVil4,popVil5,popVil6); ");
}
	cEf(" return(output); ");
	cEf(" } ");
}
//---------------------------------------------------------
//By far the most important function
if(true){
	cEf(" void populatestatsgraphic(int plyr=-1, int type=-1, int length=0) { ");
	cEf(" string Gdisplaydelta=\"\"; int tempcol=-1; int tempbase=0; string temppicpath=\"\"; string RGB=\"\"; ");
	cEf(" int temppct=0; int temporigtype=0; ");
	cEf(" int startindex=0; "); //change according to logic. no scrolling. always show last few.
	cEf(" int tB1=0; int tB2=0; int tB3=0; int tB4=0; int tB5=0; int tB6=0;");
	cEf(" int tC2=0; int tC4=0; int tC5=0; int tF1=0; int tF2=0; int tC7=0; int tC8=0; ");
	
	cEf(" if(Gcumwidth==0){startindex=scrollingindex1;} ");
	cEf(" else if(Gcumwidth==Glinewidth){startindex=scrollingindex2;} ");
	cEf(" else if(Gcumwidth<Glinewidth){startindex=scrollingindex3;} ");
	cEf(" else if(Gcumwidth<2*Glinewidth){startindex=scrollingindex4;} ");
	cEf(" else if(Gcumwidth==2*Glinewidth){startindex=scrollingindex5;} ");
	cEf(" else if(Gcumwidth<3*Glinewidth){startindex=scrollingindex6;} ");
	
	cEf(" if(plyr==1){tB1=B1P1;tB2=B2P1;tB3=B3P1;tB4=B4P1;tB5=B5P1;tB6=B6P1; ");
	cEf(" tC2=C2P1;tC4=C4P1;tC5=C5P1;tF1=F1P1;tF2=F2P1;tC7=C7P1;tC8=C8P1;} ");
for(p=2;<=cNumNonObsPlayers){
	cEf(" else if(plyr=="+p+"){tB1=B1P"+p+";tB2=B2P"+p+";tB3=B3P"+p+";tB4=B4P"+p+";tB5=B5P"+p+";tB6=B6P"+p+"; ");
	cEf(" tC2=C2P"+p+";tC4=C4P"+p+";tC5=C5P"+p+";tF1=F1P"+p+";tF2=F2P"+p+";tC7=C7P"+p+";tC8=C8P"+p+";} ");
}
	cEf(" for(r=0;<length){ ");
	cEf(" temporigtype=xsArrayGetInt(Gtype,Gcumwidth+r); ");
if(cNumNonObsPlayers==2){
	cEf(" if(type==6 && temporigtype!=6){gadgetUnreal(\"RTD-\"+(Gcumwidth+r)+\"-P\"+xsArrayGetInt(Gplyr,Gcumwidth+r));} ");
	cEf(" else if(type!=6 && temporigtype==6){gadgetReal(\"RTD-\"+(Gcumwidth+r)+\"-P\"+plyr);","xsArraySetString(GgrafixTOP,Gcumwidth+r,\"\");} ");
}
else{
	cEf(" if(type!=6 && temporigtype==6){xsArraySetString(GgrafixTOP,Gcumwidth+r,\"\");} ");
}
	cEf(" if(temporigtype==1337 || temporigtype==-1){gadgetReal(\"RTD-MO\"+(Gcumwidth+r));} ");
	cEf(" } ");
	
	cEf(" xsSetContextPlayer(plyr); ");

	cEf(" if(type<4){ ");
	cEf(" if(startindex==-1){startindex=0;} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tB1+type,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" temppicpath=unitart(tempbase,plyr); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==4){ ");
	cEf(" if(startindex==-1){startindex=0;} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tB1+type,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" temppicpath=unitart(tempbase,plyr); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==5){ ");
	cEf(" if(startindex==-1){startindex=0;} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tB6,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" temppicpath=unitart(tempbase,plyr); ");
	cEf(" if(tempbase>-1){RGB=\"(1,.2,.2)\";}else{RGB=\"\";} ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")\"+RGB+\">\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==6){ ");
	cEf(" if(startindex==-1){startindex=0;} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tC4,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" temppicpath=techart(tempbase); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" temppct=100*kbGetTechPercentComplete(tempbase); ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" if(temppct>0 && MusicOverAesthetics!=1){","xsArraySetString(GgrafixTOP,Gcumwidth+k,\"<icon=(\"+Gcellwidth+\")(spec\prog\R\"+temppct+\")>\");} ");
	cEf(" else{xsArraySetString(GgrafixTOP,Gcumwidth+k,\"\");} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==7){ ");
	cEf(" if(startindex==-1){startindex=max(0,arraylengthint(tC2)-length);} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tC2,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" xsArraySetInt(Gindex,Gcumwidth+k,startindex+k); ");
	cEf(" temppicpath=techart(tempbase); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==8){ ");
	cEf(" if(startindex==-1){startindex=max(0,arraylengthint(tC5)-length);} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tC5,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" xsArraySetInt(Gindex,Gcumwidth+k,startindex+k); ");
	cEf(" temppicpath=techart(tempbase); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==9){ ");
	cEf(" if(startindex==-1){startindex=0;} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tF1,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" xsArraySetInt(Gindex,Gcumwidth+k,startindex+k); ");
	cEf(" temppicpath=unitart(tempbase,plyr); ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" else if(type==10){ ");
	cEf(" if(startindex==-1){startindex=max(0,arraylengthint(tC7)-length);} ");
	cEf(" for(k=0;<length){ ");
	cEf(" tempcol=xsArrayGetInt(Gplyr,Gcumwidth+k); ");
	cEf(" tempbase=xsArrayGetInt(tC7,startindex+k); ");
	cEf(" if(tempcol!=plyr){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+tempcol); ");
	cEf(" gadgetReal(\"RTD-\"+(Gcumwidth+k)+\"-P\"+plyr); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+k,plyr); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+k,type); ");
	cEf(" xsArraySetInt(Gbase,Gcumwidth+k,tempbase); ");
	cEf(" xsArraySetInt(Gindex,Gcumwidth+k,startindex+k); ");
	cEf(" temppicpath=techart(tempbase); ");
//	cEf(" if(tempbase<0){temppicpath=temppicpath+(Gcumwidth>=Glinewidth);} ");
	cEf(" Gdisplaydelta=\"<icon=(\"+Gcellwidth+\")(\"+temppicpath+\")>\"; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+k,Gdisplaydelta); ");
	cEf(" } ");
	cEf(" } ");
//RECONCILIATION
	cEf(" if(Gcumwidth==0){scrollingindex1=startindex;} ");
	cEf(" else if(Gcumwidth==Glinewidth){scrollingindex2=startindex;} ");
	cEf(" else if(Gcumwidth<Glinewidth){scrollingindex3=startindex;} ");
	cEf(" else if(Gcumwidth<2*Glinewidth){scrollingindex4=startindex;} ");
	cEf(" else if(Gcumwidth==2*Glinewidth){scrollingindex5=startindex;} ");
	cEf(" else if(Gcumwidth<3*Glinewidth){scrollingindex6=startindex;} ");
	
	cEf(" Gcumwidth=Gcumwidth+length; ");

	cEf(" } ");
	
	cEf(" void updateresearchprogfaster(int wtv=-1){ ");
	cEf(" int tempplyr=0; int temptechid=0; int temppct=0; ");
	cEf(" for(i=0;<xsArrayGetSize(Gtype)){ ");
	cEf(" if(xsArrayGetInt(Gtype,i)==6 && xsArrayGetString(Gtext,i)>\"\"){ ");
	cEf(" tempplyr=xsArrayGetInt(Gplyr,i);temptechid=xsArrayGetInt(Gbase,i); ");
	cEf(" xsSetContextPlayer(tempplyr);temppct=100*kbGetTechPercentComplete(temptechid); ");
	cEf(" 	if(temppct>0){ ");
	cEf(" 	if(MusicOverAesthetics!=1){ ");
	cEf(" 	xsArraySetString(GgrafixTOP,i,\"<icon=(\"+Gcellwidth+\")(spec\prog\R\"+temppct+\")>\"); ");
	cEf(" 	} ");
	cEf(" 	xsArraySetString(Gtext,i,displayR(temppct)+\"   \"); ");
	cEf(" 	} ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");
	
	cEf(" void insertdivider(int wtv=-1) { ");
	cEf(" string Gdisplaydelta=\"\"; int tempcol1=0; ");
	cEf(" Gdisplaydelta=rep(dividerW,\" \")+DS(dividerJ); ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth,1337); ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth,Gdisplaydelta); ");
	cEf(" tempcol1=xsArrayGetInt(Gplyr,Gcumwidth); ");
	cEf(" if(tempcol1!=0){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth)+\"-P\"+tempcol1); ");
	cEf(" gadgetUnreal(\"RTD-MO\"+(Gcumwidth)); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth,0); ");
	cEf(" } ");
	cEf(" Gcumwidth=Gcumwidth+1; ");
	cEf(" } ");

	cEf(" void insertteamdivider(int wtv=-1) { ");
	cEf(" string Gdisplaydelta=rep(tdividerW,\" \")+DS(tdividerJ); int tempcol1=0; int tempcol2=0; ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth,\"\"); ");
	cEf(" xsArraySetString(Ggrafix,Gcumwidth+1,Gdisplaydelta); ");
	cEf(" tempcol1=xsArrayGetInt(Gplyr,Gcumwidth); ");
	cEf(" tempcol2=xsArrayGetInt(Gplyr,Gcumwidth+1); ");
	cEf(" if(tempcol1!=0){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth)+\"-P\"+tempcol1); ");
	cEf(" gadgetUnreal(\"RTD-MO\"+(Gcumwidth)); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth,0); ");
	cEf(" } ");
	cEf(" if(tempcol2!=0){ ");
	cEf(" gadgetUnreal(\"RTD-\"+(Gcumwidth+1)+\"-P\"+tempcol2); ");
	cEf(" gadgetUnreal(\"RTD-MO\"+(Gcumwidth+1)); ");
	cEf(" xsArraySetInt(Gplyr,Gcumwidth+1,0); ");
	cEf(" } ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth,1337); ");
	cEf(" xsArraySetInt(Gtype,Gcumwidth+1,1337); ");
	cEf(" Gcumwidth=Gcumwidth+2; ");
	cEf(" } ");
}

//By far the second most important function
if(true){
	cEf(" void populatestatstext(int wtv=-1) { ");
	cEf(" string temptext=\"\"; int tempvalue=0; ");
	cEf(" int tempplyr=0; int temptype=0; int tempbase=0; int tempindex=0; int tempperc=0; ");
	cEf(" int tC3=0; int tC6=0; int tF1=0; int tF2=0;  int tC8=0;");
	cEf(" Gline1text=\"\"; Gline2text=\"\"; ");
	cEf(" kbLookAtAllUnitsOnMap(); ");
if(cTeamSize==3){
	cEf(" for(z=0;<3){ ");
}
else{
	cEf(" for(z=0;<2){ ");
}
//	cEf(" temptext=\"\"; ");
	cEf(" for(y=Glinewidth*z;<Glinewidth*(z+1)){ ");
	cEf(" temptext=\"\"; ");
	cEf(" tempplyr=xsArrayGetInt(Gplyr,y); ");
	cEf(" temptype=xsArrayGetInt(Gtype,y); ");
	cEf(" tempbase=xsArrayGetInt(Gbase,y); ");
	cEf(" tempindex=xsArrayGetInt(Gindex,y); ");
	cEf(" xsSetContextPlayer(tempplyr); ");
//change to definitive formula later? e.g. C3P1+ num pl spec arrays
	cEf(" if(tempplyr==1){tC3=C3P1;tC6=C6P1;tF1=F1P1;tF2=F2P1;tC8=C8P1;} ");
for(p=2;<=cNumNonObsPlayers){
	cEf(" else if(tempplyr=="+p+"){tC3=C3P"+p+";tC6=C6P"+p+";tF1=F1P"+p+";tF2=F2P"+p+";tC8=C8P"+p+";} ");
}
	cEf(" if(temptype<4){ ");
	cEf(" temptext=temptext+displayR(kbUnitCount(tempplyr,xsArrayGetInt(PrID,tempbase),cUnitStateAlive)); ");
	cEf(" } ");
	cEf(" else if(temptype==4){ ");
	cEf(" temptext=temptext+displayR(kbUnitCount(tempplyr,xsArrayGetInt(PrID,tempbase),cUnitStateBuilding)","+kbUnitCount(tempplyr,xsArrayGetInt(PrID,tempbase),cUnitStateQueued)); ");
	cEf(" } ");
	cEf(" else if(temptype==5){ ");
	cEf(" temptext=temptext+displayR(kbUnitCount(tempplyr,xsArrayGetInt(PrID,tempbase),cUnitStateDead)); ");
	cEf(" } ");
	cEf(" else if(temptype==6){ ");
	cEf(" tempperc=100*kbGetTechPercentComplete(tempbase); ");
	cEf(" temptext=temptext+displayR(tempperc); ");
	cEf(" } ");
	cEf(" else if(temptype==7){ ");
	cEf(" temptext=temptext+displayT(xsArrayGetInt(tC3,tempindex)); ");
	cEf(" } ");
	cEf(" else if(temptype==8){ ");
	cEf(" temptext=temptext+displayT(xsArrayGetInt(tC6,tempindex)); ");
	cEf(" } ");
	cEf(" else if(temptype==9){ ");
	cEf(" if(xsArrayGetInt(tF1,tempindex)==9001){temptext=temptext+displayT(xsArrayGetInt(tF2,tempindex));} ");
	cEf(" else{temptext=temptext+displayR(xsArrayGetInt(tF2,tempindex));} ");
	cEf(" } ");
	cEf(" else if(temptype==10){ ");
	cEf(" temptext=temptext+displayT(xsArrayGetInt(tC8,tempindex)); ");
	cEf(" } ");
	cEf(" else if(temptype==1337){ ");
	cEf(" temptext=temptext+DS(blanklabelwidth); ");
	cEf(" } ");
	cEf(" temptext=temptext+\"   \"; ");
	cEf("  ");
	cEf(" xsArraySetString(Gtext,y,temptext); ");
	cEf(" } ");

//	cEf(" if(z==0){Gline1text=Gline1text+temptext;} ");
//	cEf(" else{Gline2text=Gline2text+temptext;} ");
	cEf(" } ");
//	cEf(" tempidensi=kbUnitCount(plyr,xsArrayGetInt(PrID,k),2); ");
	cEf(" } ");
}
	cEf(" void refreshDisplaySlots(int wtv=-1){ ");
	cEf(" Gcumwidth=0; Gline1display=\"\"; Gline2display=\"\"; "); //later make void func reset disp
if(cNumNonObsPlayers==2){
	cEf(" if(LeftDispType==RightDispType){ ");
	cEf(" populatestatsgraphic("+rPFromNorth(1)+",LeftDispType,Glinewidth); ");
	cEf(" populatestatsgraphic("+rPFromNorth(2)+",LeftDispType,Glinewidth); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" populatestatsgraphic("+rPFromNorth(1)+",LeftDispType,SectionWidth2); ");
	cEf(" insertdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(1)+",RightDispType,Glinewidth-SectionWidth2-1); ");
	cEf(" populatestatsgraphic("+rPFromNorth(2)+",LeftDispType,SectionWidth2); ");
	cEf(" insertdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(2)+",RightDispType,Glinewidth-SectionWidth2-1); ");
	cEf(" } ");
}
else if(cNumNonObsPlayers==4){
	cEf(" populatestatsgraphic("+rPFromNorth(1)+",LeftDispType,SectionWidth4); ");
	cEf(" insertteamdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(3)+",LeftDispType,SectionWidth4); ");
	cEf(" populatestatsgraphic("+rPFromNorth(2)+",LeftDispType,SectionWidth4); ");
	cEf(" insertteamdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(4)+",LeftDispType,SectionWidth4); ");
}
else if(cNumNonObsPlayers==6){
	cEf(" populatestatsgraphic("+rPFromNorth(1)+",LeftDispType,SectionWidth4); ");
	cEf(" insertteamdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(3)+",LeftDispType,SectionWidth4); ");
	cEf(" populatestatsgraphic("+rPFromNorth(2)+",LeftDispType,SectionWidth4); ");
	cEf(" insertteamdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(4)+",LeftDispType,SectionWidth4); ");
	cEf(" populatestatsgraphic("+rPFromNorth(5)+",LeftDispType,SectionWidth4); ");
	cEf(" insertteamdivider(); ");
	cEf(" populatestatsgraphic("+rPFromNorth(6)+",LeftDispType,SectionWidth4); ");
}
	cEf(" populatestatstext(); ");
	cEf(" } ");
	
for(e=1;<=6){
	cEf(" void ScrollLeft"+e+"(int wtv=-1){if(scrollingindex"+e+">0){scrollingindex"+e+"=scrollingindex"+e+"-scrollincrement;","if(scrollingindex"+e+"<0){scrollingindex"+e+"=0;}refreshDisplaySlots();}} ");
	cEf(" void ScrollRight"+e+"(int wtv=-1){scrollingindex"+e+"=scrollingindex"+e+"+scrollincrement;refreshDisplaySlots();} ");
}
//For 1v1 and same type
if(cNumNonObsPlayers==2){
	cEf(" void ScrollRightZ3(int wtv=-1){if(LeftDispType==RightDispType){scrollingindex1++;}","else{scrollingindex3++;}refreshDisplaySlots();} ");
	cEf(" void ScrollRightZ4(int wtv=-1){if(LeftDispType==RightDispType){scrollingindex2++;}","else{scrollingindex4++;}refreshDisplaySlots();} ");
}
//Functional (void) functions
	cEf(" void keymap(int wtv=-1) { ");
	cEf(" trEventSetHandler(88123,\"handleATTZero\"); ");
	cEf(" map(\"mouse1up\",\"world\",\"uiSelectionButtonUp;trackInsert;trackAddWaypoint;trackPlay(-1,88123)\"); ");
//Consolation 47
//Speshul Karaktas
	cEf(" trEventSetHandler(47000,\"CS_space\"); map(\"space\",\"earthquake\","+FireEv(47000)+");","map(\"shift-space\",\"earthquake\","+FireEv(47000)+"); ");
	cEf(" trEventSetHandler(47001,\"CS_comma\"); map(\",\",\"earthquake\","+FireEv(47001)+"); ");
	cEf(" trEventSetHandler(47002,\"CS_period\"); map(\".\",\"earthquake\","+FireEv(47002)+"); ");
	cEf(" trEventSetHandler(47003,\"CS_dash\"); map(\"-\",\"earthquake\","+FireEv(47003)+"); ");
	cEf(" trEventSetHandler(47004,\"CS_slash\"); map(\"/\",\"earthquake\","+FireEv(47004)+"); ");
	cEf(" trEventSetHandler(47005,\"CS_asterisk\"); map(\"shift-8\",\"earthquake\","+FireEv(47005)+"); ");
	cEf(" trEventSetHandler(47006,\"CS_openbracket\"); map(\"shift-9\",\"earthquake\","+FireEv(47006)+"); ");
	cEf(" trEventSetHandler(47007,\"CS_closebracket\"); map(\"shift-0\",\"earthquake\","+FireEv(47007)+"); ");
	cEf(" trEventSetHandler(47008,\"CS_tab\"); map(\"tab\",\"earthquake\","+FireEv(47008)+");","map(\"shift-tab\",\"earthquake\","+FireEv(47008)+"); ");
	cEf(" trEventSetHandler(47009,\"CS_enter\"); map(\"enter\",\"earthquake\","+FireEv(47009)+");","map(\"shift-enter\",\"earthquake\","+FireEv(47009)+"); ");
	cEf(" trEventSetHandler(47010,\"CS_esc\"); map(\"esc\",\"earthquake\","+FireEv(47010)+"); ");
	cEf(" trEventSetHandler(47011,\"CS_backspace\"); map(\"backspace\",\"earthquake\","+FireEv(47011)+");","map(\"shift-backspace\",\"earthquake\","+FireEv(47011)+"); ");
//Numbas
for(i=0;<10){
	cEf(" trEventSetHandler("+(47100+i)+",\"CS_"+i+"\"); map(\""+i+"\",\"earthquake\","+FireEv(47100+i)+"); ");
}
//Lettas
for(i=1;<=26){
	cEf(" trEventSetHandler("+(47200+i)+",\"CS_"+Num2Let(i)+"\"); map(\""+Num2Let(i)+"\",\"earthquake\","+FireEv(47200+i)+"); ");
	cEf(" trEventSetHandler("+(47200+26+i)+",\"CS_"+Num2Let(26+i)+"\"); map(\"shift-"+Num2Let(i)+"\",\"earthquake\","+FireEv(47200+26+i)+"); ");
}
///Not sure if should leave in final build
	cEf(" trEventSetHandler(47999,\"CS_NABLE\"); ","map(\"shift-control-c\",\"game\","+FireEv(47999)+"); ");
for(p=0;<=5){
	cEf(" trEventSetHandler(5000"+p+",\"UIViewDeck"+p+"\"); ");
}
//Atm, max of 4 types.
for(t=1;<=5){
	cEf(" trEventSetHandler(1000"+t+",\"SetRDType"+t+"\"); ");
}
	cEf(" trEventSetHandler(10010,\"togglegperr\"); ");
	cEf(" trEventSetHandler(10011,\"turnongperr\"); ");
	cEf(" trEventSetHandler(10012,\"turnoffgperr\"); ");
	cEf(" trEventSetHandler(10020,\"togglepopg\"); ");
	cEf(" trEventSetHandler(10030,\"toggleadjusteco\"); ");
	cEf(" trEventSetHandler(10040,\"togglecameralockonunit\"); ");
	cEf(" trEventSetHandler(10041,\"turnoncameralockonunit\"); ");
	cEf(" trEventSetHandler(10042,\"turnoffcameralockonunit\"); ");
	cEf(" trEventSetHandler(10050,\"togglefog\"); ","map(\"shift-control-f\",\"game\",\"trackInsert();trackAddWaypoint();trackPlay(-1,10050)\");");
	cEf(" trEventSetHandler(10060,\"toggledebugmode\"); ","map(\"shift-control-d\",\"game\",\"trackInsert();trackAddWaypoint();trackPlay(-1,10060)\");");
for(t=0;<=9){
	cEf(" trEventSetHandler(1040"+t+",\"SetMDTypeLeft"+t+"\"); ");
}
for(t=0;<=9){
	cEf(" trEventSetHandler(1060"+t+",\"SetMDTypeRight"+t+"\"); ");
}
	cEf(" trEventSetHandler(10410,\"SetMDTypeLeft10\"); ");
	cEf(" trEventSetHandler(10610,\"SetMDTypeRight10\"); ");
//For scrolling the advanced tech tracking. Temporary measure.
	cEf(" trEventSetHandler(20011,\"ATTpageNEXT\"); ","map(\"control-x\",\"game\",\"trackInsert();trackAddWaypoint();trackPlay(-1,20011)\");");
	cEf(" trEventSetHandler(20009,\"ATTpagePREV\"); ","map(\"control-z\",\"game\",\"trackInsert();trackAddWaypoint();trackPlay(-1,20009)\");");

//Only up to 1920x1080
for(u=0;<=59){
	cEf(" trEventSetHandler(440"+int2DD(u)+",\"handleclick"+u+"\"); ");
}
//For scrolling
	cEf(" trEventSetHandler(42011,\"ScrollLeft1\"); ");
	cEf(" trEventSetHandler(42012,\"ScrollRight1\"); ");
	cEf(" trEventSetHandler(42021,\"ScrollLeft2\"); ");
	cEf(" trEventSetHandler(42022,\"ScrollRight2\"); ");
	cEf(" trEventSetHandler(42031,\"ScrollLeft3\"); ");

	cEf(" trEventSetHandler(42041,\"ScrollLeft4\"); ");

	cEf(" trEventSetHandler(42051,\"ScrollLeft5\"); ");
	cEf(" trEventSetHandler(42052,\"ScrollRight5\"); ");
	cEf(" trEventSetHandler(42061,\"ScrollLeft6\"); ");
	cEf(" trEventSetHandler(42062,\"ScrollRight6\"); ");
if(cNumNonObsPlayers==2){
	cEf(" trEventSetHandler(42032,\"ScrollRightZ3\"); ");
	cEf(" trEventSetHandler(42042,\"ScrollRightZ4\"); ");
}
else{
	cEf(" trEventSetHandler(42032,\"ScrollRight3\"); ");
	cEf(" trEventSetHandler(42042,\"ScrollRight4\"); ");
}
	cEf(" setconfighandlers(); "); ///
//	cEf(" mapdiplomacystuff(); ");
	cEf(" trEventSetHandler(51930,\"noviewlock\"); map(\"alt-0\",\"game\","+FireEv(51930)+"); ");
if(cAllowViewLock==1){
for(p=1;<=cNumNonObsPlayers){
	cEf(" trEventSetHandler(5193"+p+",\"viewlock"+p+"\"); map(\"alt-"+p+"\",\"game\","+FireEv(51930+p)+"); ");
}
}
	cEf(" } ");

///Need to incorporate rec game fix and variables for haschosendeck. so change lastviewedhc only if 
for(p=1;<=cNumNonObsPlayers){
	cEf(" void UIViewDeck"+(p+(2-cNumNonObsPlayers/2))+"(int wtv=-1){ ");
	cEf(" if(lastviewedHC=="+p+"){gadgetToggle(\"homeCityCommandPanel\");} ");
	cEf(" else{uiSetCameraStartLoc();trPlayerSetActive(column"+p+"player); trShowHCView(column"+p+"player);trPlayerSetActive(FP);uiShowCameraStartLoc(); ");
	cEf(" HCVisible=1; setMinimapUnitFilter(-1);setMinimapUnitFilter(-1);","gadgetUnreal(\"Spec_DeckPlayerLabel_P\"+lastviewedPHC);lastviewedPHC=column"+p+"player;lastviewedHC="+p+";}} ");
}

	cEf(" void CalcRDIncome(int wtv=-1){ ");
	cEf(" float curTimeMS=trTimeMS(); float delTimeMS=curTimeMS-lastsampletimeMS; ");
	cEf(" if(delTimeMS>samplinginterval){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" DelFood_"+p+"=(kbTotalResourceGet(2)-TotFood_"+p+")*100000/delTimeMS; TotFood_"+p+"=kbTotalResourceGet(2); ");
	cEf(" DelWood_"+p+"=(kbTotalResourceGet(1)-TotWood_"+p+")*100000/delTimeMS; TotWood_"+p+"=kbTotalResourceGet(1); ");
	cEf(" DelGold_"+p+"=(kbTotalResourceGet(0)-TotGold_"+p+")*100000/delTimeMS; TotGold_"+p+"=kbTotalResourceGet(0); ");
	cEf(" DelTrade_"+p+"=(kbTotalResourceGet(7)-TotTrade_"+p+")*100000/delTimeMS; TotTrade_"+p+"=kbTotalResourceGet(7); ");
}
	cEf(" lastsampletimeMS=curTimeMS; ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void updateUnitsLostCost(int wtv=-1){ ");
	cEf(" kbLookAtAllUnitsOnMap(); int ldeadunitid=0; int ldeadunit=0;");
for(p=1; <=cNumNonObsPlayers){
	cEf(" xsSetContextPlayer("+p+"); ");
	cEf(" DeadCostFood_"+p+"=0; DeadCostWood_"+p+"=0; DeadCostGold_"+p+"=0; DeadCostTrade_"+p+"=0; ");
	cEf(" for(i="+cNumEcoTypes+";<"+(cNumEcoTypes+cNumMilTypes+cNumWatTypes)+"){ ");
	cEf(" ldeadunitid=xsArrayGetInt(PrID,i); ");
	cEf(" ldeadunit=kbUnitCount("+p+",ldeadunitid,4); ");
	cEf(" 	if(ldeadunit>0){ ");
for(r=0;<3){
	cEf(" 	DeadCost"+resName(r)+"_"+p+"=DeadCost"+resName(r)+"_"+p+"+ldeadunit*kbUnitCostPerResource(ldeadunitid,"+r+"); ");
}
	cEf(" 	DeadCostTrade_"+p+"=DeadCostTrade_"+p+"+ldeadunit*kbUnitCostPerResource(ldeadunitid,7); ");
	cEf(" 	} ");
	cEf(" } ");
}
	cEf(" } ");

for(t=1;<=4){
	cEf(" void SetRDType"+t+"(int wtv=-1){ ");
	cEf(" ResDispType="+t+"; ");
if(t==4){cEf(" updateUnitsLostCost(); ");}
	cEf(" } ");
}
//MD= Main Display
for(t=0;<=10){
	cEf(" void SetMDTypeLeft"+t+"(int wtv=-1){int old=LeftDispType; LeftDispType="+t+";scrollingindex1=-1;scrollingindex2=-1; ");
if(cNumNonObsPlayers==2){
	cEf(" if(old!=RightDispType && RightDispType=="+t+"){gadgetUnreal(\"RTD-RightScroll1\");gadgetUnreal(\"RTD-LeftScroll3\"); ");
	cEf(" gadgetUnreal(\"RTD-RightScroll2\");gadgetUnreal(\"RTD-LeftScroll4\");} ");
	cEf(" else if(old==RightDispType && RightDispType!="+t+"){gadgetReal(\"RTD-RightScroll1\");gadgetReal(\"RTD-LeftScroll3\"); ");
	cEf(" gadgetReal(\"RTD-RightScroll2\");gadgetReal(\"RTD-LeftScroll4\");} ");
}
if(cNumNonObsPlayers>2){cEf(" scrollingindex3=-1;scrollingindex4=-1; ");}
if(cNumNonObsPlayers>4){cEf(" scrollingindex5=-1;scrollingindex6=-1; ");}
if(cNumNonObsPlayers>2){
	cEf(" if(old!=6 && "+t+"==6){gadgetUnreal(\"RTDCONTAINER\");} ");
	cEf(" else if(old==6 && "+t+"!=6){gadgetReal(\"RTDCONTAINER\");} ");
}
	cEf(" refreshDisplaySlots();} ");
}
for(t=0;<=10){
	cEf(" void SetMDTypeRight"+t+"(int wtv=-1){int old=RightDispType; RightDispType="+t+";scrollingindex3=-1;scrollingindex4=-1; ");
if(cNumNonObsPlayers==2){
	cEf(" if(old!=LeftDispType && LeftDispType=="+t+"){gadgetUnreal(\"RTD-RightScroll1\");gadgetUnreal(\"RTD-LeftScroll3\"); ");
	cEf(" gadgetUnreal(\"RTD-RightScroll2\");gadgetUnreal(\"RTD-LeftScroll4\");} ");
	cEf(" else if(old==LeftDispType && LeftDispType!="+t+"){gadgetReal(\"RTD-RightScroll1\");gadgetReal(\"RTD-LeftScroll3\"); ");
	cEf(" gadgetReal(\"RTD-RightScroll2\");gadgetReal(\"RTD-LeftScroll4\");} ");
}
if(cNumNonObsPlayers>2){
	cEf(" if(old!=6 && "+t+"==6){gadgetUnreal(\"RTDCONTAINER\");} ");
	cEf(" else if(old==6 && "+t+"!=6){gadgetReal(\"RTDCONTAINER\");} ");
}
	cEf(" refreshDisplaySlots();} ");
}

	cEf(" void handlegenericclickFIND(int index=-1){ ");
	cEf(" int plyr=xsArrayGetInt(Gplyr,index); int type=xsArrayGetInt(Gtype,index); int base=xsArrayGetInt(Gbase,index); ");
	cEf(" int todaysquery=0; int querysize=0; int protoID=xsArrayGetInt(PrID,base); int origplyr=trCurrentPlayer(); int tempID=0; ");
	cEf(" xsSetContextPlayer(plyr); ");
	cEf(" if(type<=4 && plyr>0 && base>-1){ ");
	cEf(" if(type==4 && kbProtoUnitIsType(plyr,protoID,kbGetUnitTypeID(\"Building\"))){ ");
	cEf(" kbLookAtAllUnitsOnMap(); ");	
	cEf(" todaysquery=kbUnitQueryCreate(\"FindGeneric\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, plyr, true); ");
	cEf(" kbUnitQuerySetState(todaysquery,cUnitStateBuilding); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, protoID); ");
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" resetintarray(FindUnitTracker); ");
	cEf(" if(querysize<2){for(i=0;<querysize){uiLookAtUnit(kbUnitQueryGetResult(todaysquery,i));}} ");
	cEf(" else{ ");
	cEf(" for(i=0;<querysize){arrayaddint(FindUnitTracker,kbUnitQueryGetResult(todaysquery,i));} ");
	cEf(" bubblesortascendintarray(FindUnitTracker); ");
	cEf(" for(k=0;<querysize){if(xsArrayGetInt(FindUnitTracker,k)>lastfoundid)","{lastfoundid=xsArrayGetInt(FindUnitTracker,k);uiLookAtUnit(lastfoundid);break;}","if(k==querysize-1){lastfoundid=xsArrayGetInt(FindUnitTracker,0);uiLookAtUnit(lastfoundid);}} ");
	cEf(" } ");
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" } ");
	cEf(" else{ ");
	cEf(" trPlayerSetActive(plyr);uiFindType(kbGetProtoUnitName(protoID));uiSetCameraStartLoc();","trPlayerSetActive(origplyr);uiShowCameraStartLoc();handleadvancedtechtracking(); ");
	cEf(" } ");
	cEf(" } ");
	cEf(" } ");

	cEf(" void handlegenericclickECHO(int index=-1){ ");
	cEf(" int type=xsArrayGetInt(Gtype,index); int base=xsArrayGetInt(Gbase,index); ");
	cEf(" if(type<=5 || type==9){echoLocalized(xsArrayGetInt(PrDC,base));} ");
	cEf(" else{echoLocalized(xsArrayGetInt(ImDC,base));if(debugmode==1){kat(\"TechID: \"+base);}} ");
	cEf(" } ");
	
	cEf(" void handlegenericclickDEBUG(int index=-1){ ");
	cEf(" int type=xsArrayGetInt(Gtype,index); int base=xsArrayGetInt(Gbase,index); ");
	cEf(" if(type<=5){base=xsArrayGetInt(PrID,base);} ");
	cEf(" kat(\"Debug ID: \"+base); ");
	cEf(" } ");
	
	cEf(" void handlegenericclick(int index=-1){ ");
	cEf(" int type=xsArrayGetInt(Gtype,index); ");
	cEf(" if(type<=4){handlegenericclickFIND(index);} ");
	cEf(" else{handlegenericclickECHO(index);} ");
	cEf(" } ");

//For handling button clicks. Only supported up to 1920x1080.
for(u=0;<=59){
	cEf(" void handleclick"+u+"(int wtv=-1){handlegenericclick("+u+");} ");
}

//note hardcoded unittypes may need to be changed for other patches/mods.
	cEf(" void updateGathrDistribution2(int wtv=-1){ ");
	cEf(" int idlePop=0; int todaysquery=0; int querysize=0; ");
	cEf(" int prID=0; int pgF=0; int pgW=0; int pgG=0; int pgI=0; int tID=0; ");
for(p=1; <=cNumNonObsPlayers){
	cEf(" pgF=0; pgW=0; pgG=0; pgI=0; ");
	cEf(" xsSetContextPlayer("+p+"); kbLookAtAllUnitsOnMap(); ");
	cEf(" todaysquery=kbUnitQueryCreate(\"AllLiveVillz"+p+"\"); ");
	cEf(" kbUnitQuerySetPlayerID(todaysquery, "+p+", true); kbUnitQuerySetState(todaysquery,cUnitStateAlive); ");
	cEf(" kbUnitQuerySetUnitType(todaysquery, UTcorrect(1485)); ");
	cEf(" querysize=kbUnitQueryExecute(todaysquery); ");
	cEf(" idlePop=querysize+kbUnitCount("+p+",510,cUnitStateAlive); ");
	cEf(" for(i=0;<querysize){ ");
	cEf(" tID=kbUnitGetTargetUnitID(kbUnitQueryGetResult(todaysquery,i)); ");
	cEf(" prID=kbGetUnitBaseTypeID(tID); ");
	cEf(" if(kbProtoUnitIsType("+p+",prID,919)){ ");
	cEf(" for(k=0;<"+12*cNumNonObsPlayers+"){if(xsArrayGetInt(PADIrez,k)==1){if(xsArrayGetInt(PADIids,k)==tID){ ");
	cEf(" pgG=pgG+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));break; ");
	cEf(" }} ");
	cEf(" if(k=="+(12*cNumNonObsPlayers-1)+"){ ");
	cEf(" pgF=pgF+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i))); ");
	cEf(" } ");
	cEf(" } ");

	cEf(" } ");
	cEf(" else if(kbProtoUnitIsType("+p+",prID,UTcorrect(1593))){pgF=pgF+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" else if(kbProtoUnitIsType("+p+",prID,UTcorrect(1542))){pgF=pgF+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" else if(kbProtoUnitIsType("+p+",prID,UTcorrect(1594))){pgW=pgW+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" else if(kbProtoUnitIsType("+p+",prID,UTcorrect(1591))){pgG=pgG+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" else if(kbUnitGetActionType(kbUnitQueryGetResult(todaysquery,i))==7){pgI=pgI+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" else if(kbUnitGetActionType(kbUnitQueryGetResult(todaysquery,i))==-1){pgI=pgI+kbGetPopSlots("+p+",kbGetUnitBaseTypeID(kbUnitQueryGetResult(todaysquery,i)));} ");
	cEf(" } ");
	cEf(" PopGathrFood_"+p+"=pgF; PopGathrWood_"+p+"=pgW; PopGathrGold_"+p+"=pgG; PopGathrIdle_"+p+"=pgI; ");
}//kbUnitGetActionType
//	cEf(" kat(\"\"+kbGetUnitTypeID(\"Food\")); ");
//	cEf(" kat(\"\"+kbGetUnitTypeID(\"Wood\")); ");
//	cEf(" kat(\"\"+kbGetUnitTypeID(\"Huntable\")); "); //if unitid is idle then nvm!

//AbstractNativeWarrior,AbstractWarShip,AbstractFishingBoat,AbstractVillager,AbstractFirePit? for other things
	
//AbstractFish
//AbstractWhale

//Tree
//Farm
//Plantation
//Herdable
//Huntable
//AbstractMine
//BerryBush
//FirePit
//Mill
//ypRicePaddy
//ypBerryBuilding
//ypGroveBuilding

//check abstractvillager, ignore abstractwarship I think. not worth it.

//ricepaddy starts as food, action 42, then back to action 7.

//note AbstractTownCenter,Ship,AbstractAgraFort,Outpost,ypVillage,WarHut,NoblesHut,ypCastle,YPDockAsian,Dock
// vs unit

//unit speed vs units contained will be a separate part of ui indicated by a specialized icon I guess.

//if it's ricepaddy then do ricepaddy stuff as above. Otherwise, check as usual below:
//or unittype food, gold, wood!
	cEf(" kbUnitQueryDestroy(todaysquery); ");
	cEf(" } ");

	cEf(" void updcyclepoint(int wtv=-1){ ");
	cEf(" int atoms=amodb(trTimeMS(),1000); ");
	cEf(" if(atoms<250){curcyclepoint=0;} ");
	cEf(" else if(atoms<500){curcyclepoint=1;} ");
	cEf(" else if(atoms<750){curcyclepoint=2;} ");
	cEf(" else{curcyclepoint=3;} ");
	cEf(" } ");

//Will split it up into 10 bits.
	cEf(" void handletimespread(int wtv=-1){ ");
//	cEf(" lastupdatetimeMS=0; updaterequired=0; curupdatecycle=0; ");
	cEf(" if((trTimeMS()-lastupdatetimeMS)>99){ ");
	cEf(" curupdatecycle=curupdatecycle+1;updaterequired=1;lastupdatetimeMS=trTimeMS(); ");
	cEf(" if(curupdatecycle>9){curupdatecycle=0;} ");
//	cEf(" kat(\"Update \"+curupdatecycle+\" at \"+trTimeMS()); ");
	cEf(" } ");
	cEf(" } ");

//Based on 2550 total techs as at time of 2.1a
	cEf(" void actiontimespread(int wtv=-1){ ");
	cEf(" if(updaterequired==1){updaterequired=0; ");
	cEf(" if(curupdatecycle==0){updateimprovarrays(0,255);} ");
	cEf(" if(curupdatecycle==1){updateimprovarrays(255,510);} ");
	cEf(" if(curupdatecycle==2){updateimprovarrays(510,765);} ");
	cEf(" if(curupdatecycle==3){updateimprovarrays(765,1020);} ");
	cEf(" if(curupdatecycle==4){updateimprovarrays(1020,1275);} ");
	cEf(" if(curupdatecycle==5){updateimprovarrays(1275,1530);} ");
	cEf(" if(curupdatecycle==6){updateimprovarrays(1530,1785);} ");
	cEf(" if(curupdatecycle==7){updateimprovarrays(1785,2040);} ");
	cEf(" if(curupdatecycle==8){updateimprovarrays(2040,2295);} ");
	cEf(" if(curupdatecycle==9){updateimprovarrays(2295,2550);} ");
	cEf(" } ");
	cEf(" } ");

//---------------------------------------------------------
//AutoUpdater
	cEf(" rule _FastAutoUpdater active { ");
	cEf(" string resourcefeed=\"\"; string shipmentfeed=\"\"; string graphicsfeed=\"\"; ");
	cEf(" int tempcyclepoint=0; int temporiplyr=0; ");
if(cAllowViewLock==1){
	cEf(" if(nabvl==1){ ");
	cEf(" tempcyclepoint=curcyclepoint;");
	cEf(" updcyclepoint();");
	cEf(" if(curcyclepoint!=tempcyclepoint){ ");
	cEf(" if(FP<="+cNumNonObsPlayers+"){youmayviewlockme();} ");
	cEf(" else{if(cameralockonplayer>0){temporiplyr=trCurrentPlayer();uiSetCameraStartLoc();trackInsert();trackAddWaypoint();","trPlayerSetActive(cameralockonplayer);uiFindType(\"UIArmyBannerHand\");trPlayerSetActive(temporiplyr);","uiLookAtSelection();trackAddWaypoint();uiClearSelection();uiShowCameraStartLoc();trackPlay(250);}} ");
	cEf(" } ");
	cEf(" } ");
}
	cEf(" if((FP>"+cNumNonObsPlayers+" || override==1) && hasUI==1){ ");
	cEf(" if(trTime()==0 || enableunitticker==1){ ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" handleunitTrecording"+p+"(); ");
}
	cEf(" } ");
	cEf(" handletimespread(); ");////
	cEf(" actiontimespread(); ");////
	cEf(" updateresearchprogfaster(); ");
for(p=1;<=cNumNonObsPlayers){
	cEf(" handleshipmenttimings"+p+"(); "); ///<-NEED TO COME BACK IN A FUTURE VERSION AND SORT THIS OUT
	cEf(" predictshipmentarrival"+p+"(); ");
}
	cEf(" if(HCVisible==1){if(trIsGadgetVisible(\"homeCityCommandPanel\")){setMinimapUnitFilter(-1); ");
	cEf(" HCVisible=0;trShowWorldView(FP);gadgetReal(\"homeCityCommandPanel\"); ");
	cEf(" gadgetUnreal(\"homeCityCardPanel-DeckLabel\");gadgetUnreal(\"homeCityCardPanel-DeckName\");","gadgetReal(\"Spec_DeckPlayerLabel_P\"+lastviewedPHC);}} ");
	cEf(" if(showconsole==1){ ");
	cEf(" resourcefeed=\"<bgcolor=0,0,0,1>>\"+fullstr(CnINPT)+\"</bgcolor><bgcolor=1,0,0,1>\"+console","autocomplete+\"</bgcolor>\"; ");
	cEf(" resourcefeed=resourcefeed+\"\n\"+\"<bgcolor=0,0,0,1>Press 'ESC' to exit console, 'ENTER' to use command. ","'TAB' to autocomplete (where available)</bgcolor>\n \n \"; ");
	cEf(" }else{resourcefeed=DS()+\"\n \n \n\"+DS();} ");
if(cTeamSize<3){
	cEf(" resourcefeed=fontize(DS()+\"\n \n\",\"Graphicz 32\")+resourcefeed; ");
}
if(cTeamSize==1){
	cEf(" resourcefeed=resourcefeed+\"\n\"+plyrHeader1(resline1player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"+resLine1(resline1player); ");
	cEf(" resourcefeed=resourcefeed+fontize(DS(),\"Arial 16\")+\"\n\"; "); //NOTE THIS STUFF MAY HAVE TO BE CHANGED?
	cEf(" resourcefeed=resourcefeed+plyrHeader1(resline2player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"+resLine1(resline2player); ");
	cEf(" resourcefeed=resourcefeed+Gline2text; ");
}
else if(cTeamSize==2){
	cEf(" resourcefeed=resourcefeed+\"\n\"+plyrHeader2(resline1player,resline3player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+resLine2(resline1player,resline3player)+fontize(DS(),\"Arial 16\")+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+plyrHeader2(resline2player,resline4player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+resLine2(resline2player,resline4player); ");
}
else if(cTeamSize==3){
	cEf(" resourcefeed=resourcefeed+\"\n\"+plyrHeader2(resline5player,resline6player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+resLine2(resline5player,resline6player)+fontize(DS(),\"Arial 16\")+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+plyrHeader2(resline1player,resline3player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+resLine2(resline1player,resline3player)+fontize(DS(),\"Arial 16\")+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+plyrHeader2(resline2player,resline4player); ");
	cEf(" resourcefeed=resourcefeed+\"\n\"; ");
	cEf(" resourcefeed=resourcefeed+resLine2(resline2player,resline4player); ");
}
	cEf(" shipmentfeed=shipInfo()+\"\n\"; ");
if(cTeamSize==1){
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarstarter"+cNumNonObsPlayers+")+progBar(column1player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(sbdeadspace+shpbarspacing)+progBar(column2player); ");
}
else if(cTeamSize==2){
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarstarter"+cNumNonObsPlayers+")+progBar(column1player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column2player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(sbdeadspace+shpbarspacing)+progBar(column3player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column4player); ");
}
else if(cTeamSize==3){
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarstarter"+cNumNonObsPlayers+")+progBar(column1player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column2player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column3player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(sbdeadspace+shpbarspacing)+progBar(column4player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column5player); ");
	cEf(" shipmentfeed=shipmentfeed+DS(shpbarspacing)+progBar(column6player); ");
}

//	cEf(" shipmentfeed=shipmentfeed+DS(); ");
//Need to condition stuff on if is 1920x1080 for extra features i.e. 3v3
//uses custom font GraphicLabel 10.

	cEf(" graphicsfeed=\"\n<font=Graphicz 32>\"+DS(); ");

	cEf(" graphicsfeed=graphicsfeed+\"</font><font=GraphicLabel 10>\n\"+DS()+\"\n\"; ");
	cEf(" for(ft=0;<displayfinetuning){graphicsfeed=graphicsfeed+DS()+\"\n\";} ");
	cEf(" graphicsfeed=graphicsfeed+\"</font>\"; ");
	cEf(" graphicsfeed=graphicsfeed+\"<font=Graphicz 32>\"+rep(numLFs,\"\n \"); ");
if(cTeamSize==3){
	cEf(" graphicsfeed=graphicsfeed+DS(gstarter)+cumstring(Ggrafix,2*Glinewidth,3*Glinewidth,GgrafixTOP); ");
	cEf(" graphicsfeed=graphicsfeed+\"\n \n \"; ");
}
else{
	cEf(" graphicsfeed=graphicsfeed+DS(gstarter); ");
	cEf(" graphicsfeed=graphicsfeed+\"\n \n \"; ");
}
	cEf(" graphicsfeed=graphicsfeed+DS(gstarter)+cumstring(Ggrafix,0,Glinewidth,GgrafixTOP); ");
	cEf(" graphicsfeed=graphicsfeed+\"\n \n \"; ");
	cEf(" graphicsfeed=graphicsfeed+DS(gstarter)+cumstring(Ggrafix,Glinewidth,2*Glinewidth,GgrafixTOP); ");
	cEf(" graphicsfeed=graphicsfeed+\"</font>\"; ");
	cEf(" trSoundPlayDialog(\"default\", \"1\", -1, false, shipmentfeed+graphicsfeed+\":\"+resourcefeed, \"\"); ");
	cEf(" if(MusicOverAesthetics==1){} ");
	cEf(" else{ ");
if(cNumNonObsPlayers!=6){
	cEf(" trShowWinLose(rep(startliner+newdoubleliner)+cumstring(Ggrafix,0,Glinewidth)","+rep(newliner)+cumstring(Ggrafix,Glinewidth,2*Glinewidth)+\"\",\"\",\"1\",false); ");
}
else{
	cEf(" trShowWinLose(rep(startliner)+cumstring(Ggrafix,Glinewidth*2,Glinewidth*3)+rep(newliner)+cumstring(Ggrafix,0,Glinewidth)","+rep(newliner)+cumstring(Ggrafix,Glinewidth,2*Glinewidth)+\"\",\"\",\"1\",false); ");
}
	cEf(" } ");
//	cEf(" trShowWinLose(\"\"+cumstring(Ggrafix,0,Glinewidth)+\"\",\"\",\"1\",false); ");
//	cEf(" trShowWinLose(\"\"+rep(2+208,\" \")+cumstring(Ggrafix,Glinewidth,2*Glinewidth)","+rep(105,\" \")+cumstring(Ggrafix,Glinewidth,2*Glinewidth)+rep(105,\" \")+cumstring(Ggrafix,Glinewidth,2*Glinewidth)","+rep(105,\" \")+cumstring(Ggrafix,Glinewidth,2*Glinewidth)+\"\",\"\",\"1\",true); ");

	cEf(" if(showPopGraphic==1){trMessageSetText(popGraphic(),-1);} ");
	cEf(" CalcRDIncome(); ");

	cEf(" } ");
	cEf(" trUnblockAllSounds(); ");
	cEf(" } ");
//---------------------------------------------------------	

	cEf(" void doInitialUpdate(int wtv=-1){ ");
	cEf(" trUnblockAllSounds(); ");
	cEf(" if(LeftDispType==5 || RightDispType==5){populatedeatharrays();updateATMded();} ");
	cEf(" if(LeftDispType<4 || RightDispType<4){populatelifearrays();} ");
	cEf(" if(LeftDispType==0 || RightDispType==0){updateATMeco();} ");
	cEf(" if(LeftDispType==1 || RightDispType==1){updateATMmil();} ");
	cEf(" if(LeftDispType==2 || RightDispType==2){updateATMwat();} ");
	cEf(" if(LeftDispType==3 || RightDispType==3){updateATMall();} ");
	cEf(" if(LeftDispType==4 || RightDispType==4){populatequeuearrays();updateATMque();} ");
	cEf(" if(LeftDispType==5 || RightDispType==5){populatedeatharrays();updateATMded();} ");
//	cEf(" sendtestchat(); ");
	cEf(" flareraidz(); ");
	cEf(" updateimprovarrays(); ");
	cEf(" processages(); ");
	cEf(" updateGathrDistribution2(); ");
	cEf(" refreshDisplaySlots(); ");
	cEf(" clearstartingtechs(); ");
	cEf(" trUnblockAllSounds(); ");
	cEf(" } ");

	cEf(" void doNormalUpdate(int wtv=-1){ ");
	cEf(" trUnblockAllSounds(); ");

	cEf(" if(LeftDispType==5 || RightDispType==5){populatedeatharrays();updateATMded();} ");
	cEf(" if(LeftDispType<4 || RightDispType<4){populatelifearrays();} ");
	cEf(" if(LeftDispType==0 || RightDispType==0){updateATMeco();} ");
	cEf(" if(LeftDispType==1 || RightDispType==1){updateATMmil();} ");
	cEf(" if(LeftDispType==2 || RightDispType==2){updateATMwat();} ");
	cEf(" if(LeftDispType==3 || RightDispType==3){updateATMall();} ");
	cEf(" if(LeftDispType==4 || RightDispType==4){populatequeuearrays();updateATMque();} ");
	cEf(" if(LeftDispType==5 || RightDispType==5){populatedeatharrays();updateATMded();} ");

	cEf(" flareraidz(); ");
/*
if(cNumNonObsPlayers==2){
	cEf(" updateimprovarrays(); ");
}
else if(cNumNonObsPlayers==4){
	cEf(" if(amodb(trTime(),2)==0){updateimprovarrays1();updateimprovarrays2();} ");
	cEf(" else{updateimprovarrays3();updateimprovarrays4();} ");
}
else if(cNumNonObsPlayers==6){
	cEf(" if(amodb(trTime(),3)==0){updateimprovarrays1();updateimprovarrays2();} ");
	cEf(" else if(amodb(trTime(),3)==1){updateimprovarrays3();updateimprovarrays4();} ");
	cEf(" else{updateimprovarrays5();updateimprovarrays6();} ");
}
*/
for(p=1;<=cNumNonObsPlayers){
	cEf(" correctresearchingarrays"+p+"(); ");
}
	cEf(" processages(); ");
	cEf(" updateGathrDistribution2(); ");
	cEf(" refreshDisplaySlots(); ");
	cEf(" if(passivetracking==1){handleadvancedtechtracking();} ");
	cEf(" trUnblockAllSounds(); ");
	cEf(" } ");
//ONLY IF THERE ARE ASIAN CIVS
for(p=1;<=cNumNonObsPlayers){
if(InI(rmGetPlayerCiv(p),19,21)){
	cEf(" rule _PaddyUpdater minInterval 2 active { ");
	cEf(" for(p=1;<="+cNumNonObsPlayers+"){loadPADIs(p);} ");
//	cEf(" for(i=0;<"+12*cNumNonObsPlayers+"){if(xsArrayGetInt(PADIids,i)>-1)","{kat(xsArrayGetInt(PADIids,i)+\",\"+xsArrayGetInt(PADIrez,i));}} ");
	cEf(" } ");
	break;
}
}
	cEf(" rule _NormalAutoUpdater minInterval 1 active { ");
	cEf(" if(FP>"+cNumNonObsPlayers+" || override==1){ ");
	cEf(" doNormalUpdate();handleplayerouts(); ");
	cEf(" } ");
	cEf(" handleendgame(); ");
	cEf(" sendtestchat(); ");
	cEf(" } ");

	cEf(" void lookIhasUI(int wtv=-1){ ");
	cEf(" hasUI=1; ");
	cEf(" } ");

//remember to hide select deck ui in final version
	cEf(" void deployUI(int wtv=-1){ ");
	cEf(" string tempmaxtL=\"\"; string tempmaxtR=\"\"; ");
	cEf(" trSetFogAndBlackmap(false, false); lookIhasUI(); ");
if(cNumNonObsPlayers==4){cEf(" gadgetUnreal(\"Spec_RightOptionsLabel\");gadgetUnreal(\"Spec_RightOptions\"); ");}
if(cNumNonObsPlayers==6){cEf(" gadgetUnreal(\"Spec_RightOptionsLabel3v3\");gadgetUnreal(\"Spec_RightOptions3v3\"); ");}
	cEf(" gadgetUnreal(\"uimain-Score-SpecContainer\"); gadgetUnreal(\"victoryDisplay\"); ");
	cEf(" gadgetUnreal(\"unitselectionpanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelNatMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelAsiMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SettlerCountDialog-advancedPanelEurMin-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"minimapPanel-SpecContainer\"); gadgetUnreal(\"commandpanel2-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SocketPanel2-SpecContainer\"); gadgetUnreal(\"TreasurePanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"SocketPanel2-SpecContainer\"); gadgetUnreal(\"TreasurePanel-SpecContainer\"); ");
	cEf(" gadgetUnreal(\"unitstatpanel3-SpecContainer\"); ");
	cEf(" for(k=0;<(Glinewidth*2)){ ");
	cEf(" gadgetReal(\"RTDB-\"+k); ");
	cEf(" } ");
	cEf(" gadgetReal(\"BG\"); ");
if(cNumNonObsPlayers==6){
	cEf(" gadgetReal(\"BG3\"); ");
	cEf(" gadgetReal(\"Spec_ScoreBoard_BG3v3\"); ");
}
else{
	cEf(" gadgetReal(\"BG2\"); ");
}
	cEf(" gadgetReal(\"Spec_ScoreBoardContainer\"); gadgetReal(\"Spec_PlayerFlags\"); ");
//	cEf(" gadgetReal(\"Spec_Options\"); ");

for(f=1;<=cNumNonObsPlayers){
	cEf(" gadgetReal(\"Spec_ScoreBoard_P"+rPFromWest(f)+"_"+(f+(2-cNumNonObsPlayers/2))+"B\"); ");
	cEf(" gadgetReal(\"Spec_ScoreBoard_P"+rPFromWest(f)+"_"+(f+(2-cNumNonObsPlayers/2))+"T\"); ");
	cEf(" gadgetReal(\"Spec_Flag_"+(f+(2-cNumNonObsPlayers/2))+"_"+rmGetPlayerCiv(rPFromWest(f))+"\"); ");
	cEf(" gadgetReal(\"Spec_NumShipmentBG_"+(f+(2-cNumNonObsPlayers/2))+"\"); ");
	cEf(" gadgetReal(\"Spec_NumShipmentBG_"+(f+(2-cNumNonObsPlayers/2))+"\"); ");

	cEf(" gadgetReal(\"Spec_ShipmentProgress_"+(f+(2-cNumNonObsPlayers/2))+"_P"+rPFromWest(f)+"\"); ");
}
//Hi-Tech Scoreboard Tracking
for(f=1;<=cNumNonObsPlayers){
if(f<=cNumNonObsPlayers/2){cEf(" tempmaxtL=strmax(tempmaxtL,kbGetPlayerName("+rPFromWest(f)+")); ");}
else{cEf(" tempmaxtR=strmax(tempmaxtR,kbGetPlayerName("+rPFromWest(f)+")); ");}
}
	cEf(" gadgetReal(\"Spec_\"+(tempmaxtL>tempmaxtR)+\"SBL\"); ");
	cEf(" gadgetReal(\"Spec_\"+(tempmaxtL>tempmaxtR)+\"SBR\"); ");
	cEf(" gadgetReal(\"Spec_\"+(tempmaxtL>tempmaxtR)+\"SBS\"); ");
//Conditional Scrolling
if(cTeamSize==1){cEf(" gadgetReal(\"RTD-1v1ScrollButtons\"); ");}
else if(cTeamSize==2){cEf(" gadgetReal(\"RTD-2v2ScrollButtons\"); ");}
else if(cTeamSize==3){cEf(" gadgetReal(\"RTD-2v2ScrollButtons\");gadgetReal(\"RTD-3v3ScrollButtons\"); ");}

//Maybe simply create an array of 6 players for p1 p2 p3 p4 p5 p6 from west to east? -1 means do not show anysing.
for(f=1;<=cNumNonObsPlayers){
	cEf(" gadgetReal(\"Spec_PlayerLabel_"+f+"_P"+rPFromNorth(f)+"\"); ");
	cEf(" gadgetReal(\"Spec_PlayerScore_"+f+"_P"+rPFromNorth(f)+"\"); ");
}
if(cTeamSize<3){
	cEf(" gadgetReal(\"Spec_ToggleOptions\"); ");
	cEf(" gadgetReal(\"Spec_Options\"); ");
}
else{
	cEf(" gadgetReal(\"Spec_ToggleOptions3v3\"); ");
	cEf(" gadgetReal(\"Spec_Options3v3\"); ");
}
	cEf(" keymap(); ");
	cEf(" override=1; ");
	cEf(" if(trIsGadgetVisible(\"Spec_PresetConfig-1600x900-1\")){load1600x900();} ");
	cEf(" if(trIsGadgetVisible(\"Spec_PresetConfig-1680x1050-1\")){load1680x1050();} ");
	cEf(" else if(trIsGadgetVisible(\"Spec_PresetConfig-1920x1080-1\")){load1920x1080();} ");
	cEf(" else if(trIsGadgetVisible(\"Spec_PresetConfig-1280x800-1\")){load1280x800();} ");
	cEf(" else if(trIsGadgetVisible(\"Spec_PresetConfig-1280x768-1\")){load1280x768();} ");
	cEf(" else if(trIsGadgetVisible(\"Spec_PresetConfig-1280x720-1\")){load1280x720();} ");
	cEf(" else if(trIsGadgetVisible(\"Spec_PresetConfig-1366x768-1\")){load1366x768();} ");
	cEf(" configDef(\"NoHCAmbientSound\"); ");
	cEf(" doInitialUpdate(); ");
	cEf(" } ");

	cEf(" void deployUIFromRec(int wtv=-1){ ");
if(cNumberNonGaiaPlayers>cNumNonObsPlayers){
	cEf(" trPlayerSetActive("+(cNumNonObsPlayers+1)+");FP="+(cNumNonObsPlayers+1)+"; ");
}
	cEf(" configUndef(\"recordGameViewLock\"); toggleHomeCityView(); deployUI(); ");
	cEf(" } ");
//---------------------------------------------------------
	cEf(" rule _FeatureLoader active runImmediately { ");
	cEf(" if(FP>"+cNumNonObsPlayers+" || override==1){ ");
	cEf(" uiClearSelection();uiFindType(\"Target\");uiDeleteAllSelectedUnits(); ");
	cEf(" trSetFogAndBlackmap(false,false);gadgetUnreal(\"victoryDisplay\"); ");
	cEf(" if(trIsGadgetVisible(\"m8ihazui2\")){deployUI();} ");
//Extended Edition
	cEf(" else if(trIsGadgetVisible(\"m8ihazui2-1\")){deployUI();} ");
	cEf(" } ");
	cEf(" validateSpecUI(); ");
if(IDesignRMS==1){cEf(" kat(\"Filename: "+cFilename+"\");kat(\"TTT: "+cNumAllTechs+"\");echoSTARTLOCS(); ");}

	cEfZ(" xsDisableSelf(); } /*");
//---------------------------------------------------------

/*[Special features end]*/
}

	}
 

