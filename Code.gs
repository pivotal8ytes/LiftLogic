function onEdit(e) {
  
  var editRange = { // Last lift Column
    top : 2,
    bottom : 30,
    left : 4,
    right : 4
  };
  
  // Exit if we're out of range
  var thisRow = e.range.getRow();
  if (thisRow < editRange.top || thisRow > editRange.bottom) return;
  
  var thisCol = e.range.getColumn();
  if (thisCol < editRange.left || thisCol > editRange.right) return;
  
   var thisCol = e.range.getColumn();
  if (thisCol != 4) return;

  // Insert new column for next archive entry
  
 SpreadsheetApp.getActiveSpreadsheet().insertColumnBefore(8);
  
  // Add date of last edit to When column to show up on tablet resolution
  
  var ss = e.range.getSheet();
  ss.getRange(thisRow,5)   // "E" is column 5
    .setValue(new Date()); // Set time of edit in "E"
 
// Add date of last edit to Archives section
  
  ss.getRange(1,8)   // "I" is column 8
 .setValue(new Date()); // Set time of edit in archives

// Add the last lift to the archive
  
var ss = e.range.getSheet();
  ss.getRange(thisRow,8)   // "H" is column 8
     .setValue(SpreadsheetApp.getActiveSpreadsheet().getRange(e.source.getActiveRange().getA1Notation()).getValue()); // Archive last lift in "H"
      
 

  //    if (SpreadsheetApp.getActiveSpreadsheet().getActiveSheet().getActiveCell() == 4)
//    {
//      var v = SpreadsheetApp.getActiveSpreadsheet().getRange(e.source.getActiveRange().getA1Notation()).getValue();
//      SpreadsheetApp.getActiveSheet().getRange('F2').setValue("Hello");
//    }
}