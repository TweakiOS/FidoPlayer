# FidoPlayer    
a widget enables play/pause stream, without presenting main app

1. The error **"AVAudioSession activation failed: Error Domain=NSOSStatusErrorDomain Code=561015905"** indicates that the `AVAudioSession` could not be activated. 
### **Ensure Proper Widget and App Communication**
If this issue occurs in a widget, ensure that the widget is not directly trying to configure `AVAudioSession`. Widgets run in a restricted environment and cannot activate audio sessions. Instead, delegate audio playback to the main app using `App Groups` or `Intents`.

2. Unfortunately, on real device, to enable App Group feature, need an enroalled developer account



