/*
==============================
	    Mojave Desert
          by dansil92
==============================
*/
include "mercenaries.xs";
include "ypAsianInclude.xs";
include "ypKOTHInclude.xs";
 
void main(void) {
	rmSetStatusText("",0.01);
   // Picks the map size
	int playerTiles=18000;
	if (cNumberNonGaiaPlayers > 4){
		playerTiles = 17500;
	}else if (cNumberNonGaiaPlayers > 6){
		playerTiles = 17000;
	}



	int size = 2.0 * sqrt(cNumberNonGaiaPlayers*playerTiles);

	rmSetMapSize(size, size);

	rmSetMapType("land");
        rmSetMapType("grass");
	rmSetMapType("sonora");
	rmSetMapType("tropical");


		rmSetLightingSet("spcjc4");

        rmDefineClass("classForest");
		rmDefineClass("classPlateau");
	rmSetSeaLevel(0.0);
		rmSetSeaType("Lisbon");
       	rmTerrainInitialize("grass");
		rmSetWindMagnitude(4.0);


		//Constraints
		int avoidPlateau=rmCreateClassDistanceConstraint("stuff vs. cliffs", rmClassID("classPlateau"), 19.0);

int avoidPlateauShort =rmCreateClassDistanceConstraint("stuff vs. cliffs smoll", rmClassID("classPlateau"), 8.0);


        int circleConstraint=rmCreatePieConstraint("circle Constraint", 0.5, 0.5, 0, rmZFractionToMeters(0.45), rmDegreesToRadians(0), rmDegreesToRadians(360));
       
		int forestConstraint=rmCreateClassDistanceConstraint("forest vs. forest", rmClassID("classForest"), 21.0);
        int forestConstraintShort=rmCreateClassDistanceConstraint("object vs. forest", rmClassID("classForest"), 4.0);
        
		int avoidHunt=rmCreateTypeDistanceConstraint("hunts avoid hunts", "huntable", 78.0);


		int avoidHuntSmall=rmCreateTypeDistanceConstraint("avoid hunts", "huntable", 11.0);

		int waterHunt = rmCreateTerrainMaxDistanceConstraint("hunts stay near the water", "land", false, 10.0);


        int avoidHerd=rmCreateTypeDistanceConstraint("herds avoid herds", "herdable", 24.0);

		int avoidCoin=rmCreateTypeDistanceConstraint("avoid coin", "Mine", 10.0);
		int avoidTree=rmCreateTypeDistanceConstraint("avoid trees", "TreeSonora", 11.0);




		int waterCoin=rmCreateTypeDistanceConstraint("avoid coin smallest", "Mine", 14.0);


        int avoidCoinMed=rmCreateTypeDistanceConstraint("avoid coin medium", "Mine", 72.0);
        int avoidWaterShort = rmCreateTerrainDistanceConstraint("avoid water short 2", "Land", false, 19.0);
        int cliffWater = rmCreateTerrainDistanceConstraint("cliff avoids river", "Land", false, 7.0);
        int cliffWater2 = rmCreateTerrainDistanceConstraint("cliff avoids river 2", "Land", false, 1.5);
        int cliffWater3 = rmCreateTerrainDistanceConstraint("cliff avoids river 2", "Land", false, 2.5);


        int avoidTradeRouteSmall = rmCreateTradeRouteDistanceConstraint("objects avoid trade route small", 8.0);
        int avoidSocket=rmCreateClassDistanceConstraint("socket avoidance", rmClassID("socketClass"), 25.0);
        
		int avoidTownCenter=rmCreateTypeDistanceConstraint("avoid Town Center", "townCenter", 30.0);
        int avoidTownCenterSmall=rmCreateTypeDistanceConstraint("avoid Town Center small", "townCenter", 15.0);
        int avoidTownCenterMore=rmCreateTypeDistanceConstraint("avoid Town Center more", "townCenter", 90.0);  
       
		int avoidNugget=rmCreateTypeDistanceConstraint("nugget avoid nugget", "AbstractNugget", 90.0);

  int avoidBerries=rmCreateTypeDistanceConstraint("avoid berries", "berrybush", 20.0);
  int avoidBerriesSmall=rmCreateTypeDistanceConstraint("avoid berries smoll", "berrybush", 8.0);


int stayWest = rmCreatePieConstraint("Stay West",0.47,0.53, rmXFractionToMeters(0.2),rmXFractionToMeters(0.5), rmDegreesToRadians(180),rmDegreesToRadians(0));

int stayEast = rmCreatePieConstraint("Stay East",0.53,0.47, rmXFractionToMeters(0.2),rmXFractionToMeters(0.5), rmDegreesToRadians(0),rmDegreesToRadians(180));

   

	int PlayerNum = cNumberNonGaiaPlayers;
	int TeamNum = cNumberTeams;
	int numPlayer = cNumberPlayers;


    
 // =============Player placement ======================= 
    float spawnSwitch = rmRandFloat(0,1.2);
//spawnSwitch = 0.1;


	if (cNumberTeams == 2){
		if (spawnSwitch <=0.6){

	if (PlayerNum == 2)
	{
			rmPlacePlayer(1, 0.24, 0.26);
			rmPlacePlayer(2, 0.76, 0.74);
	}

	if (PlayerNum == 4 && rmGetNumberPlayersOnTeam(0) == rmGetNumberPlayersOnTeam(1))
	{			
			rmSetPlacementTeam(0);
			rmSetPlacementSection(0.1, 0.2);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);
			rmSetPlacementTeam(1);
			rmSetPlacementSection(0.6, 0.7);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);

	}


			rmSetPlacementTeam(0);
			rmSetPlacementSection(0.0, 0.18);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);
			rmSetPlacementTeam(1);
			rmSetPlacementSection(0.50, 0.68);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);

		}else if(spawnSwitch <=1.2){

	if (PlayerNum == 2)
	{
			rmPlacePlayer(2, 0.24, 0.26);
			rmPlacePlayer(1, 0.76, 0.74);
	}

	if (PlayerNum == 4 && rmGetNumberPlayersOnTeam(0) == rmGetNumberPlayersOnTeam(1))
	{			
			rmSetPlacementTeam(1);
			rmSetPlacementSection(0.1, 0.2);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);
			rmSetPlacementTeam(0);
			rmSetPlacementSection(0.6, 0.7);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);

	}


			rmSetPlacementTeam(1);
			rmSetPlacementSection(0.0, 0.18);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);
			rmSetPlacementTeam(0);
			rmSetPlacementSection(0.50, 0.68);
			rmPlacePlayersCircular(0.38, 0.38, 0.00);


		}
	}else{
	//*************ffa placement********
		rmPlacePlayersCircular(0.42, 0.44, 0.00);
	}

		
        chooseMercs();
        rmSetStatusText("",0.1); 
        int continent2 = rmCreateArea("continent");
        rmSetAreaSize(continent2, 1.0, 1.0);
        rmSetAreaLocation(continent2, 0.5, 0.5);
	   rmSetAreaMix(continent2, "sonora_dirt");
   //     rmSetAreaTerrainType(continent2, "cave\cave_ground1");       
 rmSetAreaBaseHeight(continent2, 0.0);
        rmSetAreaCoherence(continent2, 1.0);
        rmSetAreaSmoothDistance(continent2, 6);
        rmSetAreaHeightBlend(continent2, 1);
        rmSetAreaElevationNoiseBias(continent2, 0);
        rmSetAreaElevationEdgeFalloffDist(continent2, 10);
        rmSetAreaElevationVariation(continent2, 6);
        rmSetAreaElevationPersistence(continent2, .2);
        rmSetAreaElevationOctaves(continent2, 5);
        rmSetAreaElevationMinFrequency(continent2, 0.04);
        rmSetAreaElevationType(continent2, cElevTurbulence);  
        rmBuildArea(continent2);    

		int classPatch = rmDefineClass("patch");
		int avoidPatch = rmCreateClassDistanceConstraint("avoid patch", rmClassID("patch"), 22.0);
		int classCenter = rmDefineClass("center");
		int avoidCenter = rmCreateClassDistanceConstraint("avoid center", rmClassID("center"), 36.0);
		int circleConstraint2=rmCreatePieConstraint("circle Constraint2", 0.5, 0.5, 0, rmZFractionToMeters(0.44), rmDegreesToRadians(0), rmDegreesToRadians(360));
        



		rmSetStatusText("",0.2);


