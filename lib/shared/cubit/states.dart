 abstract class AppState{}
 class IntiAppState extends AppState{}
 class ChangBottomBarIndix extends AppState{}
 
 class GetBusLodinState extends AppState{}
 class GetBusSuccSTate extends AppState{}
 class GetBusErorrState extends AppState{
   final String error;
  GetBusErorrState(this.error);
 }

class GetSpoLodinState extends AppState{}
class GetSpoSuccSTate extends AppState{}
class GetSpoErorrState extends AppState{
   final String error;
   GetSpoErorrState(this.error);
}

class GetScLodinState extends AppState{}
class GetScSuccSTate extends AppState{}
class GetScErorrState extends AppState{
   final String error;
  GetScErorrState(this.error);
 }
class GetSrLodinState extends AppState{}
class GetSrSuccSTate extends AppState{}
class GetSrErorrState extends AppState{
   final String error;
  GetSrErorrState(this.error);
 }
 class GetHeLodinState extends AppState{}
class GetHeSuccSTate extends AppState{}
class GetHeErorrState extends AppState{
   final String error;
  GetHeErorrState(this.error);
 }
 class GetENLodinState extends AppState{}
class GetENSuccSTate extends AppState{}
class GetENErorrState extends AppState{
   final String error;
  GetENErorrState(this.error);
 }
 class GetTECLodinState extends AppState{}
class GetTECSuccSTate extends AppState{}
class GetTECErorrState extends AppState{
   final String error;
  GetTECErorrState(this.error);
 }


 class Mood extends AppState{}
 class ChangLange extends AppState{}
 class ChangColor extends AppState{}
