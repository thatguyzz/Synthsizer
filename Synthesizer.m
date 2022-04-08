classdef Synthesizer < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        UpdateplotwithfixedscaleButton  matlab.ui.control.Button
        ScalesignalSpinner              matlab.ui.control.Spinner
        ScalesignalLabel                matlab.ui.control.Label
        KeysusedinpianokeyboardqwertyuiopIfpianodoesntworkpushLabel  matlab.ui.control.Label
        Signalisprocceinorderoscmultioscsumset0todisableoneofthemLabel  matlab.ui.control.Label
        FrequencySpinner                matlab.ui.control.Spinner
        FrequencySpinnerLabel           matlab.ui.control.Label
        FrequencyKnob                   matlab.ui.control.Knob
        FrequencyKnobLabel              matlab.ui.control.Label
        LinearRisewidthSpinner          matlab.ui.control.Spinner
        LinearRisewidthSpinnerLabel     matlab.ui.control.Label
        LinearRisewidthKnob             matlab.ui.control.Knob
        Fillzeroswith1forcorrectmultiplySwitch  matlab.ui.control.ToggleSwitch
        Fillzeroswith1forcorrectmultiplySwitchLabel  matlab.ui.control.Label
        SpinnerOscillationamplitude     matlab.ui.control.Spinner
        SpinnerOscillationsum           matlab.ui.control.Spinner
        SpinnerOscillationmultiply      matlab.ui.control.Spinner
        OscillationAmplitudeKnob        matlab.ui.control.Knob
        OscillationAmplitudeKnobLabel   matlab.ui.control.Label
        OscillationFrequencySumKnob     matlab.ui.control.Knob
        OscillationFrequencySumKnobLabel  matlab.ui.control.Label
        HowtomixsignalsnotconnectedwithoscillationfreqSwitch  matlab.ui.control.ToggleSwitch
        HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel  matlab.ui.control.Label
        OscillationFrequencymultiplyKnob  matlab.ui.control.Knob
        OscillationFrequencymultiplyKnobLabel  matlab.ui.control.Label
        K5B                             matlab.ui.control.Image
        K4B                             matlab.ui.control.Image
        K3B                             matlab.ui.control.Image
        K2B                             matlab.ui.control.Image
        K1B                             matlab.ui.control.Image
        K5PB                            matlab.ui.control.Image
        K4PB                            matlab.ui.control.Image
        K3PB                            matlab.ui.control.Image
        K2PB                            matlab.ui.control.Image
        K1PB                            matlab.ui.control.Image
        K7                              matlab.ui.control.Image
        K6                              matlab.ui.control.Image
        K5                              matlab.ui.control.Image
        K4                              matlab.ui.control.Image
        K2                              matlab.ui.control.Image
        K3                              matlab.ui.control.Image
        K1                              matlab.ui.control.Image
        K7P                             matlab.ui.control.Image
        K6P                             matlab.ui.control.Image
        K5P                             matlab.ui.control.Image
        K4P                             matlab.ui.control.Image
        K3P                             matlab.ui.control.Image
        K2P                             matlab.ui.control.Image
        K1P                             matlab.ui.control.Image
        UpdateplotButton                matlab.ui.control.Button
        PlayButton2                     matlab.ui.control.Button
        AddsignalPanel                  matlab.ui.container.Panel
        YoucanalsobrowseforsavefolderLabel  matlab.ui.control.Label
        DirectoryLabel                  matlab.ui.control.Label
        BrowseButton                    matlab.ui.control.Button
        AddpresetButton                 matlab.ui.control.Button
        NewpresetnameEditField          matlab.ui.control.EditField
        NewpresetnameEditFieldLabel     matlab.ui.control.Label
        UITable                         matlab.ui.control.Table
        XlengthKnob                     matlab.ui.control.Knob
        XlengthKnobLabel                matlab.ui.control.Label
        AmplitudeKnob                   matlab.ui.control.Knob
        AmplitudeKnobLabel              matlab.ui.control.Label
        MiddleKnob                      matlab.ui.control.Knob
        MiddleKnobLabel                 matlab.ui.control.Label
        Label                           matlab.ui.control.Label
        PlayButton1                     matlab.ui.control.Button
        XlengthSpinner                  matlab.ui.control.Spinner
        XlengthLabel                    matlab.ui.control.Label
        SignalnumberButtonGroup         matlab.ui.container.ButtonGroup
        SignalButton5                   matlab.ui.control.RadioButton
        SignalButton4                   matlab.ui.control.RadioButton
        SignalButton3                   matlab.ui.control.RadioButton
        SignalButton2                   matlab.ui.control.RadioButton
        SignalButton1                   matlab.ui.control.RadioButton
        AddButton                       matlab.ui.control.Button
        ShapeButtonGroup                matlab.ui.container.ButtonGroup
        RectangleButton                 matlab.ui.control.RadioButton
        TriangleButton                  matlab.ui.control.RadioButton
        SinusButton                     matlab.ui.control.RadioButton
        MiddleSpinner                   matlab.ui.control.Spinner
        MiddleLabel                     matlab.ui.control.Label
        AmplitudeSpinner                matlab.ui.control.Spinner
        AmplitudeSpinnerLabel           matlab.ui.control.Label
        UIAxes2                         matlab.ui.control.UIAxes
        UIAxes                          matlab.ui.control.UIAxes
    end

    
    properties (Access = private)
        nr = 1; %subsignal watching
        
        t = 1:44101;
        S1 = 0;     %calculated vectors, it will be filled with zeros in 1st function
        S2 = 1;
        S3 = 0;
        S4 = 0;
        S5 = 0;
        SGenerated = 0;
        
        flagS1 = false;
        flagS2 = false;
        flagS3 = false;
        flagS4 = false;
        flagS5 = false;
        
        OutputSignal;
        
        
        
        Shape1 = "Sinus";  %signal x properties
        Middle1 = 0;
        Amplitude1 = 0;
        Len1 = 0;
        
        Shape2 = "Sinus";  %signal x properties
        Middle2 = 0;
        Amplitude2 = 0;
        Len2 = 0;
        
        Shape3 = "Sinus";  %signal x properties
        Middle3 = 0;
        Amplitude3 = 0;
        Len3 = 0;
        
        Shape4 = "Sinus";  %signal x properties
        Middle4 = 0;
        Amplitude4 = 0;
        Len4 = 0;
        
        Shape5 = "Sinus";  %signal x properties
        Middle5 = 0;
        Amplitude5 = 0;
        Len5= 0;
        
       %Z DRUGIEGO PROJEKTU 
        Fs;
        oyShort;
        q;
        w;
        e;
        r;
        tt;
        y;
        u;
        ii;
        o;
        p;
        leftbracket;
        rightbracket;
        time;
        sig;
        
        Presetlist;
        Presetpath;
        directory;
        directoryflag=0;
        
        
    end
    
    
    
    methods (Access = public)
        
        function Sig = CreateSig(app) %create subsignals
            Sig = 0;
            left = round((app.MiddleSpinner.Value-app.XlengthSpinner.Value/2)*44100);
            right = round((app.MiddleSpinner.Value+app.XlengthSpinner.Value/2)*44100);
            middlee = round((left+right)/2);
            amplitude = app.AmplitudeSpinner.Value;
            leng = app.XlengthSpinner.Value*44100;
            
            if left < 0
                left = left + 1;
            end
            
            if right > 44101
                right = right - 1;
            end
            
            
                
                Sig1(1:44101) = 0;
                
                if app.SinusButton.Value == 1
                    for v = app.t
                        Sig1(v) = amplitude*sin(2*pi*v/44100-app.MiddleSpinner.Value*2*pi);

                    end
                    
                end
                
                
                if app.TriangleButton.Value == 1
                    
                    
                    for i = app.t
                            
                            if (i >=left && i <= right)
                                if i<middlee
                                    Sig1(i) = 2*amplitude*i/leng-(2*amplitude*middlee/leng-amplitude);
                                    
                                else
                                    Sig1(i) = -2*amplitude*i/leng+(2*amplitude*middlee/leng+amplitude);
                                end
                                
                            else
                                Sig1(i) = 0;
                            end
                                                        
                    end
                end
                    
                if app.RectangleButton.Value == 1
                    
                        for i = app.t
                            
                            if (i >=left && i <= right)
                                Sig1(i) = amplitude;
                            else
                                Sig1(i) = 0;
                            end
                                                        
                        end
                                           
                    
                end
                
                Sig = Sig1;
                
            
            
            
            
        end
    end
    
    methods (Access = private)
        
        function freqvec = scalefreq(app,Sig) %scaling signal with frequency for play functions(it's shorter)
            
            freq = app.FrequencySpinner.Value;
            
            St = 0;
                       
            St = Sig(1:freq:end);            
            
            n = 1;
            
            for i = 1:44101
                if n == length(St)
                    n=1;
                end
                freqvec(i) = St(n);
                n = n+1;
            end
            
        end
        
        
        
        
        
        
        
        function Output = innerKeyboardOutput(app, innerfreqency)
            
            innertime = 1:441001;
            
            
            %filling oscillators with new frequency sin signal
            MultiplyOscillation(innertime) = app.SpinnerOscillationamplitude.Value*sin(innertime/44100*app.SpinnerOscillationmultiply.Value*2*pi);
            SumOscillation(innertime) = app.SpinnerOscillationamplitude.Value*sin(innertime/44100*app.SpinnerOscillationsum.Value*2*pi);
            
            %our volume raise
            rise = linspace(0,100,app.LinearRisewidthSpinner.Value/100*441001);
            
            tempSignal = 0;%temporary 1s signal(we'll save here our sum or multiply result)
            
            if app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value == "Sum"
                tempSignal = app.S1 + app.S2 + app.S3 + app.S4 + app.S5;
            end
            
            if  app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value == "Multiply"%we have to replace 0 with 1, because later we'll multiply signals, but if someone dont want to do that, in GUI is switch for that
                tempS1 = 0;
                tempS2 = 0;
                tempS3 = 0;
                tempS4 = 0;
                tempS5 = 0;
                
                if app.Fillzeroswith1forcorrectmultiplySwitch.Value == "On"
                    n=1;
                    
                    for n = 1:44101
                        if app.S1(n) == 0
                            tempS1(n) = 1;
                        
                        else
                            tempS1(n)=app.S1(n); 
                        end
                    
                        if app.S2(n) == 0
                            tempS2(n) = 1;
                        
                        else
                            tempS2(n)=app.S1(n);
                        
                        end
                    
                        if app.S2(n) == 0
                            tempS3(n) = 1;
                        
                        else
                            tempS3(n)=app.S1(n);
                        end
                    
                        if app.S2(n) == 0
                            tempS4(n) = 1;
                        
                        else
                            tempS4(n)=app.S1(n);
                        end
                    
                        if app.S2(n) == 0
                            tempS5(n) = 1;
                        
                        else
                            tempS5(n)=app.S1(n);
                        end
                    end
                    tempSignal = tempS1 .* tempS2 .* tempS3 .* tempS4 .* tempS5; %now we can multiply it
                end
                
                if app.Fillzeroswith1forcorrectmultiplySwitch.Value == "Off" %common part
                                        
                    if app.flagS1 == true
                        tempSignal = app.S1;
                    end
                    
                    if app.flagS2 == true
                        tempSignal = app.S1 .* app.S2;
                    end
                    
                    if app.flagS3 == true
                        tempSignal = app.S1 .* app.S2.* app.S3;
                    end
                    
                    if app.flagS4 == true
                        tempSignal = app.S1 .* app.S2 .* app.S3 .* app.S4;
                    end
                    
                    if app.flagS5 == true
                        tempSignal = app.S1 .* app.S2 .* app.S3 .* app.S4 .* app.S5;
                    end
                                        
                end
                 
            end
            
            
            tempSignal2 = tempSignal(1:innerfreqency:end); %converting signal with fixed frequency
            
            n = 1;
            
            for c = 1:441001          %signal stretching ->10s long
                if n == length(tempSignal2)
                    n=1;
                end
                innerOutputSignal(c) = tempSignal2(n);
                n = n+1;
            end
            
            
            
            if app.SpinnerOscillationamplitude.Value == 0
                %nothing happens
            else
                if app.SpinnerOscillationsum.Value == 0
                    %nothing happens
                else
                    n = 1;
                    for n = 1:441001 %realize summing oscillation
                        innerOutputSignal(n) = innerOutputSignal(n) + SumOscillation(n);
                    end
                end
                
                if app.SpinnerOscillationmultiply.Value == 0
                    %nothing happens
                else
                    n = 1;
                    for n = 1:441001 %realize multiplying oscillation
                        innerOutputSignal(n) = innerOutputSignal(n) * MultiplyOscillation(n);
                    end
                end
            end
            
            
            if app.LinearRisewidthSpinner.Value == 0
                %nothing happens
            else
                for n= 1:app.LinearRisewidthSpinner.Value/100*441001   %volume rise            
                    
                    innerOutputSignal(n) = innerOutputSignal(n)*rise(n)/100;               
                end
            end
          
            Output = innerOutputSignal;
            
        end
        
        function KeyboardOutput(app)
            x = nthroot(2,12);
            
            innerfreqency = app.FrequencySpinner.Value;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency); 
            app.OutputSignal = innerOutputSignal;
            app.q =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);          
            app.w =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.e =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.r =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.tt =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.y =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.u =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.ii =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.o =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.p =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.leftbracket =  audioplayer(innerOutputSignal, 44100);
            
            innerfreqency = innerfreqency*x;
            innerOutputSignal = app.innerKeyboardOutput(innerfreqency);
            app.rightbracket =  audioplayer(innerOutputSignal, 44100);
            
        end
        
        function number = Shapenumber(app,Shape)
            if strcmp(Shape,"Sinus")
               number = 1; 

            elseif strcmp(Shape,"Triangle")
                number = 1;   

            elseif strcmp(Shape,"Rectangle")
               number = 1;  
               
            else
                number = 0;
            end
            
            
        end
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.SignalButton2.Enable = "off"; %configurate window
            app.SignalButton3.Enable = "off";
            app.SignalButton4.Enable = "off";
            app.SignalButton5.Enable = "off";
            app.PlayButton1.Enable = "off";
            app.PlayButton2.Enable = "off";
            app.UpdateplotButton.Enable = "off";
            app.UpdateplotwithfixedscaleButton.Enable = 'off';
            app.FrequencyKnob.Value = app.FrequencySpinner.Value;
            
            
        end

        % Button pushed function: AddButton
        function AddButtonPushed(app, event)
            if app.SignalButton1.Value == 1
                app.flagS1 = true;
                app.S1 = CreateSig(app);             
                plot(app.UIAxes2, app.t, app.S1);
                
                app.Shape1 = app.ShapeButtonGroup.SelectedObject.Text;  %fill properties 
                app.Middle1 = app.MiddleSpinner.Value;
                app.Amplitude1 = app.AmplitudeSpinner.Value;
                app.Len1 = app.XlengthSpinner.Value;
                
                app.SignalButton2.Enable = "on";
                app.PlayButton1.Enable = "on";
                app.PlayButton2.Enable = "on";
                app.UpdateplotButton.Enable = "on";
                app.UpdateplotwithfixedscaleButton.Enable = 'on';
                
                if app.S2 == 1
                    app.S2(1:44101) = 0;
                    app.S3(1:44101) = 0;
                    app.S4(1:44101) = 0;
                    app.S5(1:44101) = 0; 
                end
            end
                
            if app.SignalButton2.Value == 1
                app.flagS2 = true;
                app.S2 = CreateSig(app);             
                plot(app.UIAxes2, app.t, app.S2);
                
                app.Shape2 = app.ShapeButtonGroup.SelectedObject.Text;  %fill properties 
                app.Middle2 = app.MiddleSpinner.Value;
                app.Amplitude2 = app.AmplitudeSpinner.Value;
                app.Len2 = app.XlengthSpinner.Value;
                
                app.SignalButton3.Enable = "on";
                                
            end
                
            if app.SignalButton3.Value == 1
                app.flagS3 = true;
                app.S3 = CreateSig(app);             
                plot(app.UIAxes2, app.t, app.S3);
                
                app.Shape3 = app.ShapeButtonGroup.SelectedObject.Text;  %fill properties 
                app.Middle3 = app.MiddleSpinner.Value;
                app.Amplitude3 = app.AmplitudeSpinner.Value;
                app.Len3 = app.XlengthSpinner.Value;
                
                app.SignalButton4.Enable = "on";
            end
            
            if app.SignalButton4.Value == 1
                app.flagS4 = true;
                app.S4 = CreateSig(app);             
                plot(app.UIAxes2, app.t, app.S4);
                
                app.Shape4 = app.ShapeButtonGroup.SelectedObject.Text;  %fill properties 
                app.Middle4 = app.MiddleSpinner.Value;
                app.Amplitude4 = app.AmplitudeSpinner.Value;
                app.Len4 = app.XlengthSpinner.Value;
                
                app.SignalButton5.Enable = "on";
            end
            
            if app.SignalButton5.Value == 1
                app.flagS5 = true;
                app.S5 = CreateSig(app);             
                plot(app.UIAxes2, app.t, app.S5);
                
                app.Shape5 = app.ShapeButtonGroup.SelectedObject.Text;  %fill properties 
                app.Middle5 = app.MiddleSpinner.Value;
                app.Amplitude5 = app.AmplitudeSpinner.Value;
                app.Len5 = app.XlengthSpinner.Value;
               
            end
            
            app.KeyboardOutput();
            
            
        end

        % Selection changed function: SignalnumberButtonGroup
        function SignalnumberButtonGroupSelectionChanged(app, event)
            selectedButton = app.SignalnumberButtonGroup.SelectedObject.Text;
            if strcmp(selectedButton,"1")
                plot(app.UIAxes2, app.t, app.S1);
                
                if strcmp(app.Shape1,"Sinus")
                    set(app.ShapeButtonGroup,'SelectedObject',app.SinusButton)
                elseif strcmp(app.Shape1,"Triangle")
                    set(app.ShapeButtonGroup,'SelectedObject',app.TriangleButton)
                else 
                    set(app.ShapeButtonGroup,'SelectedObject',app.RectangleButton)
                end
                  %fill properties 
                app.MiddleSpinner.Value = app.Middle1;
                app.AmplitudeSpinner.Value = app.Amplitude1;
                app.XlengthSpinner.Value = app.Len1;
                app.nr = 1;
            end
            if strcmp(selectedButton,"2")
                plot(app.UIAxes2, app.t, app.S2);
                
                if strcmp(app.Shape2,"Sinus")
                    set(app.ShapeButtonGroup,'SelectedObject',app.SinusButton)
                elseif strcmp(app.Shape2,"Triangle")
                    set(app.ShapeButtonGroup,'SelectedObject',app.TriangleButton)
                else 
                    set(app.ShapeButtonGroup,'SelectedObject',app.RectangleButton)
                end
                  %fill properties 
                app.MiddleSpinner.Value = app.Middle2;
                app.AmplitudeSpinner.Value = app.Amplitude2;
                app.XlengthSpinner.Value = app.Len2;
                app.nr = 2;
            end
           if strcmp(selectedButton,"3")
                plot(app.UIAxes2, app.t, app.S3);
                
                if strcmp(app.Shape3,"Sinus")
                    set(app.ShapeButtonGroup,'SelectedObject',app.SinusButton)
                elseif strcmp(app.Shape3,"Triangle")
                    set(app.ShapeButtonGroup,'SelectedObject',app.TriangleButton)
                else 
                    set(app.ShapeButtonGroup,'SelectedObject',app.RectangleButton)
                end
                  %fill properties 
                app.MiddleSpinner.Value = app.Middle3;
                app.AmplitudeSpinner.Value = app.Amplitude3;
                app.XlengthSpinner.Value = app.Len3;
                app.nr = 3;
           end
           
           if strcmp(selectedButton,"4")
                plot(app.UIAxes2, app.t, app.S4);
                
                if strcmp(app.Shape4,"Sinus")
                    set(app.ShapeButtonGroup,'SelectedObject',app.SinusButton)
                elseif strcmp(app.Shape4,"Triangle")
                    set(app.ShapeButtonGroup,'SelectedObject',app.TriangleButton)
                else 
                    set(app.ShapeButtonGroup,'SelectedObject',app.RectangleButton)
                end
                  %fill properties 
                app.MiddleSpinner.Value = app.Middle4;
                app.AmplitudeSpinner.Value = app.Amplitude4;
                app.XlengthSpinner.Value = app.Len4;
                app.nr = 4;
           end
           
           if strcmp(selectedButton,"5")
                plot(app.UIAxes2, app.t, app.S5);
                
                if strcmp(app.Shape5,"Sinus")
                    set(app.ShapeButtonGroup,'SelectedObject',app.SinusButton)
                elseif strcmp(app.Shape5,"Triangle")
                    set(app.ShapeButtonGroup,'SelectedObject',app.TriangleButton)
                else 
                    set(app.ShapeButtonGroup,'SelectedObject',app.RectangleButton)
                end
                  %fill properties 
                app.MiddleSpinner.Value = app.Middle5;
                app.AmplitudeSpinner.Value = app.Amplitude5;
                app.XlengthSpinner.Value = app.Len5;
                app.nr = 5;
           end
           
           app.MiddleKnob.Value = app.MiddleSpinner.Value;
           app.AmplitudeKnob.Value = app.AmplitudeSpinner.Value;
           app.XlengthKnob.Value=app.XlengthSpinner.Value;
           app.FrequencyKnob.Value = app.FrequencySpinner.Value;
        end

        % Button pushed function: PlayButton1
        function PlayButton1Pushed(app, event)
            selectedButton = app.SignalnumberButtonGroup.SelectedObject.Text;
            if strcmp(selectedButton,"1")
                St = scalefreq(app,app.S1);
                plot(app.UIAxes2, St);                        
                sound(St,44100);
            end
            if strcmp(selectedButton,"2")
                St = scalefreq(app,app.S2);
                plot(app.UIAxes2, St);                        
                sound(St,44100);
            end
            if strcmp(selectedButton,"3")
                St = scalefreq(app,app.S3);
                plot(app.UIAxes2, St);                        
                sound(St,44100);
            end
            if strcmp(selectedButton,"4")
                St = scalefreq(app,app.S4);
                plot(app.UIAxes2, St);                        
                sound(St,44100);
            end
            if strcmp(selectedButton,"5")
                St = scalefreq(app,app.S5);
                plot(app.UIAxes2, St);                        
                sound(St,44100);
            end
            
        end

        % Button pushed function: UpdateplotButton
        function UpdateplotButtonPushed(app, event)
            app.KeyboardOutput();
            
            
              
            plot(app.UIAxes, app.OutputSignal);
 
        end

        % Button pushed function: PlayButton2
        function PlayButton2Pushed(app, event)
            app.KeyboardOutput();
            SignalOneSeclong(1:44101) = app.OutputSignal(1:44101);
            plot(app.UIAxes, SignalOneSeclong);
            sound(SignalOneSeclong,44100);
        end

        % Key press function: UIFigure
        function UIFigureKeyPress(app, event)
            key = event.Key;
            
        if app.flagS1 == true
            switch key
                case 'q'
                    app.K1.Visible="off";
                    play(app.q);                    
                case 'w'
                    app.K1B.Visible="off";
                    play(app.w);
                case 'e'
                    app.K2.Visible="off";
                    play(app.e);
                case 'r'
                    app.K2B.Visible="off";
                    play(app.r);
                case 't'
                    app.K3.Visible="off";
                    play(app.tt);
                case 'y'
                    app.K4.Visible="off";
                    play(app.y);
                case 'u'
                     app.K3B.Visible="off";  
                     play(app.u);
                case 'i'
                    app.K5.Visible="off";  
                    play(app.ii);
                case 'o'
                    app.K4B.Visible="off";  
                    play(app.o);
                case 'p'
                    app.K6.Visible="off";  
                    play(app.p);
                case 'leftbracket'
                    app.K5B.Visible="off";
                    play(app.leftbracket);
                case 'rightbracket'
                    app.K7.Visible="off";    
                    play(app.rightbracket);
            end
        end
            
        end

        % Key release function: UIFigure
        function UIFigureKeyRelease(app, event)
            key = event.Key;
   if app.flagS1 == true         
            switch key
                case 'q'
                    app.K1.Visible="on";
                    stop(app.q);                    
                case 'w'
                    app.K1B.Visible="on";
                    stop(app.w);
                case 'e'
                    app.K2.Visible="on";
                    stop(app.e);
                case 'r'
                    app.K2B.Visible="on";
                    stop(app.r);
                case 't'
                    app.K3.Visible="on";
                    stop(app.tt);
                case 'y'
                    app.K4.Visible="on";
                    stop(app.y);
                case 'u'
                     app.K3B.Visible="on";  
                     stop(app.u);
                case 'i'
                    app.K5.Visible="on";  
                    stop(app.ii);
                case 'o'
                    app.K4B.Visible="on";  
                    stop(app.o);
                case 'p'
                    app.K6.Visible="on";  
                    stop(app.p);
                case 'leftbracket'
                    app.K5B.Visible="on";
                    stop(app.leftbracket);
                case 'rightbracket'
                    app.K7.Visible="on";    
                    stop(app.rightbracket);
            end
   end      
            
        end

        % Value changed function: MiddleKnob
        function MiddleKnobValueChanged(app, event)
            value = app.MiddleKnob.Value;
            app.MiddleSpinner.Value = value;
        end

        % Value changed function: AmplitudeKnob
        function AmplitudeKnobValueChanged(app, event)
            value = app.AmplitudeKnob.Value;
            app.AmplitudeSpinner.Value = value;
        end

        % Value changed function: XlengthKnob
        function XlengthKnobValueChanged(app, event)
            value = app.XlengthKnob.Value;
            app.XlengthSpinner.Value = value;
        end

        % Value changed function: FrequencyKnob
        function FrequencyKnobValueChanged(app, event)
            value = app.FrequencyKnob.Value;
            app.FrequencySpinner.Value=value;
        end

        % Value changed function: OscillationFrequencymultiplyKnob
        function OscillationFrequencymultiplyKnobValueChanged(app, event)
            value = app.OscillationFrequencymultiplyKnob.Value;
            app.SpinnerOscillationmultiply.Value=value;
        end

        % Value changed function: OscillationFrequencySumKnob
        function OscillationFrequencySumKnobValueChanged(app, event)
            value = app.OscillationFrequencySumKnob.Value;
            app.SpinnerOscillationsum.Value=value;
        end

        % Value changed function: LinearRisewidthKnob
        function LinearRisewidthKnobValueChanged(app, event)
            value = app.LinearRisewidthKnob.Value;
            app.LinearRisewidthSpinner.Value=value;
        end

        % Value changed function: OscillationAmplitudeKnob
        function OscillationAmplitudeKnobValueChanged(app, event)
            value = app.OscillationAmplitudeKnob.Value;
            app.SpinnerOscillationamplitude.Value=value;
        end

        % Button pushed function: UpdateplotwithfixedscaleButton
        function UpdateplotwithfixedscaleButtonPushed(app, event)
            app.KeyboardOutput();
            scaledsignal = app.OutputSignal(1:441001*app.ScalesignalSpinner.Value/100);
            plot(app.UIAxes,scaledsignal);
        end

        % Button pushed function: BrowseButton
        function BrowseButtonPushed(app, event)
            path=uigetdir;                    % Calls 'uigetdir' to obtain the directory location from the user
            app.Presetpath=path;
            app.UIFigure.Visible = 'off';     % Toggles figure visible.  These two lines of code work-around an issue whether the figure is sent to the background.
            app.UIFigure.Visible = 'on';      
            app.DirectoryLabel.Text=path;  % Sets the label text to be the selected path
                        
            pathobj=dir(path);                         % Obtains the contents of the selected path.
                                                 
            pathcells={pathobj(:).name}';   % Gets the name of the files/folders of the contents and stores them appropriately in a cell array
                               
            regex = "**/*.txt";
            
            idx = cellfun('isempty',regexp(pathcells,regex,'match'));
            
            selectedcells = pathcells(~idx);
            
            for i = 1:length(selectedcells)
                str = selectedcells{i,:};
                str=str(1:end-4);
                selectedcells{i,:} = str;
            end
            
            app.directoryflag = 1;
            
            app.Presetlist = selectedcells;
            
            app.UITable.Data=selectedcells;                  % Displays the directory information to the UITable.
            
            app.UITable.Enable = "on";
        end

        % Cell selection callback: UITable
        function UITableCellSelection(app, event)
            indices = event.Indices;            %decoder function
            A = app.Presetpath
            B = "\";
            C = app.Presetlist(indices(1));
            D = ".txt";
            
            app.directory  = A(1,:) + B + C(1) + D;
            
            data = readmatrix(app.directory);
            
            %--------------------------------------------------------------------
            %clear old values
            zerovect(1:44101) = 0;
            app.S1 = zerovect;
            app.S2 = zerovect;
            app.S3 = zerovect;
            app.S4 = zerovect;
            app.S5 = zerovect;
            
            
            app.PlayButton1.Enable = "off";
            app.PlayButton2.Enable = "off";
            app.UpdateplotButton.Enable = "off";
            app.UpdateplotwithfixedscaleButton.Enable = 'off';
            
            %--------------------------------------------------------------------
            %signal 1 properties
          
          app.Shape1 = data(1);
          app.Middle1 = data(2);
          app.Amplitude1 = data(3);
          app.Len1 = data(4);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          app.AmplitudeSpinner.Value = app.Amplitude1;
          app.XlengthSpinner.Value = app.Len1;
          app.MiddleSpinner.Value = app.Middle1;
          
          app.AmplitudeKnob.Value = app.Amplitude1;
          app.XlengthKnob.Value = app.Len1;
          app.MiddleKnob.Value = app.Middle1;
          %--------------------------------------------------------------------
          %signal 2 properties
          
          app.Shape2 = data(5);
          app.Middle2 = data(6);
          app.Amplitude2 = data(7);
          app.Len2 = data(8);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          
          %--------------------------------------------------------------------
          %signal 3 properties
          
          app.Shape3 = data(9);
          app.Middle3 = data(10);
          app.Amplitude3 = data(11);
          app.Len3 = data(12);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          
          %--------------------------------------------------------------------
          %signal 4 properties
          
          app.Shape4 = data(13);
          app.Middle4 = data(14);
          app.Amplitude4 = data(15);
          app.Len4 = data(16);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          
          %--------------------------------------------------------------------
          %signal 5 properties
          
          app.Shape5 = data(17);
          app.Middle5 = data(18);
          app.Amplitude5 = data(19);
          app.Len5 = data(20);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          
          %--------------------------------------------------------------------
          %signal onoff flags
          app.flagS1 = data(21);
          app.flagS2 = data(22);
          app.flagS3 = data(23);
          app.flagS4 = data(24);
          app.flagS5 = data(25);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          if app.flagS1 == 1
                app.SignalButton1.Enable='on';
              
                app.PlayButton1.Enable = "on";
                app.PlayButton2.Enable = "on";
                app.UpdateplotButton.Enable = "on";
                app.UpdateplotwithfixedscaleButton.Enable = 'on';
          end
          
          if app.flagS2 == 1
              app.SignalButton2.Enable='on';
              
          else
              app.SignalButton2.Enable='off';
          end   
          
          if app.flagS3 == 1
              app.SignalButton3.Enable='on';
          else
              app.SignalButton3.Enable='off';
          end 
          
          if app.flagS4 == 1
              app.SignalButton4.Enable='on';
          else
              app.SignalButton4.Enable='off';
          end 
          
          if app.flagS5 == 1
              app.SignalButton5.Enable='on';
          else
              app.SignalButton5.Enable='off';
          end 
          
          %--------------------------------------------------------------------
          % generated signal properties
          app.FrequencySpinner.Value = data(26);
          app.SpinnerOscillationamplitude.Value = data(27);
          app.SpinnerOscillationmultiply.Value = data(28);
          app.SpinnerOscillationsum.Value = data(29);
          app.LinearRisewidthSpinner.Value = data(30);
          howto = data(31);
          fill = data(32);
          %--------------------------------------------------------------------
          %set knobs, etc for section above
          if howto == 0
              app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value = 'Sum';
          else
              app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value = 'Multiply';
          end
          
          if fill == 0
              app.Fillzeroswith1forcorrectmultiplySwitch.Value = 'Off';
          else
              app.Fillzeroswith1forcorrectmultiplySwitch.Value = 'On';
          end
          
          app.FrequencyKnob.Value = app.FrequencySpinner.Value;
          app.OscillationAmplitudeKnob.Value = app.SpinnerOscillationamplitude.Value;
          app.OscillationFrequencymultiplyKnob.Value = app.SpinnerOscillationmultiply.Value;
          app.OscillationFrequencySumKnob.Value = app.SpinnerOscillationsum.Value;
          app.LinearRisewidthKnob.Value = app.LinearRisewidthSpinner.Value;
          %--------------------------------------------------------------------
          
          app.UITable.Enable = "off";
          
          
            %[app.SpinnerOscillationamplitude.Value, app.SpinnerOscillationmultiply.Value, app.SpinnerOscillationsum.Value] = textread(directory,'%f %f %f', 1)
            
        end

        % Button pushed function: AddpresetButton
        function AddpresetButtonPushed(app, event)
            s = ','; %delimiter
            howto = 0;
            fill = 0;
            
            if app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value == true
                howto = 1;
            else
                howto = 1;
            end
            
            if app.Fillzeroswith1forcorrectmultiplySwitch.Value == true
                fill = 1;
            else
                fill = 0;
            end
            
            Sha1 = Shapenumber(app,app.Shape1);
            Sha2 = Shapenumber(app,app.Shape2);
            Sha3 = Shapenumber(app,app.Shape3);
            Sha4 = Shapenumber(app,app.Shape4);
            Sha5 = Shapenumber(app,app.Shape5);
            
            data = {Sha1,app.Middle1,app.Amplitude1,app.Len1,...  %signal properties
          Sha2,app.Middle2,app.Amplitude2,app.Len2,...%signal properties
          Sha3,app.Middle3,app.Amplitude3,app.Len3,...%signal properties
          Sha4,app.Middle4,app.Amplitude4,app.Len4,...%signal properties
          Sha5,app.Middle5,app.Amplitude5,app.Len5,...%signal properties
          app.flagS1,app.flagS2,app.flagS3,app.flagS4,app.flagS5,...%signal add flags
          app.FrequencySpinner.Value,app.SpinnerOscillationamplitude.Value,...% generated signal properties
          app.SpinnerOscillationmultiply.Value,app.SpinnerOscillationsum.Value,...
          app.LinearRisewidthSpinner.Value,howto,fill};

            
      
            A = app.Presetpath;
            B = "\";
            C = app.NewpresetnameEditField.Value;
            D = ".txt";
            
            
            
            
            if app.directoryflag==1     %if user selected folder, it will be saved there
                dir = strcat(A,B,C,D)
            else
                dir = strcat("Presets",B,C,D)
            end

            
            writecell(data,dir);
        
        
       
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [0 0 1485 767];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.KeyPressFcn = createCallbackFcn(app, @UIFigureKeyPress, true);
            app.UIFigure.KeyReleaseFcn = createCallbackFcn(app, @UIFigureKeyRelease, true);
            app.UIFigure.WindowState = 'fullscreen';

            % Create UIAxes
            app.UIAxes = uiaxes(app.UIFigure);
            title(app.UIAxes, 'Generated signal')
            xlabel(app.UIAxes, 'Samples')
            ylabel(app.UIAxes, 'Amplitude')
            app.UIAxes.PlotBoxAspectRatio = [3.56989247311828 1 1];
            app.UIAxes.Position = [37 31 712 335];

            % Create AddsignalPanel
            app.AddsignalPanel = uipanel(app.UIFigure);
            app.AddsignalPanel.Title = 'Add signal';
            app.AddsignalPanel.Position = [37 441 1426 313];

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.AddsignalPanel);
            title(app.UIAxes2, 'Subsignal')
            xlabel(app.UIAxes2, 'Samples')
            ylabel(app.UIAxes2, 'Amplitude')
            app.UIAxes2.PlotBoxAspectRatio = [1.8058690744921 1 1];
            app.UIAxes2.Position = [772 57 368 233];

            % Create AmplitudeSpinnerLabel
            app.AmplitudeSpinnerLabel = uilabel(app.AddsignalPanel);
            app.AmplitudeSpinnerLabel.HorizontalAlignment = 'right';
            app.AmplitudeSpinnerLabel.Position = [406 122 59 22];
            app.AmplitudeSpinnerLabel.Text = 'Amplitude';

            % Create AmplitudeSpinner
            app.AmplitudeSpinner = uispinner(app.AddsignalPanel);
            app.AmplitudeSpinner.Step = 0.01;
            app.AmplitudeSpinner.Limits = [-10 10];
            app.AmplitudeSpinner.Position = [480 122 100 22];

            % Create MiddleLabel
            app.MiddleLabel = uilabel(app.AddsignalPanel);
            app.MiddleLabel.HorizontalAlignment = 'right';
            app.MiddleLabel.Position = [240 122 41 22];
            app.MiddleLabel.Text = 'Middle';

            % Create MiddleSpinner
            app.MiddleSpinner = uispinner(app.AddsignalPanel);
            app.MiddleSpinner.Step = 0.01;
            app.MiddleSpinner.Limits = [0 1];
            app.MiddleSpinner.Position = [296 122 100 22];

            % Create ShapeButtonGroup
            app.ShapeButtonGroup = uibuttongroup(app.AddsignalPanel);
            app.ShapeButtonGroup.Title = 'Shape';
            app.ShapeButtonGroup.Position = [158 179 123 106];

            % Create SinusButton
            app.SinusButton = uiradiobutton(app.ShapeButtonGroup);
            app.SinusButton.Text = 'Sinus';
            app.SinusButton.Position = [11 60 58 22];
            app.SinusButton.Value = true;

            % Create TriangleButton
            app.TriangleButton = uiradiobutton(app.ShapeButtonGroup);
            app.TriangleButton.Text = 'Triangle';
            app.TriangleButton.Position = [11 38 65 22];

            % Create RectangleButton
            app.RectangleButton = uiradiobutton(app.ShapeButtonGroup);
            app.RectangleButton.Text = 'Rectangle';
            app.RectangleButton.Position = [11 16 76 22];

            % Create AddButton
            app.AddButton = uibutton(app.AddsignalPanel, 'push');
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @AddButtonPushed, true);
            app.AddButton.Position = [36 11 100 22];
            app.AddButton.Text = 'Add';

            % Create SignalnumberButtonGroup
            app.SignalnumberButtonGroup = uibuttongroup(app.AddsignalPanel);
            app.SignalnumberButtonGroup.SelectionChangedFcn = createCallbackFcn(app, @SignalnumberButtonGroupSelectionChanged, true);
            app.SignalnumberButtonGroup.Title = 'Signal number';
            app.SignalnumberButtonGroup.Position = [17 144 100 141];

            % Create SignalButton1
            app.SignalButton1 = uiradiobutton(app.SignalnumberButtonGroup);
            app.SignalButton1.Text = '1';
            app.SignalButton1.Position = [11 95 33 22];
            app.SignalButton1.Value = true;

            % Create SignalButton2
            app.SignalButton2 = uiradiobutton(app.SignalnumberButtonGroup);
            app.SignalButton2.Text = '2';
            app.SignalButton2.Position = [11 73 33 22];

            % Create SignalButton3
            app.SignalButton3 = uiradiobutton(app.SignalnumberButtonGroup);
            app.SignalButton3.Text = '3';
            app.SignalButton3.Position = [11 51 33 22];

            % Create SignalButton4
            app.SignalButton4 = uiradiobutton(app.SignalnumberButtonGroup);
            app.SignalButton4.Text = '4';
            app.SignalButton4.Position = [11 30 33 22];

            % Create SignalButton5
            app.SignalButton5 = uiradiobutton(app.SignalnumberButtonGroup);
            app.SignalButton5.Text = '5';
            app.SignalButton5.Position = [11 9 33 22];

            % Create XlengthLabel
            app.XlengthLabel = uilabel(app.AddsignalPanel);
            app.XlengthLabel.HorizontalAlignment = 'right';
            app.XlengthLabel.Position = [587 122 49 22];
            app.XlengthLabel.Text = 'X length';

            % Create XlengthSpinner
            app.XlengthSpinner = uispinner(app.AddsignalPanel);
            app.XlengthSpinner.Step = 0.01;
            app.XlengthSpinner.Limits = [0 1];
            app.XlengthSpinner.Position = [647 122 100 22];

            % Create PlayButton1
            app.PlayButton1 = uibutton(app.AddsignalPanel, 'push');
            app.PlayButton1.ButtonPushedFcn = createCallbackFcn(app, @PlayButton1Pushed, true);
            app.PlayButton1.Position = [152 12 100 22];
            app.PlayButton1.Text = 'Play';

            % Create Label
            app.Label = uilabel(app.AddsignalPanel);
            app.Label.Position = [784 11 362 34];
            app.Label.Text = {'You must push Play to see and hear subsignal with fixed frequency'; '(frequency control below left)'};

            % Create MiddleKnobLabel
            app.MiddleKnobLabel = uilabel(app.AddsignalPanel);
            app.MiddleKnobLabel.HorizontalAlignment = 'center';
            app.MiddleKnobLabel.Position = [320.5 149 72 22];
            app.MiddleKnobLabel.Text = 'Middle Knob';

            % Create MiddleKnob
            app.MiddleKnob = uiknob(app.AddsignalPanel, 'continuous');
            app.MiddleKnob.Limits = [0 1];
            app.MiddleKnob.MajorTicks = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
            app.MiddleKnob.MajorTickLabels = {'0 ', '0.1 ', '0.2 ', '0.3 ', '0.4 ', '0.5 ', '0.6 ', '0.7 ', '0.8 ', '0.9', '1'};
            app.MiddleKnob.ValueChangedFcn = createCallbackFcn(app, @MiddleKnobValueChanged, true);
            app.MiddleKnob.Position = [326 205 60 60];

            % Create AmplitudeKnobLabel
            app.AmplitudeKnobLabel = uilabel(app.AddsignalPanel);
            app.AmplitudeKnobLabel.HorizontalAlignment = 'center';
            app.AmplitudeKnobLabel.Position = [480 153 90 22];
            app.AmplitudeKnobLabel.Text = 'Amplitude Knob';

            % Create AmplitudeKnob
            app.AmplitudeKnob = uiknob(app.AddsignalPanel, 'continuous');
            app.AmplitudeKnob.Limits = [-10 10];
            app.AmplitudeKnob.ValueChangedFcn = createCallbackFcn(app, @AmplitudeKnobValueChanged, true);
            app.AmplitudeKnob.Position = [494 209 60 60];

            % Create XlengthKnobLabel
            app.XlengthKnobLabel = uilabel(app.AddsignalPanel);
            app.XlengthKnobLabel.HorizontalAlignment = 'center';
            app.XlengthKnobLabel.Position = [653 149 81 22];
            app.XlengthKnobLabel.Text = 'X length Knob';

            % Create XlengthKnob
            app.XlengthKnob = uiknob(app.AddsignalPanel, 'continuous');
            app.XlengthKnob.Limits = [0 1];
            app.XlengthKnob.MajorTicks = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
            app.XlengthKnob.MajorTickLabels = {'0 ', '0.1 ', '0.2 ', '0.3 ', '0.4 ', '0.5 ', '0.6 ', '0.7 ', '0.8 ', '0.9', '1'};
            app.XlengthKnob.ValueChangedFcn = createCallbackFcn(app, @XlengthKnobValueChanged, true);
            app.XlengthKnob.MinorTicks = [0 0.05 0.1 0.15 0.2 0.25 0.3 0.35 0.4 0.45 0.5 0.55 0.6 0.65 0.7 0.75 0.8 0.85 0.9 0.95 1];
            app.XlengthKnob.Position = [663 205 60 60];

            % Create UITable
            app.UITable = uitable(app.AddsignalPanel);
            app.UITable.ColumnName = {'Select preset to load'};
            app.UITable.RowName = {};
            app.UITable.CellSelectionCallback = createCallbackFcn(app, @UITableCellSelection, true);
            app.UITable.Position = [1162 60 245 172];

            % Create NewpresetnameEditFieldLabel
            app.NewpresetnameEditFieldLabel = uilabel(app.AddsignalPanel);
            app.NewpresetnameEditFieldLabel.HorizontalAlignment = 'right';
            app.NewpresetnameEditFieldLabel.Position = [1148 29 99 22];
            app.NewpresetnameEditFieldLabel.Text = 'New preset name';

            % Create NewpresetnameEditField
            app.NewpresetnameEditField = uieditfield(app.AddsignalPanel, 'text');
            app.NewpresetnameEditField.Position = [1262 29 156 22];

            % Create AddpresetButton
            app.AddpresetButton = uibutton(app.AddsignalPanel, 'push');
            app.AddpresetButton.ButtonPushedFcn = createCallbackFcn(app, @AddpresetButtonPushed, true);
            app.AddpresetButton.Position = [1264 5 153 22];
            app.AddpresetButton.Text = 'Add preset';

            % Create BrowseButton
            app.BrowseButton = uibutton(app.AddsignalPanel, 'push');
            app.BrowseButton.ButtonPushedFcn = createCallbackFcn(app, @BrowseButtonPushed, true);
            app.BrowseButton.Position = [1165 263 100 22];
            app.BrowseButton.Text = 'Browse';

            % Create DirectoryLabel
            app.DirectoryLabel = uilabel(app.AddsignalPanel);
            app.DirectoryLabel.Position = [1172 238 246 22];
            app.DirectoryLabel.Text = 'Directory';

            % Create YoucanalsobrowseforsavefolderLabel
            app.YoucanalsobrowseforsavefolderLabel = uilabel(app.AddsignalPanel);
            app.YoucanalsobrowseforsavefolderLabel.Position = [1275 258 136 27];
            app.YoucanalsobrowseforsavefolderLabel.Text = {'You can also browse for '; 'save folder'};

            % Create PlayButton2
            app.PlayButton2 = uibutton(app.UIFigure, 'push');
            app.PlayButton2.ButtonPushedFcn = createCallbackFcn(app, @PlayButton2Pushed, true);
            app.PlayButton2.Position = [66 402 100 22];
            app.PlayButton2.Text = 'Play';

            % Create UpdateplotButton
            app.UpdateplotButton = uibutton(app.UIFigure, 'push');
            app.UpdateplotButton.ButtonPushedFcn = createCallbackFcn(app, @UpdateplotButtonPushed, true);
            app.UpdateplotButton.Position = [181 403 105 22];
            app.UpdateplotButton.Text = 'Update plot';

            % Create K1P
            app.K1P = uiimage(app.UIFigure);
            app.K1P.Position = [1250 242 30 183];
            app.K1P.ImageSource = './media/Left_pressed.png';

            % Create K2P
            app.K2P = uiimage(app.UIFigure);
            app.K2P.Position = [1279 242 34 183];
            app.K2P.ImageSource = './media/Middle_pressed.png';

            % Create K3P
            app.K3P = uiimage(app.UIFigure);
            app.K3P.Position = [1312 242 31 183];
            app.K3P.ImageSource = './media/Right_pressed.png';

            % Create K4P
            app.K4P = uiimage(app.UIFigure);
            app.K4P.Position = [1342 242 30 183];
            app.K4P.ImageSource = './media/Left_pressed.png';

            % Create K5P
            app.K5P = uiimage(app.UIFigure);
            app.K5P.Position = [1371 242 34 183];
            app.K5P.ImageSource = './media/Middle_pressed.png';

            % Create K6P
            app.K6P = uiimage(app.UIFigure);
            app.K6P.Position = [1404 242 34 183];
            app.K6P.ImageSource = './media/Middle_pressed.png';

            % Create K7P
            app.K7P = uiimage(app.UIFigure);
            app.K7P.Position = [1437 242 31 183];
            app.K7P.ImageSource = './media/Right_pressed.png';

            % Create K1
            app.K1 = uiimage(app.UIFigure);
            app.K1.Position = [1248 242 32 183];
            app.K1.ImageSource = './media/Left.png';

            % Create K3
            app.K3 = uiimage(app.UIFigure);
            app.K3.Position = [1311 242 32 183];
            app.K3.ImageSource = './media/Right.png';

            % Create K2
            app.K2 = uiimage(app.UIFigure);
            app.K2.Position = [1279 242 32 183];
            app.K2.ImageSource = './media/Middle.png';

            % Create K4
            app.K4 = uiimage(app.UIFigure);
            app.K4.Position = [1342 242 32 183];
            app.K4.ImageSource = './media/Left.png';

            % Create K5
            app.K5 = uiimage(app.UIFigure);
            app.K5.Position = [1373 242 32 183];
            app.K5.ImageSource = './media/Middle.png';

            % Create K6
            app.K6 = uiimage(app.UIFigure);
            app.K6.Position = [1405 242 32 183];
            app.K6.ImageSource = './media/Middle.png';

            % Create K7
            app.K7 = uiimage(app.UIFigure);
            app.K7.Position = [1436 242 32 183];
            app.K7.ImageSource = './media/Right.png';

            % Create K1PB
            app.K1PB = uiimage(app.UIFigure);
            app.K1PB.Position = [1270 300 19 124];
            app.K1PB.ImageSource = './media/black_pressed.png';

            % Create K2PB
            app.K2PB = uiimage(app.UIFigure);
            app.K2PB.Position = [1302 299 17 125];
            app.K2PB.ImageSource = './media/black_pressed.png';

            % Create K3PB
            app.K3PB = uiimage(app.UIFigure);
            app.K3PB.Position = [1364 299 19 125];
            app.K3PB.ImageSource = './media/black_pressed.png';

            % Create K4PB
            app.K4PB = uiimage(app.UIFigure);
            app.K4PB.Position = [1396 299 19 125];
            app.K4PB.ImageSource = './media/black_pressed.png';

            % Create K5PB
            app.K5PB = uiimage(app.UIFigure);
            app.K5PB.Position = [1427 299 19 126];
            app.K5PB.ImageSource = './media/black_pressed.png';

            % Create K1B
            app.K1B = uiimage(app.UIFigure);
            app.K1B.Position = [1270 300 20 124];
            app.K1B.ImageSource = './media/black.png';

            % Create K2B
            app.K2B = uiimage(app.UIFigure);
            app.K2B.Position = [1301 299 20 125];
            app.K2B.ImageSource = './media/black.png';

            % Create K3B
            app.K3B = uiimage(app.UIFigure);
            app.K3B.Position = [1364 299 20 126];
            app.K3B.ImageSource = './media/black.png';

            % Create K4B
            app.K4B = uiimage(app.UIFigure);
            app.K4B.Position = [1396 299 20 125];
            app.K4B.ImageSource = './media/black.png';

            % Create K5B
            app.K5B = uiimage(app.UIFigure);
            app.K5B.Position = [1427 299 20 126];
            app.K5B.ImageSource = './media/black.png';

            % Create OscillationFrequencymultiplyKnobLabel
            app.OscillationFrequencymultiplyKnobLabel = uilabel(app.UIFigure);
            app.OscillationFrequencymultiplyKnobLabel.HorizontalAlignment = 'center';
            app.OscillationFrequencymultiplyKnobLabel.Position = [742 287 173 22];
            app.OscillationFrequencymultiplyKnobLabel.Text = 'Oscillation Frequency (multiply)';

            % Create OscillationFrequencymultiplyKnob
            app.OscillationFrequencymultiplyKnob = uiknob(app.UIFigure, 'continuous');
            app.OscillationFrequencymultiplyKnob.Limits = [0 10];
            app.OscillationFrequencymultiplyKnob.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.OscillationFrequencymultiplyKnob.ValueChangedFcn = createCallbackFcn(app, @OscillationFrequencymultiplyKnobValueChanged, true);
            app.OscillationFrequencymultiplyKnob.Position = [798 343 60 60];

            % Create HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel = uilabel(app.UIFigure);
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel.HorizontalAlignment = 'center';
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel.Position = [1001 54 194 27];
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitchLabel.Text = {'How to mix signals? '; '(not connected with oscillation freq)'};

            % Create HowtomixsignalsnotconnectedwithoscillationfreqSwitch
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch = uiswitch(app.UIFigure, 'toggle');
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Items = {'Sum', 'Multiply'};
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Position = [1087 117 20 45];
            app.HowtomixsignalsnotconnectedwithoscillationfreqSwitch.Value = 'Sum';

            % Create OscillationFrequencySumKnobLabel
            app.OscillationFrequencySumKnobLabel = uilabel(app.UIFigure);
            app.OscillationFrequencySumKnobLabel.HorizontalAlignment = 'center';
            app.OscillationFrequencySumKnobLabel.Position = [914 287 157 22];
            app.OscillationFrequencySumKnobLabel.Text = 'Oscillation Frequency (Sum)';

            % Create OscillationFrequencySumKnob
            app.OscillationFrequencySumKnob = uiknob(app.UIFigure, 'continuous');
            app.OscillationFrequencySumKnob.Limits = [0 10];
            app.OscillationFrequencySumKnob.MajorTicks = [0 1 2 3 4 5 6 7 8 9 10];
            app.OscillationFrequencySumKnob.ValueChangedFcn = createCallbackFcn(app, @OscillationFrequencySumKnobValueChanged, true);
            app.OscillationFrequencySumKnob.Position = [962 343 60 60];

            % Create OscillationAmplitudeKnobLabel
            app.OscillationAmplitudeKnobLabel = uilabel(app.UIFigure);
            app.OscillationAmplitudeKnobLabel.HorizontalAlignment = 'center';
            app.OscillationAmplitudeKnobLabel.Position = [1086 286 117 22];
            app.OscillationAmplitudeKnobLabel.Text = 'Oscillation Amplitude';

            % Create OscillationAmplitudeKnob
            app.OscillationAmplitudeKnob = uiknob(app.UIFigure, 'continuous');
            app.OscillationAmplitudeKnob.Limits = [-10 10];
            app.OscillationAmplitudeKnob.ValueChangedFcn = createCallbackFcn(app, @OscillationAmplitudeKnobValueChanged, true);
            app.OscillationAmplitudeKnob.Position = [1114 342 60 60];

            % Create SpinnerOscillationmultiply
            app.SpinnerOscillationmultiply = uispinner(app.UIFigure);
            app.SpinnerOscillationmultiply.Step = 0.01;
            app.SpinnerOscillationmultiply.Limits = [0 1000];
            app.SpinnerOscillationmultiply.Position = [778 255 100 22];

            % Create SpinnerOscillationsum
            app.SpinnerOscillationsum = uispinner(app.UIFigure);
            app.SpinnerOscillationsum.Step = 0.01;
            app.SpinnerOscillationsum.Limits = [0 1000];
            app.SpinnerOscillationsum.Position = [942 255 100 22];

            % Create SpinnerOscillationamplitude
            app.SpinnerOscillationamplitude = uispinner(app.UIFigure);
            app.SpinnerOscillationamplitude.Step = 0.01;
            app.SpinnerOscillationamplitude.Limits = [-10 10];
            app.SpinnerOscillationamplitude.Position = [1095 255 100 22];

            % Create Fillzeroswith1forcorrectmultiplySwitchLabel
            app.Fillzeroswith1forcorrectmultiplySwitchLabel = uilabel(app.UIFigure);
            app.Fillzeroswith1forcorrectmultiplySwitchLabel.HorizontalAlignment = 'center';
            app.Fillzeroswith1forcorrectmultiplySwitchLabel.Position = [1202 54 272 27];
            app.Fillzeroswith1forcorrectmultiplySwitchLabel.Text = {'Replace zeros with ones while multiplying?'; '(otherwise you will get common part of the signal)'};

            % Create Fillzeroswith1forcorrectmultiplySwitch
            app.Fillzeroswith1forcorrectmultiplySwitch = uiswitch(app.UIFigure, 'toggle');
            app.Fillzeroswith1forcorrectmultiplySwitch.Position = [1327 117 20 45];

            % Create LinearRisewidthKnob
            app.LinearRisewidthKnob = uiknob(app.UIFigure, 'continuous');
            app.LinearRisewidthKnob.ValueChangedFcn = createCallbackFcn(app, @LinearRisewidthKnobValueChanged, true);
            app.LinearRisewidthKnob.Position = [787 109 60 60];

            % Create LinearRisewidthSpinnerLabel
            app.LinearRisewidthSpinnerLabel = uilabel(app.UIFigure);
            app.LinearRisewidthSpinnerLabel.HorizontalAlignment = 'right';
            app.LinearRisewidthSpinnerLabel.Position = [770 56 115 22];
            app.LinearRisewidthSpinnerLabel.Text = 'Linear Rise[width %]';

            % Create LinearRisewidthSpinner
            app.LinearRisewidthSpinner = uispinner(app.UIFigure);
            app.LinearRisewidthSpinner.Step = 0.01;
            app.LinearRisewidthSpinner.Limits = [0 100];
            app.LinearRisewidthSpinner.Position = [900 56 100 22];

            % Create FrequencyKnobLabel
            app.FrequencyKnobLabel = uilabel(app.UIFigure);
            app.FrequencyKnobLabel.HorizontalAlignment = 'center';
            app.FrequencyKnobLabel.Position = [343 322 62 22];
            app.FrequencyKnobLabel.Text = 'Frequency';

            % Create FrequencyKnob
            app.FrequencyKnob = uiknob(app.UIFigure, 'continuous');
            app.FrequencyKnob.Limits = [0 1000];
            app.FrequencyKnob.MajorTicks = [0 100 200 300 400 500 600 700 800 900 1000];
            app.FrequencyKnob.MajorTickLabels = {'0', '100', '200', '300', '400', '500', '600', '700', '800', '900', '1000', '', '', '', '', '', '20000'};
            app.FrequencyKnob.ValueChangedFcn = createCallbackFcn(app, @FrequencyKnobValueChanged, true);
            app.FrequencyKnob.Position = [343 378 60 60];

            % Create FrequencySpinnerLabel
            app.FrequencySpinnerLabel = uilabel(app.UIFigure);
            app.FrequencySpinnerLabel.HorizontalAlignment = 'right';
            app.FrequencySpinnerLabel.Position = [448 381 62 22];
            app.FrequencySpinnerLabel.Text = 'Frequency';

            % Create FrequencySpinner
            app.FrequencySpinner = uispinner(app.UIFigure);
            app.FrequencySpinner.Limits = [1 20000];
            app.FrequencySpinner.Position = [525 381 100 22];
            app.FrequencySpinner.Value = 200;

            % Create Signalisprocceinorderoscmultioscsumset0todisableoneofthemLabel
            app.Signalisprocceinorderoscmultioscsumset0todisableoneofthemLabel = uilabel(app.UIFigure);
            app.Signalisprocceinorderoscmultioscsumset0todisableoneofthemLabel.Position = [770 420 483 22];
            app.Signalisprocceinorderoscmultioscsumset0todisableoneofthemLabel.Text = 'The signal is processed in sequence: osc multi -> osc sum (set 0 to disable one of them)';

            % Create KeysusedinpianokeyboardqwertyuiopIfpianodoesntworkpushLabel
            app.KeysusedinpianokeyboardqwertyuiopIfpianodoesntworkpushLabel = uilabel(app.UIFigure);
            app.KeysusedinpianokeyboardqwertyuiopIfpianodoesntworkpushLabel.Position = [1216 204 270 27];
            app.KeysusedinpianokeyboardqwertyuiopIfpianodoesntworkpushLabel.Text = {'Keys used in piano keyboard: q w e r t y u i o p [ ]'; 'If piano doesn''t work, click on the background.'};

            % Create ScalesignalLabel
            app.ScalesignalLabel = uilabel(app.UIFigure);
            app.ScalesignalLabel.HorizontalAlignment = 'right';
            app.ScalesignalLabel.Position = [73 361 91 22];
            app.ScalesignalLabel.Text = 'Scale [signal %]';

            % Create ScalesignalSpinner
            app.ScalesignalSpinner = uispinner(app.UIFigure);
            app.ScalesignalSpinner.Limits = [1 100];
            app.ScalesignalSpinner.Position = [178 361 100 22];
            app.ScalesignalSpinner.Value = 1;

            % Create UpdateplotwithfixedscaleButton
            app.UpdateplotwithfixedscaleButton = uibutton(app.UIFigure, 'push');
            app.UpdateplotwithfixedscaleButton.ButtonPushedFcn = createCallbackFcn(app, @UpdateplotwithfixedscaleButtonPushed, true);
            app.UpdateplotwithfixedscaleButton.Position = [96 322 161 22];
            app.UpdateplotwithfixedscaleButton.Text = 'Update plot with fixed scale';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Synthesizer

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end