//define player areas

for(i=1; < cNumberNonGaiaPlayers + 1) {

    int PlayerArea1 = rmCreateArea("NeedLand1"+i);
        rmSetAreaSize(PlayerArea1, rmAreaTilesToFraction(900), rmAreaTilesToFraction(900));
		rmAddAreaToClass(PlayerArea1, rmClassID("classPlateau"));
		rmAddAreaToClass(PlayerArea1, rmClassID("center"));
       rmSetAreaHeightBlend(PlayerArea1, 2);
        rmSetAreaLocation(PlayerArea1, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmSetAreaCoherence(PlayerArea1, 0.93);
        rmBuildArea(PlayerArea1);

}



// BUILD NATIVE SITES

	//Choose Natives
	int subCiv0=-1;
	int subCiv1=-1;
	int subCiv2=-1;
	int subCiv3=-1;

//navajo are awesome


   if (rmAllocateSubCivs(4) == true)
   {
      subCiv0=rmGetCivID("navajo");
      rmEchoInfo("subCiv0 is navajo "+subCiv0);
      if (subCiv0 >= 0)
         rmSetSubCiv(0, "navajo");

		subCiv1=rmGetCivID("navajo");
      rmEchoInfo("subCiv1 is navajo"+subCiv1);
		if (subCiv1 >= 0)
			 rmSetSubCiv(1, "navajo");
	 
		subCiv2=rmGetCivID("navajo");
      rmEchoInfo("subCiv2 is navajo"+subCiv2);
      if (subCiv2 >= 0)
         rmSetSubCiv(2, "navajo");

		subCiv3=rmGetCivID("navajo");
      rmEchoInfo("subCiv3 is navajo"+subCiv3);
      if (subCiv3 >= 0)
         rmSetSubCiv(3, "navajo");
	}
	
	// Set up Natives	
	int nativeID0 = -1;
    int nativeID1 = -1;
	int nativeID2 = -1;
    int nativeID3 = -1;
		
	nativeID0 = rmCreateGrouping("native site 1", "native navajo village 4");
    rmSetGroupingMinDistance(nativeID0, 0.00);
    rmSetGroupingMaxDistance(nativeID0, 0.00);
	rmAddGroupingToClass(nativeID0, rmClassID("classPlateau"));

	nativeID1 = rmCreateGrouping("native site 2", "native navajo village 5");
    rmSetGroupingMinDistance(nativeID1, 0.00);
    rmSetGroupingMaxDistance(nativeID1, 0.00);
	rmAddGroupingToClass(nativeID1, rmClassID("classPlateau"));

//========place=====
	if (cNumberTeams == 2){
	rmPlaceGroupingAtLoc(nativeID1, 0, 0.28, 0.5);
	rmPlaceGroupingAtLoc(nativeID0, 0, 0.72, 0.5);
}else{
	rmPlaceGroupingAtLoc(nativeID1, 0, 0.30, 0.62);
	rmPlaceGroupingAtLoc(nativeID0, 0, 0.70, 0.38);
	rmPlaceGroupingAtLoc(nativeID0, 0, 0.62, 0.7);
	rmPlaceGroupingAtLoc(nativeID1, 0, 0.38, 0.30);

}


//==========oasis placement===============


		int cenoteWest = rmCreateArea("west cenote");
		rmSetAreaSize(cenoteWest, 0.007, 0.007); 
		rmSetAreaCoherence(cenoteWest, .92);
	if (cNumberTeams == 2){
		rmSetAreaLocation(cenoteWest, .22, .75);
}else{
		rmSetAreaLocation(cenoteWest, .34, .45);
}	
		rmAddAreaToClass(cenoteWest, rmClassID("classPlateau"));
        rmSetAreaWaterType(cenoteWest, "London");
		rmBuildArea(cenoteWest);


		int cenoteEast = rmCreateArea("east cenote");
		rmSetAreaSize(cenoteEast, 0.007, 0.007); 
		rmSetAreaCoherence(cenoteEast, .92);
	if (cNumberTeams == 2){
		rmSetAreaLocation(cenoteEast, .78, .25);	
}else{
		rmSetAreaLocation(cenoteEast, .66, .55);	
}
		rmAddAreaToClass(cenoteEast, rmClassID("classPlateau"));
        rmSetAreaWaterType(cenoteEast, "London");
		rmBuildArea(cenoteEast);


		int cenoteSE = rmCreateArea("southeast cenote");
		rmSetAreaSize(cenoteSE, 0.009, 0.009); 
		rmSetAreaCoherence(cenoteSE, .92);
		rmSetAreaLocation(cenoteSE, .55, .32);
		rmAddAreaToClass(cenoteSE, rmClassID("classPlateau"));	
        rmSetAreaWaterType(cenoteSE, "London");
		rmBuildArea(cenoteSE);


		int cenoteSW = rmCreateArea("southwest cenote");
		rmSetAreaSize(cenoteSW, 0.008, 0.009); 
		rmSetAreaCoherence(cenoteSW, .92);
		rmSetAreaLocation(cenoteSW, .45, .68);	
		rmAddAreaToClass(cenoteSW, rmClassID("classPlateau"));
        rmSetAreaWaterType(cenoteSW, "London");
		rmBuildArea(cenoteSW);

	if (cNumberTeams >= 5){
int	uberMineID = rmCreateGrouping("ubermine","sonoramegamine_03");
	rmSetGroupingMinDistance(uberMineID, 0.0);
	rmSetGroupingMaxDistance(uberMineID, 0.0);
	rmAddGroupingToClass(uberMineID, rmClassID("classPlateau"));
	rmPlaceGroupingAtLoc(uberMineID, 0, 0.5, 0.5);
}


		rmSetStatusText("",0.3);



	if (PlayerNum == 2)
{
//=========2 player fixed mines============

  	int smollMines = rmCreateObjectDef("competitive gold");
	rmAddObjectDefItem(smollMines, "mine", 1, 1.0);
	rmSetObjectDefMinDistance(smollMines, 0.0);
	rmSetObjectDefMaxDistance(smollMines, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.18, 0.49, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.44, 0.26, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.56, 0.74, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.82, 0.51, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.55, 0.1, 1);
	rmPlaceObjectDefAtLoc(smollMines, 0, 0.45, 0.9, 1);

}


//random mines

  	int eastmine = rmCreateObjectDef("east mines");
	rmAddObjectDefItem(eastmine, "mine", 1, 1.0);
	rmSetObjectDefMinDistance(eastmine, rmXFractionToMeters(0.0));
	rmSetObjectDefMaxDistance(eastmine, rmXFractionToMeters(0.45));
	rmAddObjectDefConstraint(eastmine, avoidCoinMed);
	rmAddObjectDefConstraint(eastmine, avoidTownCenter);
	rmAddObjectDefConstraint(eastmine, avoidPlateau);	
	rmAddObjectDefConstraint(eastmine, avoidWaterShort);
	rmAddObjectDefConstraint(eastmine, avoidCenter);
	rmAddObjectDefConstraint(eastmine, circleConstraint);
	rmPlaceObjectDefAtLoc(eastmine, 0, 0.5, 0.5, 6*cNumberNonGaiaPlayers);





//==========random plateaus==============

	for (j=0; < (9*cNumberNonGaiaPlayers)) {   
			int ffaCliffs = rmCreateArea("ffaCliffs"+j);
        rmSetAreaSize(ffaCliffs, rmAreaTilesToFraction(800), rmAreaTilesToFraction(900));
		rmAddAreaToClass(ffaCliffs, rmClassID("classPlateau"));
//		rmAddAreaToClass(ffaCliffs, rmClassID("center"));
		rmSetAreaCliffType(ffaCliffs, "Sonora");
		rmSetAreaCliffEdge(ffaCliffs, 1, 1, 0.0, 0.0, 2); //4,.225 looks cool too
		rmSetAreaCliffPainting(ffaCliffs, true, true, true, 1.5, true);
		rmSetAreaCliffHeight(ffaCliffs, rmRandInt(6,8), 1, 0.5);
        rmSetAreaSmoothDistance(ffaCliffs, 10);
        rmSetAreaHeightBlend(ffaCliffs, 3);
	rmAddAreaConstraint(ffaCliffs, avoidCenter);
	rmAddAreaConstraint(ffaCliffs, avoidPlateau);
	rmAddAreaConstraint(ffaCliffs, waterCoin);
//	rmAddAreaConstraint(ffaCliffs, circleConstraint2);
	rmAddAreaRemoveType(ffaCliffs, "mine");
        rmSetAreaCoherence(ffaCliffs, .93);

        rmBuildArea(ffaCliffs);  
	}
			


		rmSetStatusText("",0.4);
	
	//==============starting objects=====================

		
        int playerStart = rmCreateStartingUnitsObjectDef(5.0);
        rmSetObjectDefMinDistance(playerStart, 7.0);
        rmSetObjectDefMaxDistance(playerStart, 12.0);
	rmAddObjectDefConstraint(playerStart, avoidWaterShort);

       
        int goldID = rmCreateObjectDef("starting gold");
        rmAddObjectDefItem(goldID, "mine", 1, 3.0);
        rmSetObjectDefMinDistance(goldID, 16.0);
        rmSetObjectDefMaxDistance(goldID, 16.0);
        rmAddObjectDefConstraint(goldID, avoidCoin);



        int berryID = rmCreateObjectDef("starting berries");
        rmAddObjectDefItem(berryID, "BerryBush", 5, 4.0);
        rmSetObjectDefMinDistance(berryID, 16.0);
        rmSetObjectDefMaxDistance(berryID, 17.0);
        rmAddObjectDefConstraint(berryID, avoidCoin);
 
        int treeID = rmCreateObjectDef("starting trees");
        rmAddObjectDefItem(treeID, "UnderbrushDesert", rmRandInt(3,4), 9.0);
        rmAddObjectDefItem(treeID, "TreeSonora", rmRandInt(13,13), 9.0);
        rmSetObjectDefMinDistance(treeID, 24.0);
        rmSetObjectDefMaxDistance(treeID, 25.0);
        rmAddObjectDefConstraint(treeID, avoidTownCenterSmall);
        rmAddObjectDefConstraint(treeID, avoidCoin);
        rmAddObjectDefConstraint(treeID, avoidTree);


 
        int foodID = rmCreateObjectDef("starting hunt");
        rmAddObjectDefItem(foodID, "pronghorn", 6, 8.0);
        rmSetObjectDefMinDistance(foodID, 10.0);
        rmSetObjectDefMaxDistance(foodID, 10.0);
	rmAddObjectDefConstraint(foodID, avoidWaterShort);	
        rmSetObjectDefCreateHerd(foodID, true);
 
        int foodID2 = rmCreateObjectDef("starting hunt 2");
        rmAddObjectDefItem(foodID2, "bighornsheep", 7, 8.0);
        rmSetObjectDefMinDistance(foodID2, 35.0);
        rmSetObjectDefMaxDistance(foodID2, 35.0);
        rmSetObjectDefCreateHerd(foodID2, true);
	rmAddObjectDefConstraint(foodID2, avoidWaterShort);	
	rmAddObjectDefConstraint(foodID2, circleConstraint);


                       
		int foodID3 = rmCreateObjectDef("starting hunt 3");
        rmAddObjectDefItem(foodID3, "pronghorn", 5, 6.0);
        rmSetObjectDefMinDistance(foodID3, 48.0);
        rmSetObjectDefMaxDistance(foodID3, 48.0);
	rmAddObjectDefConstraint(foodID3, avoidWaterShort);	
	rmAddObjectDefConstraint(foodID3, circleConstraint);
//	rmAddObjectDefConstraint(foodID3, avoidPlateau);
//	rmAddObjectDefConstraint(foodID3, avoidHunt);
        rmSetObjectDefCreateHerd(foodID3, true);

	int playerNuggetID=rmCreateObjectDef("player nugget");
	rmSetNuggetDifficulty(1, 1); 
	rmAddObjectDefItem(playerNuggetID, "nugget", 1, 3.0);
    rmSetObjectDefMinDistance(playerNuggetID, 28.0);
    rmSetObjectDefMaxDistance(playerNuggetID, 35.0);
rmAddObjectDefConstraint(playerNuggetID, circleConstraint);
rmAddObjectDefConstraint(playerNuggetID, avoidTree);



		int extraberrywagon=rmCreateObjectDef("JapAn cAnT hUnT");
  rmAddObjectDefItem(extraberrywagon, "ypBerryWagon1", 1, 0.0);
  rmSetObjectDefMinDistance(extraberrywagon, 6.0);
  rmSetObjectDefMaxDistance(extraberrywagon, 7.0);




		rmSetStatusText("",0.5);  
    
    for(i=1; < cNumberNonGaiaPlayers + 1) {
		int id=rmCreateArea("Player"+i);
		rmSetPlayerArea(i, id);
		int startID = rmCreateObjectDef("object"+i);
		rmAddObjectDefItem(startID, "TownCenter", 1, 3.0);
		rmSetObjectDefMinDistance(startID, 0.0);
        rmSetObjectDefMaxDistance(startID, 3.0);
		rmPlaceObjectDefAtLoc(startID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(treeID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(treeID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(goldID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID2, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(foodID3, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
//        rmPlaceObjectDefAtLoc(berryID , i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        rmPlaceObjectDefAtLoc(playerNuggetID, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));

        rmPlaceObjectDefAtLoc(playerStart, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));


if (rmGetPlayerCiv(i) == rmGetCivID("Japanese")) {
        rmPlaceObjectDefAtLoc(extraberrywagon, i, rmPlayerLocXFraction(i), rmPlayerLocZFraction(i));
        }


	}

	rmSetStatusText("",0.6);
	/*
	==================
	resource placement
	==================
	*/



    int pronghornHerd = rmCreateObjectDef("pronghornHerd");
	rmAddObjectDefItem(pronghornHerd, "pronghorn", 6, 8.0);
	rmSetObjectDefCreateHerd(pronghornHerd, true);
	rmSetObjectDefMinDistance(pronghornHerd, 0);
	rmSetObjectDefMaxDistance(pronghornHerd, rmXFractionToMeters(0.47));
	rmAddObjectDefConstraint(pronghornHerd, circleConstraint2);
	rmAddObjectDefConstraint(pronghornHerd, avoidTownCenterMore);
	rmAddObjectDefConstraint(pronghornHerd, avoidHunt);
	rmAddObjectDefConstraint(pronghornHerd, avoidPlateauShort);
	rmAddObjectDefConstraint(pronghornHerd, cliffWater);	
	rmAddObjectDefConstraint(pronghornHerd, avoidCoin);	
	rmPlaceObjectDefAtLoc(pronghornHerd, 0, 0.5, 0.5, 6*cNumberNonGaiaPlayers);



		rmSetStatusText("",0.7);



	int nuggetID= rmCreateObjectDef("nugget"); 
	rmAddObjectDefItem(nuggetID, "Nugget", 1, 0.0); 
	rmSetObjectDefMinDistance(nuggetID, 0.0); 
	rmSetObjectDefMaxDistance(nuggetID, rmXFractionToMeters(0.5)); 
	rmAddObjectDefConstraint(nuggetID, avoidNugget); 
	rmAddObjectDefConstraint(nuggetID, circleConstraint);
	rmAddObjectDefConstraint(nuggetID, avoidTownCenter);
	rmAddObjectDefConstraint(nuggetID, avoidTownCenterMore); 
	rmAddObjectDefConstraint(nuggetID, avoidPlateauShort);
	rmAddObjectDefConstraint(nuggetID, cliffWater);	
	rmAddObjectDefConstraint(nuggetID, avoidCoin);	
	rmSetNuggetDifficulty(1, 2); 
	rmPlaceObjectDefAtLoc(nuggetID, 0, 0.5, 0.5, 5*cNumberNonGaiaPlayers);   



	int fishLand = rmCreateTerrainDistanceConstraint("fish land", "land", true, 4.0);

	int fishID=rmCreateObjectDef("fish Mahi");
	rmAddObjectDefItem(fishID, "FishBass", 1, 0.0);
	rmSetObjectDefMinDistance(fishID, 0.0);
//	rmSetObjectDefMaxDistance(fishID, rmXFractionToMeters(0.5));
	rmAddObjectDefConstraint(fishID, fishLand);
rmPlaceObjectDefInArea(fishID, 0, cenoteWest, 3.5*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(fishID, 0, cenoteEast, 3.5*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(fishID, 0, cenoteSE, 4.5*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(fishID, 0, cenoteSW, 4.5*cNumberNonGaiaPlayers);



		int mapTrees=rmCreateObjectDef("map trees");
		rmAddObjectDefItem(mapTrees, "UnderbrushDesert", rmRandInt(2,3), rmRandFloat(9.0,11.0));
		rmAddObjectDefItem(mapTrees, "TreeSonora", rmRandInt(7,8), rmRandFloat(8.0,9.0));
		rmAddObjectDefToClass(mapTrees, rmClassID("classForest")); 
		rmSetObjectDefMinDistance(mapTrees, 0);
		rmSetObjectDefMaxDistance(mapTrees, rmXFractionToMeters(0.47));
	rmAddObjectDefConstraint(mapTrees, circleConstraint);
//	rmAddObjectDefConstraint(mapTrees, cliffWater);
	rmAddObjectDefConstraint(mapTrees, avoidTree);
rmPlaceObjectDefInArea(mapTrees, 0, cenoteWest, 2*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(mapTrees, 0, cenoteEast, 2*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(mapTrees, 0, cenoteSE, 2*cNumberNonGaiaPlayers);
rmPlaceObjectDefInArea(mapTrees, 0, cenoteSW, 2*cNumberNonGaiaPlayers);



		int bonusTrees=rmCreateObjectDef("bonusTrees");
		rmAddObjectDefItem(bonusTrees, "TreeSonora", rmRandInt(3,4), rmRandFloat(8.0,19.0));
	rmAddObjectDefItem(bonusTrees, "UnderbrushDesert", rmRandInt(2,4), 10.0);
		rmAddObjectDefToClass(bonusTrees, rmClassID("classForest")); 
		rmSetObjectDefMinDistance(bonusTrees, 0);
		rmSetObjectDefMaxDistance(bonusTrees, rmXFractionToMeters(0.46));
	  	rmAddObjectDefConstraint(bonusTrees, circleConstraint);
		rmAddObjectDefConstraint(bonusTrees, forestConstraint);
		rmAddObjectDefConstraint(bonusTrees, avoidTownCenterSmall);	

	rmPlaceObjectDefAtLoc(bonusTrees, 0, 0.5, 0.5, 50*cNumberNonGaiaPlayers);   

    for(i=1; < cNumberNonGaiaPlayers*5) {
	rmPlaceObjectDefInRandomAreaOfClass(bonusTrees, 0, rmClassID("classPlateau"), 2);
}


	int avoidBighorn=rmCreateTypeDistanceConstraint("bighorn avoids food", "bighornsheep", 35.0);


    for(i=1; < cNumberNonGaiaPlayers*4) {
  	int cliffSheep = rmCreateObjectDef("sheep of mockery"+i);
	rmAddObjectDefItem(cliffSheep, "bighornsheep", 1, 1.0);
	rmSetObjectDefMinDistance(cliffSheep, 0.0);
	rmSetObjectDefMaxDistance(cliffSheep, rmXFractionToMeters(0.46));
	rmAddObjectDefConstraint(cliffSheep, circleConstraint);
	rmAddObjectDefConstraint(cliffSheep, avoidTownCenter);	
	rmAddObjectDefConstraint(cliffSheep, avoidBighorn);	
	rmPlaceObjectDefInRandomAreaOfClass(cliffSheep, 0, rmClassID("classPlateau"), 2);
}



	rmSetStatusText("",0.9);

	int avoidVultures=rmCreateTypeDistanceConstraint("avoids Vultures", "PropVulturePerching", 40.0);
	int avoidBuzzards=rmCreateTypeDistanceConstraint("buzzard avoid buzzard", "BuzzardFlock", 70.0);


	int randomVultureTreeID=rmCreateObjectDef("random vulture tree");
	rmAddObjectDefItem(randomVultureTreeID, "PropVulturePerching", 1, 3.0);
	rmSetObjectDefMinDistance(randomVultureTreeID, 0.0);
	rmSetObjectDefMaxDistance(randomVultureTreeID, rmXFractionToMeters(0.40));
    rmAddObjectDefConstraint(randomVultureTreeID, avoidPlateauShort);
	rmAddObjectDefConstraint(randomVultureTreeID, avoidTownCenter);
	rmAddObjectDefConstraint(randomVultureTreeID, avoidVultures);
	rmAddObjectDefConstraint(randomVultureTreeID, avoidCoin);
	rmPlaceObjectDefAtLoc(randomVultureTreeID, 0, 0.5, 0.5, 1.5*cNumberNonGaiaPlayers);

	int buzzardFlockID=rmCreateObjectDef("buzzards");
	rmAddObjectDefItem(buzzardFlockID, "BuzzardFlock", 1, 3.0);
	rmSetObjectDefMinDistance(buzzardFlockID, 0.0);
	rmSetObjectDefMaxDistance(buzzardFlockID, rmXFractionToMeters(0.42));
	rmAddObjectDefConstraint(buzzardFlockID, avoidBuzzards);
	rmPlaceObjectDefAtLoc(buzzardFlockID, 0, 0.5, 0.5, 3*cNumberNonGaiaPlayers);



	}



	}
 
