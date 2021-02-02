//+------------------------------------------------------------------+
//|                                              VolumeIndicator.mq4 |
//|                                          Copyright 2021, Hussian |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2021, Hussian"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
int returnCode = 0;
void OnTick()
  {
//---
  double highestCandle = iHighest(_Symbol,_Period,MODE_HIGH,3);
  double closeCandle = High[0];
  int fourth = iVolume(NULL,0,3);
  int thirdBar=iVolume(NULL,0,2);
    int secondBar=iVolume(NULL,0,1);
     int currentBar=iVolume(NULL,0,0);
   //  if(currentBar>secondBar){
   if((currentBar > secondBar) && (secondBar > thirdBar) &&(thirdBar > fourth)){
      drawHLine(closeCandle);
     
    returnCode = MessageBox(closeCandle,"Indicator",MB_OK);
      Alert(closeCandle);
    
   }
   
   
  }
 void drawHLine(int highestCandle){

   ObjectDelete("Line");
   ObjectCreate("Line",OBJ_HLINE,0,Time[0],High[highestCandle]);
   
   
   }
//+------------------------------------------------------------------+
