//+------------------------------------------------------------------+
//|                                                            a.mq4 |
//|                        Copyright 2022, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2022, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
datetime barTime;
void OnTick()
  {
    if(Time[0]>barTime)
     {
      barTime=Time[0];
    int hi = iHighest(NULL,0,MODE_HIGH,12,0);
    int hi2 = iLowest(NULL,0,MODE_LOW,12,0);
    
    int hi_ = iHighest(NULL,0,MODE_HIGH,3,0);
    int hi2_ = iLowest(NULL,0,MODE_LOW,3,0);   
    
    double val=High[hi];
    double val2=Low[hi2];
    
    double val_=High[hi_];
    double val2_=Low[hi2_];
    
    double avg = iMA(NULL,0,5,0,MODE_SMMA,PRICE_MEDIAN,1 );
    double avg2 = iMA(NULL,0,10,0,MODE_SMMA,PRICE_MEDIAN,1 );
    double avg3 = iMA(NULL,0,3,0,MODE_SMMA,PRICE_MEDIAN,1 );
    
    double avgx = iMA(NULL,0,5,0,MODE_SMMA,PRICE_MEDIAN,2 );
    double avgx2 = iMA(NULL,0,10,0,MODE_SMMA,PRICE_MEDIAN,2 );   
    
    datetime et = TimeCurrent()+(3*60*60);
    datetime et2 = TimeCurrent()+(3*60*60);
    datetime et3 = TimeCurrent()+(500*60*60);
    
    //double  AccountEquity();
    double something = (0.01*(AccountEquity()*110))/AccountEquity();
    double lotsize = NormalizeDouble(something,2);
    
    double g = val-Bid;
    double g2 = Ask-val2;
    
    double g_ = val_-Bid;
    double g2_ = Ask-val2_;
    
    Print (lotsize);
    if ( avg>avg2 )

    {
       

         //  int ticket=OrderSend(NULL,4,0.01,Bid +g,30,Bid+g-0.02, Bid+g+0.001,NULL,360000,et);
          //  int ticket3=OrderSend(NULL,4,0.01,Bid +g,30,Bid+g-0.001, Bid+g+0.002,NULL,360000,et);
         int ticket3=OrderSend(NULL,4,0.1,Bid +g,30,Bid+g-0.0004, Bid+g+0.0012,NULL,360000,et3);
          
               
    }         
    if ( avg<avg2 )

    {
       

         //  int ticket=OrderSend(NULL,4,0.01,Bid +g,30,Bid+g-0.02, Bid+g+0.001,NULL,360000,et);
          //  int ticket3=OrderSend(NULL,4,0.01,Bid +g,30,Bid+g-0.001, Bid+g+0.002,NULL,360000,et);
         int ticket3=OrderSend(NULL,5,0.1,Ask -g2,30,Ask-g2+0.0012, Ask-g2-0.0004,NULL,360000,et3);
          
               
    }      
   
    if (Hour() ==9 )
    {
           //  int ticket3=OrderSend(NULL,4,0.1,Bid +g,30,Bid+g-0.001, Bid+g+0.001,NULL,360000,et);
    }  
    
   if (Hour() ==9 )
    {
          // int ticket2=OrderSend(NULL,4,0.1,Bid +g,30,Bid+g-0.001, Bid+g+0.001,NULL,360000,et3);
    }   
  
  
  
  
    
   //if ((Minute()==10) || (Minute()==20) || (Minute()==30) || (Minute()==40) || (Minute()==50) || (Minute()==59))

   if ((Hour() ==12) || (Hour() ==9)|| (Hour() ==10|| (Hour() ==11)|| (Hour() ==13)|| (Hour() ==14)|| (Hour() ==15)))
    {
        // int ticket3=OrderSend(NULL,4,1,Bid +g,300,Bid+g-0.0005, Bid+g+0.0005,NULL,360000,et3);
    }    
    
    
   if ((Hour() ==12) || (Hour() ==9)|| (Hour() ==10|| (Hour() ==11)|| (Hour() ==13)|| (Hour() ==14)|| (Hour() ==15)))
    {
       //  int ticket4=OrderSend(NULL,5,1,Ask -g2,300,Ask-g2+0.002, Ask-g2-0.001,NULL,360000,et3);
    }  
    
     
   
 
    
    
    
    if ((Hour() ==22) )
      CloseBuyPositions();
   }
  }
//+------------------------------------------------------------------+


void CloseBuyPositions()
{
int total=OrdersTotal();

      for (int i = total - 1; i >=0; i--) 
      {

            if (OrderSelect(i, SELECT_BY_POS,MODE_TRADES))
              {
                   bool closed = OrderClose( OrderTicket(), OrderLots(), OrderClosePrice(), 5, White);
                }
         }
}