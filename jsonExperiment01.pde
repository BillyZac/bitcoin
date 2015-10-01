// Connects to the bitcoin API and prints the symbols. To be used as the basis for more interesting data-driven visualizations. 

JSONArray values;
int wait_period = 1; // Determines data refresh wait period (in minutes) 

void setup() {
  size (500,500);
  fill(230,0,230);  // Set the rectangle fill color to pink.
}

void draw() {
  background(0);

  if ( (minute() % wait_period) == 0 ) { // Check every wait_period minutes
    // values = loadJSONArray("bitcoin_data.json");  // Local file for testing
    values = loadJSONArray("http://api.bitcoincharts.com/v1/markets.json");
 
    for (int i = 0; i < values.size(); i++) { 
      JSONObject animal = values.getJSONObject(i); 
      
      String symbol = animal.getString("symbol");
  
      if (symbol.equals("btcnCNY")) {
        rect(200, 200, 100, 100);
      }
      
      println(symbol);
      
      
  }  
    
  }
}