classdef appsevval_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                       matlab.ui.Figure
        TabGroup                       matlab.ui.container.TabGroup
        DataAcquisitionTab             matlab.ui.container.Tab
        TabGroup2                      matlab.ui.container.TabGroup
        RecordTab                      matlab.ui.container.Tab
        PlayRecordingButton            matlab.ui.control.Button
        AudioLengthsEditField          matlab.ui.control.NumericEditField
        AudioLengthsEditFieldLabel     matlab.ui.control.Label
        StartRecordingButton           matlab.ui.control.Button
        FsSlider                       matlab.ui.control.Slider
        FsSliderLabel                  matlab.ui.control.Label
        UIAxes                         matlab.ui.control.UIAxes
        ImportTab                      matlab.ui.container.Tab
        ImportButton                   matlab.ui.control.Button
        PleaseEntertheFileNameEditField  matlab.ui.control.EditField
        PleaseEntertheFileNameEditFieldLabel  matlab.ui.control.Label
        FSTextArea                     matlab.ui.control.TextArea
        FSLabel                        matlab.ui.control.Label
        UIAxes_2                       matlab.ui.control.UIAxes
        DataGenerationTab              matlab.ui.container.Tab
        TabGroup3                      matlab.ui.container.TabGroup
        SinusoidTab                    matlab.ui.container.Tab
        PleaseEntertheParametersLabel  matlab.ui.control.Label
        GenerateButton                 matlab.ui.control.Button
        PhasedegreeEditField_2         matlab.ui.control.NumericEditField
        PhasedegreeLabel               matlab.ui.control.Label
        FrequencyEditField             matlab.ui.control.NumericEditField
        FrequencyEditFieldLabel        matlab.ui.control.Label
        AmplitudeEditField             matlab.ui.control.NumericEditField
        AmplitudeEditFieldLabel        matlab.ui.control.Label
        UIAxes2                        matlab.ui.control.UIAxes
        WindowedSinusoidTab            matlab.ui.container.Tab
        HammingButton                  matlab.ui.control.Button
        HannButton                     matlab.ui.control.Button
        RectangularButton              matlab.ui.control.Button
        TriangularButton               matlab.ui.control.Button
        WindowLengthsEditField         matlab.ui.control.NumericEditField
        WindowLengthsEditFieldLabel    matlab.ui.control.Label
        StartingTimesEditField         matlab.ui.control.NumericEditField
        StartingTimesEditFieldLabel    matlab.ui.control.Label
        PhasedegreeEditField           matlab.ui.control.NumericEditField
        PhasedegreeEditFieldLabel      matlab.ui.control.Label
        FrequencyEditField_2           matlab.ui.control.NumericEditField
        FrequencyEditField_2Label      matlab.ui.control.Label
        AmplitudeEditField_2           matlab.ui.control.NumericEditField
        AmplitudeEditField_2Label      matlab.ui.control.Label
        UIAxes2_2                      matlab.ui.control.UIAxes
        MultipleCosineTab              matlab.ui.container.Tab
        CompEditField                  matlab.ui.control.NumericEditField
        CompEditFieldLabel             matlab.ui.control.Label
        Phase4EditField                matlab.ui.control.NumericEditField
        Phase4EditFieldLabel           matlab.ui.control.Label
        Frequency4EditField            matlab.ui.control.NumericEditField
        Frequency4EditFieldLabel       matlab.ui.control.Label
        Amplitude4EditField            matlab.ui.control.NumericEditField
        Amplitude4EditFieldLabel       matlab.ui.control.Label
        Phase3EditField                matlab.ui.control.NumericEditField
        Phase3EditFieldLabel           matlab.ui.control.Label
        Frequency3EditField            matlab.ui.control.NumericEditField
        Frequency3EditFieldLabel       matlab.ui.control.Label
        Amplitude3EditField            matlab.ui.control.NumericEditField
        Amplitude3EditFieldLabel       matlab.ui.control.Label
        Phase2EditField                matlab.ui.control.NumericEditField
        Phase2EditFieldLabel           matlab.ui.control.Label
        Frequency2EditField            matlab.ui.control.NumericEditField
        Frequency2EditFieldLabel       matlab.ui.control.Label
        Amplitude2EditField            matlab.ui.control.NumericEditField
        Amplitude2EditFieldLabel       matlab.ui.control.Label
        Phase1EditField                matlab.ui.control.NumericEditField
        Phase1EditFieldLabel           matlab.ui.control.Label
        Frequency1EditField            matlab.ui.control.NumericEditField
        Frequency1EditFieldLabel       matlab.ui.control.Label
        Amplitude1EditField            matlab.ui.control.NumericEditField
        Amplitude1EditFieldLabel       matlab.ui.control.Label
        Tree                           matlab.ui.container.Tree
        Node                           matlab.ui.container.TreeNode
        Node2                          matlab.ui.container.TreeNode
        Node3                          matlab.ui.container.TreeNode
        Node4                          matlab.ui.container.TreeNode
        UIAxes2_3                      matlab.ui.control.UIAxes
        SpectrogramTab                 matlab.ui.container.Tab
    end

    properties (Access = private)
        Length % Audio length
        Recorder % Audio
        Fs % Sampling frequency
        Amplitude
        Phase
        Frequency
        WindowLength
        StartingTime
        FileName % Description
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Value changing function: FsSlider
        function FsSliderValueChanging(app, event)
            app.Fs = event.Value;
        end

        % Button pushed function: StartRecordingButton
        function StartRecordingButtonPushed(app, event)
            app.Recorder = audiorecorder(app.Fs,24,1);
            recordblocking(app.Recorder,app.Length);
            x=getaudiodata(app.Recorder,'uint8');
            plot(app.UIAxes,x);
        end

        % Value changed function: AudioLengthsEditField
        function AudioLengthsEditFieldValueChanged(app, event)
            app.Length = app.AudioLengthsEditField.Value;
        end

        % Button pushed function: PlayRecordingButton
        function PlayRecordingButtonPushed(app, event)
            play(app.Recorder)
        end

        % Value changed function: PhasedegreeEditField_2
        function PhasedegreeEditField_2ValueChanged(app, event)
            app.Phase = app.PhasedegreeEditField_2.Value;
        end

        % Value changed function: FrequencyEditField
        function FrequencyEditFieldValueChanged(app, event)
            app.Frequency = app.FrequencyEditField.Value;
            
        end

        % Value changed function: AmplitudeEditField
        function AmplitudeEditFieldValueChanged(app, event)
            app.Amplitude = app.AmplitudeEditField.Value;
            
        end

        % Button pushed function: GenerateButton
        function GenerateButtonPushed(app, event)
            t = 0:(1/100):10;
            phase_rad = app.Phase * pi /180;
            angle=2*pi*app.Frequency*t ;
            x = app.Amplitude * cos(angle+phase_rad);
            plot(app.UIAxes2,t, x,'-kd');
            grid on 
        end

        % Value changed function: PhasedegreeEditField
        function PhasedegreeEditFieldValueChanged(app, event)
            app.Phase = app.PhasedegreeEditField.Value;
        end

        % Button pushed function: RectangularButton
        function RectangularButtonPushed(app, event)
            t = 0:(1/100):10;
            phase_rad = app.Phase * pi /180;
            
            shifted_sine = app.Amplitude * cos(2*pi*app.Frequency*(t-app.StartingTime)+phase_rad);
            win_length_samples = round(app.WindowLength * 100);
            rectangular_window = rectwin(win_length_samples)';
            windowed_signal = shifted_sine(1:win_length_samples) .* rectangular_window;
            
            plot(app.UIAxes2_2,t(1:win_length_samples), windowed_signal);
        end

        % Value changed function: FrequencyEditField_2
        function FrequencyEditField_2ValueChanged(app, event)
            app.Frequency = app.FrequencyEditField_2.Value;
        end

        % Value changed function: AmplitudeEditField_2
        function AmplitudeEditField_2ValueChanged(app, event)
            app.Amplitude = app.AmplitudeEditField_2.Value;
            
        end

        % Value changed function: StartingTimesEditField
        function StartingTimesEditFieldValueChanged(app, event)
            app.StartingTime = app.StartingTimesEditField.Value;
            
        end

        % Value changed function: WindowLengthsEditField
        function WindowLengthsEditFieldValueChanged(app, event)
            app.WindowLength = app.WindowLengthsEditField.Value;
            
        end

        % Value changing function: FSTextArea
        function FSTextAreaValueChanging(app, event)

        end

        % Value changed function: FSTextArea
        function FSTextAreaValueChanged(app, event)
            app.FSTextArea.Value = app.Fs;            
        end

        % Button pushed function: HammingButton
        function HammingButtonPushed(app, event)
            t = 0:(1/100):10;
            phase_rad = app.Phase * pi /180;
            
            shifted_sine = app.Amplitude * cos(2*pi*app.Frequency*(t-app.StartingTime)+phase_rad);
            win_length_samples = round(app.WindowLength * 100);
            hamming_window = hamming(win_length_samples)';
            windowed_signal = shifted_sine(1:win_length_samples) .* hamming_window;
            
            plot(app.UIAxes2_2,t(1:win_length_samples), windowed_signal);

        end

        % Button pushed function: HannButton
        function HannButtonPushed(app, event)
            t = 0:(1/100):10;
            phase_rad = app.Phase * pi /180;
            
            shifted_sine = app.Amplitude * cos(2*pi*app.Frequency*(t-app.StartingTime)+phase_rad);
            win_length_samples = round(app.WindowLength * 100);
            hann_window = hann(win_length_samples)';
            windowed_signal = shifted_sine(1:win_length_samples) .* hann_window;
            
            plot(app.UIAxes2_2,t(1:win_length_samples), windowed_signal);

        end

        % Button pushed function: TriangularButton
        function TriangularButtonPushed(app, event)
            t = 0:(1/100):10;
            phase_rad = app.Phase * pi /180;
            
            shifted_sine = app.Amplitude * cos(2*pi*app.Frequency*(t-app.StartingTime)+phase_rad);
            win_length_samples = round(app.WindowLength * 100);
            triangular_window = triang(win_length_samples)';
            windowed_signal = shifted_sine(1:win_length_samples) .* triangular_window;
            
            plot(app.UIAxes2_2,t(1:win_length_samples), windowed_signal);

        end

        % Value changed function: CompEditField
        function CompEditFieldValueChanged(app, event)
            value = app.CompEditField.Value;
            
            if(value==1)
                app.Amplitude1EditField.Visible = 'on';
                app.Frequency1EditField.Visible = 'on';
                app.Phase1EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'off';
                app.Frequency2EditField.Visible = 'off';
                app.Phase2EditField.Visible = "off"
                app.Amplitude3EditField.Visible = 'off';
                app.Frequency3EditField.Visible = 'off';
                app.Phase3EditField.Visible = "off"
                app.Amplitude4EditField.Visible = 'off';
                app.Frequency4EditField.Visible = 'off';
                app.Phase4EditField.Visible = "off"
           
            elseif(value==2)
                app.Amplitude1EditField.Visible = 'on';
                app.Frequency1EditField.Visible = 'on';
                app.Phase1EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude3EditField.Visible = 'off';
                app.Frequency3EditField.Visible = 'off';
                app.Phase3EditField.Visible = "off"
                app.Amplitude4EditField.Visible = 'off';
                app.Frequency4EditField.Visible = 'off';
                app.Phase4EditField.Visible = "off"
            
            elseif(value==3)
                app.Amplitude1EditField.Visible = 'on';
                app.Frequency1EditField.Visible = 'on';
                app.Phase1EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude3EditField.Visible = 'on';
                app.Frequency3EditField.Visible = 'on';
                app.Phase3EditField.Visible = "on"
                app.Amplitude4EditField.Visible = 'off';
                app.Frequency4EditField.Visible = 'off';
                app.Phase4EditField.Visible = "off"
            
            elseif(value==4)
                app.Amplitude1EditField.Visible = 'on';
                app.Frequency1EditField.Visible = 'on';
                app.Phase1EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude2EditField.Visible = 'on';
                app.Frequency2EditField.Visible = 'on';
                app.Phase2EditField.Visible = "on"
                app.Amplitude3EditField.Visible = 'on';
                app.Frequency3EditField.Visible = 'on';
                app.Phase3EditField.Visible = "on"
                app.Amplitude4EditField.Visible = 'on';
                app.Frequency4EditField.Visible = 'on';
                app.Phase4EditField.Visible = "on"
            end
           

        end

        % Value changed function: PleaseEntertheFileNameEditField
        function PleaseEntertheFileNameEditFieldValueChanged(app, event)
            app.FileName = app.PleaseEntertheFileNameEditField.Value;
        end

        % Button pushed function: ImportButton
        function ImportButtonPushed(app, event)
            [y,app.Fs] = audioread(app.FileName + ".wav");
            sound(y, app.Fs)
            app.FSTextArea.Value = sprintf('%2.f',app.Fs);
            plot(app.UIAxes_2, y);
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 429];
            app.UIFigure.Name = 'MATLAB App';

            % Create TabGroup
            app.TabGroup = uitabgroup(app.UIFigure);
            app.TabGroup.Position = [1 1 640 429];

            % Create DataAcquisitionTab
            app.DataAcquisitionTab = uitab(app.TabGroup);
            app.DataAcquisitionTab.Title = 'Data Acquisition';

            % Create TabGroup2
            app.TabGroup2 = uitabgroup(app.DataAcquisitionTab);
            app.TabGroup2.Position = [1 1 638 404];

            % Create RecordTab
            app.RecordTab = uitab(app.TabGroup2);
            app.RecordTab.Title = 'Record';

            % Create UIAxes
            app.UIAxes = uiaxes(app.RecordTab);
            title(app.UIAxes, 'Recorded Audio Amplitude vs Time Graph')
            xlabel(app.UIAxes, 'Time (s)')
            ylabel(app.UIAxes, 'Amplitude')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.Position = [1 151 636 229];

            % Create FsSliderLabel
            app.FsSliderLabel = uilabel(app.RecordTab);
            app.FsSliderLabel.HorizontalAlignment = 'right';
            app.FsSliderLabel.Position = [12 130 25 22];
            app.FsSliderLabel.Text = 'Fs';

            % Create FsSlider
            app.FsSlider = uislider(app.RecordTab);
            app.FsSlider.Limits = [80 10000];
            app.FsSlider.ValueChangingFcn = createCallbackFcn(app, @FsSliderValueChanging, true);
            app.FsSlider.Position = [58 139 568 3];
            app.FsSlider.Value = 80;

            % Create StartRecordingButton
            app.StartRecordingButton = uibutton(app.RecordTab, 'push');
            app.StartRecordingButton.ButtonPushedFcn = createCallbackFcn(app, @StartRecordingButtonPushed, true);
            app.StartRecordingButton.Position = [36 55 100 23];
            app.StartRecordingButton.Text = 'Start Recording';

            % Create AudioLengthsEditFieldLabel
            app.AudioLengthsEditFieldLabel = uilabel(app.RecordTab);
            app.AudioLengthsEditFieldLabel.HorizontalAlignment = 'right';
            app.AudioLengthsEditFieldLabel.Position = [206 55 93 22];
            app.AudioLengthsEditFieldLabel.Text = 'Audio Length (s)';

            % Create AudioLengthsEditField
            app.AudioLengthsEditField = uieditfield(app.RecordTab, 'numeric');
            app.AudioLengthsEditField.Limits = [1 Inf];
            app.AudioLengthsEditField.ValueChangedFcn = createCallbackFcn(app, @AudioLengthsEditFieldValueChanged, true);
            app.AudioLengthsEditField.Position = [314 55 100 22];
            app.AudioLengthsEditField.Value = 1;

            % Create PlayRecordingButton
            app.PlayRecordingButton = uibutton(app.RecordTab, 'push');
            app.PlayRecordingButton.ButtonPushedFcn = createCallbackFcn(app, @PlayRecordingButtonPushed, true);
            app.PlayRecordingButton.Position = [502 54 100 23];
            app.PlayRecordingButton.Text = 'Play Recording';

            % Create ImportTab
            app.ImportTab = uitab(app.TabGroup2);
            app.ImportTab.Title = 'Import';

            % Create UIAxes_2
            app.UIAxes_2 = uiaxes(app.ImportTab);
            title(app.UIAxes_2, 'Imported Audio Amplitude vs Time Graph ')
            xlabel(app.UIAxes_2, 'Time (s)')
            ylabel(app.UIAxes_2, 'Amplitude ')
            zlabel(app.UIAxes_2, 'Z')
            app.UIAxes_2.Position = [1 151 636 229];

            % Create FSLabel
            app.FSLabel = uilabel(app.ImportTab);
            app.FSLabel.HorizontalAlignment = 'right';
            app.FSLabel.Position = [277 116 27 22];
            app.FSLabel.Text = 'FS: ';

            % Create FSTextArea
            app.FSTextArea = uitextarea(app.ImportTab);
            app.FSTextArea.ValueChangedFcn = createCallbackFcn(app, @FSTextAreaValueChanged, true);
            app.FSTextArea.ValueChangingFcn = createCallbackFcn(app, @FSTextAreaValueChanging, true);
            app.FSTextArea.Position = [319 116 108 24];

            % Create PleaseEntertheFileNameEditFieldLabel
            app.PleaseEntertheFileNameEditFieldLabel = uilabel(app.ImportTab);
            app.PleaseEntertheFileNameEditFieldLabel.HorizontalAlignment = 'right';
            app.PleaseEntertheFileNameEditFieldLabel.Position = [146 55 158 22];
            app.PleaseEntertheFileNameEditFieldLabel.Text = 'Please Enter the File Name: ';

            % Create PleaseEntertheFileNameEditField
            app.PleaseEntertheFileNameEditField = uieditfield(app.ImportTab, 'text');
            app.PleaseEntertheFileNameEditField.ValueChangedFcn = createCallbackFcn(app, @PleaseEntertheFileNameEditFieldValueChanged, true);
            app.PleaseEntertheFileNameEditField.Position = [319 55 108 22];

            % Create ImportButton
            app.ImportButton = uibutton(app.ImportTab, 'push');
            app.ImportButton.ButtonPushedFcn = createCallbackFcn(app, @ImportButtonPushed, true);
            app.ImportButton.Position = [491 54 100 23];
            app.ImportButton.Text = 'Import';

            % Create DataGenerationTab
            app.DataGenerationTab = uitab(app.TabGroup);
            app.DataGenerationTab.Title = 'Data Generation';

            % Create TabGroup3
            app.TabGroup3 = uitabgroup(app.DataGenerationTab);
            app.TabGroup3.Position = [1 0 639 405];

            % Create SinusoidTab
            app.SinusoidTab = uitab(app.TabGroup3);
            app.SinusoidTab.Title = 'Sinusoid';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.SinusoidTab);
            title(app.UIAxes2, 'Cosine Graph')
            xlabel(app.UIAxes2, 'Time (s)')
            ylabel(app.UIAxes2, 'Amplitude')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.Position = [1 108 636 273];

            % Create AmplitudeEditFieldLabel
            app.AmplitudeEditFieldLabel = uilabel(app.SinusoidTab);
            app.AmplitudeEditFieldLabel.HorizontalAlignment = 'right';
            app.AmplitudeEditFieldLabel.Position = [22 35 58 22];
            app.AmplitudeEditFieldLabel.Text = 'Amplitude';

            % Create AmplitudeEditField
            app.AmplitudeEditField = uieditfield(app.SinusoidTab, 'numeric');
            app.AmplitudeEditField.ValueChangedFcn = createCallbackFcn(app, @AmplitudeEditFieldValueChanged, true);
            app.AmplitudeEditField.Position = [95 35 100 22];
            app.AmplitudeEditField.Value = 99999999;

            % Create FrequencyEditFieldLabel
            app.FrequencyEditFieldLabel = uilabel(app.SinusoidTab);
            app.FrequencyEditFieldLabel.HorizontalAlignment = 'right';
            app.FrequencyEditFieldLabel.Position = [230 35 62 22];
            app.FrequencyEditFieldLabel.Text = 'Frequency';

            % Create FrequencyEditField
            app.FrequencyEditField = uieditfield(app.SinusoidTab, 'numeric');
            app.FrequencyEditField.ValueChangedFcn = createCallbackFcn(app, @FrequencyEditFieldValueChanged, true);
            app.FrequencyEditField.Position = [307 35 100 22];
            app.FrequencyEditField.Value = 99999999999;

            % Create PhasedegreeLabel
            app.PhasedegreeLabel = uilabel(app.SinusoidTab);
            app.PhasedegreeLabel.HorizontalAlignment = 'right';
            app.PhasedegreeLabel.Position = [423 35 88 22];
            app.PhasedegreeLabel.Text = 'Phase (degree)';

            % Create PhasedegreeEditField_2
            app.PhasedegreeEditField_2 = uieditfield(app.SinusoidTab, 'numeric');
            app.PhasedegreeEditField_2.ValueChangedFcn = createCallbackFcn(app, @PhasedegreeEditField_2ValueChanged, true);
            app.PhasedegreeEditField_2.Position = [526 35 100 22];
            app.PhasedegreeEditField_2.Value = 9999999999;

            % Create GenerateButton
            app.GenerateButton = uibutton(app.SinusoidTab, 'push');
            app.GenerateButton.ButtonPushedFcn = createCallbackFcn(app, @GenerateButtonPushed, true);
            app.GenerateButton.Position = [526 79 100 23];
            app.GenerateButton.Text = 'Generate';

            % Create PleaseEntertheParametersLabel
            app.PleaseEntertheParametersLabel = uilabel(app.SinusoidTab);
            app.PleaseEntertheParametersLabel.Position = [23 79 162 22];
            app.PleaseEntertheParametersLabel.Text = 'Please Enter the Parameters:';

            % Create WindowedSinusoidTab
            app.WindowedSinusoidTab = uitab(app.TabGroup3);
            app.WindowedSinusoidTab.Title = 'Windowed Sinusoid';

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.WindowedSinusoidTab);
            title(app.UIAxes2_2, 'Windowed Cosine Graph')
            xlabel(app.UIAxes2_2, 'Time (s)')
            ylabel(app.UIAxes2_2, 'Amplitude')
            zlabel(app.UIAxes2_2, 'Z')
            app.UIAxes2_2.Position = [1 108 636 273];

            % Create AmplitudeEditField_2Label
            app.AmplitudeEditField_2Label = uilabel(app.WindowedSinusoidTab);
            app.AmplitudeEditField_2Label.HorizontalAlignment = 'right';
            app.AmplitudeEditField_2Label.Position = [37 79 58 22];
            app.AmplitudeEditField_2Label.Text = 'Amplitude';

            % Create AmplitudeEditField_2
            app.AmplitudeEditField_2 = uieditfield(app.WindowedSinusoidTab, 'numeric');
            app.AmplitudeEditField_2.ValueChangedFcn = createCallbackFcn(app, @AmplitudeEditField_2ValueChanged, true);
            app.AmplitudeEditField_2.Position = [110 79 100 22];
            app.AmplitudeEditField_2.Value = 999999999;

            % Create FrequencyEditField_2Label
            app.FrequencyEditField_2Label = uilabel(app.WindowedSinusoidTab);
            app.FrequencyEditField_2Label.HorizontalAlignment = 'right';
            app.FrequencyEditField_2Label.Position = [450 46 62 22];
            app.FrequencyEditField_2Label.Text = 'Frequency';

            % Create FrequencyEditField_2
            app.FrequencyEditField_2 = uieditfield(app.WindowedSinusoidTab, 'numeric');
            app.FrequencyEditField_2.ValueChangedFcn = createCallbackFcn(app, @FrequencyEditField_2ValueChanged, true);
            app.FrequencyEditField_2.Position = [527 46 100 22];
            app.FrequencyEditField_2.Value = 99999999;

            % Create PhasedegreeEditFieldLabel
            app.PhasedegreeEditFieldLabel = uilabel(app.WindowedSinusoidTab);
            app.PhasedegreeEditFieldLabel.HorizontalAlignment = 'right';
            app.PhasedegreeEditFieldLabel.Position = [210 79 88 22];
            app.PhasedegreeEditFieldLabel.Text = 'Phase (degree)';

            % Create PhasedegreeEditField
            app.PhasedegreeEditField = uieditfield(app.WindowedSinusoidTab, 'numeric');
            app.PhasedegreeEditField.ValueChangedFcn = createCallbackFcn(app, @PhasedegreeEditFieldValueChanged, true);
            app.PhasedegreeEditField.Position = [313 79 100 22];
            app.PhasedegreeEditField.Value = 99999999;

            % Create StartingTimesEditFieldLabel
            app.StartingTimesEditFieldLabel = uilabel(app.WindowedSinusoidTab);
            app.StartingTimesEditFieldLabel.HorizontalAlignment = 'right';
            app.StartingTimesEditFieldLabel.Position = [419 79 93 22];
            app.StartingTimesEditFieldLabel.Text = 'Starting Time (s)';

            % Create StartingTimesEditField
            app.StartingTimesEditField = uieditfield(app.WindowedSinusoidTab, 'numeric');
            app.StartingTimesEditField.ValueChangedFcn = createCallbackFcn(app, @StartingTimesEditFieldValueChanged, true);
            app.StartingTimesEditField.Position = [527 79 100 22];
            app.StartingTimesEditField.Value = 999999999;

            % Create WindowLengthsEditFieldLabel
            app.WindowLengthsEditFieldLabel = uilabel(app.WindowedSinusoidTab);
            app.WindowLengthsEditFieldLabel.HorizontalAlignment = 'right';
            app.WindowLengthsEditFieldLabel.Position = [195 46 105 22];
            app.WindowLengthsEditFieldLabel.Text = 'Window Length (s)';

            % Create WindowLengthsEditField
            app.WindowLengthsEditField = uieditfield(app.WindowedSinusoidTab, 'numeric');
            app.WindowLengthsEditField.ValueChangedFcn = createCallbackFcn(app, @WindowLengthsEditFieldValueChanged, true);
            app.WindowLengthsEditField.Position = [315 46 100 22];
            app.WindowLengthsEditField.Value = 999999999;

            % Create TriangularButton
            app.TriangularButton = uibutton(app.WindowedSinusoidTab, 'push');
            app.TriangularButton.ButtonPushedFcn = createCallbackFcn(app, @TriangularButtonPushed, true);
            app.TriangularButton.Position = [527 14 100 23];
            app.TriangularButton.Text = 'Triangular';

            % Create RectangularButton
            app.RectangularButton = uibutton(app.WindowedSinusoidTab, 'push');
            app.RectangularButton.ButtonPushedFcn = createCallbackFcn(app, @RectangularButtonPushed, true);
            app.RectangularButton.Position = [38 14 100 23];
            app.RectangularButton.Text = 'Rectangular';

            % Create HannButton
            app.HannButton = uibutton(app.WindowedSinusoidTab, 'push');
            app.HannButton.ButtonPushedFcn = createCallbackFcn(app, @HannButtonPushed, true);
            app.HannButton.Position = [369 14 100 23];
            app.HannButton.Text = 'Hann';

            % Create HammingButton
            app.HammingButton = uibutton(app.WindowedSinusoidTab, 'push');
            app.HammingButton.ButtonPushedFcn = createCallbackFcn(app, @HammingButtonPushed, true);
            app.HammingButton.Position = [207 14 100 23];
            app.HammingButton.Text = 'Hamming';

            % Create MultipleCosineTab
            app.MultipleCosineTab = uitab(app.TabGroup3);
            app.MultipleCosineTab.Title = 'Multiple Cosine';

            % Create UIAxes2_3
            app.UIAxes2_3 = uiaxes(app.MultipleCosineTab);
            title(app.UIAxes2_3, 'Multiple Cosine Graph ')
            xlabel(app.UIAxes2_3, 'Time (s)')
            ylabel(app.UIAxes2_3, 'Amplitude')
            zlabel(app.UIAxes2_3, 'Z')
            app.UIAxes2_3.Position = [3 108 636 273];

            % Create Tree
            app.Tree = uitree(app.MultipleCosineTab);
            app.Tree.Position = [1 341 2 2];

            % Create Node
            app.Node = uitreenode(app.Tree);
            app.Node.Text = 'Node';

            % Create Node2
            app.Node2 = uitreenode(app.Node);
            app.Node2.Text = 'Node2';

            % Create Node3
            app.Node3 = uitreenode(app.Node);
            app.Node3.Text = 'Node3';

            % Create Node4
            app.Node4 = uitreenode(app.Node);
            app.Node4.Text = 'Node4';

            % Create Amplitude1EditFieldLabel
            app.Amplitude1EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Amplitude1EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude1EditFieldLabel.Position = [177 88 65 22];
            app.Amplitude1EditFieldLabel.Text = 'Amplitude1';

            % Create Amplitude1EditField
            app.Amplitude1EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Amplitude1EditField.Visible = 'off';
            app.Amplitude1EditField.Position = [257 88 21 22];

            % Create Frequency1EditFieldLabel
            app.Frequency1EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Frequency1EditFieldLabel.HorizontalAlignment = 'right';
            app.Frequency1EditFieldLabel.Position = [178 56 68 22];
            app.Frequency1EditFieldLabel.Text = 'Frequency1';

            % Create Frequency1EditField
            app.Frequency1EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Frequency1EditField.Visible = 'off';
            app.Frequency1EditField.Position = [261 56 17 22];

            % Create Phase1EditFieldLabel
            app.Phase1EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Phase1EditFieldLabel.HorizontalAlignment = 'right';
            app.Phase1EditFieldLabel.Position = [177 24 46 22];
            app.Phase1EditFieldLabel.Text = 'Phase1';

            % Create Phase1EditField
            app.Phase1EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Phase1EditField.Visible = 'off';
            app.Phase1EditField.Position = [238 24 40 22];
            app.Phase1EditField.Value = 9999999999;

            % Create Amplitude2EditFieldLabel
            app.Amplitude2EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Amplitude2EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude2EditFieldLabel.Position = [292 87 65 22];
            app.Amplitude2EditFieldLabel.Text = 'Amplitude2';

            % Create Amplitude2EditField
            app.Amplitude2EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Amplitude2EditField.Visible = 'off';
            app.Amplitude2EditField.Position = [372 87 21 22];

            % Create Frequency2EditFieldLabel
            app.Frequency2EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Frequency2EditFieldLabel.HorizontalAlignment = 'right';
            app.Frequency2EditFieldLabel.Position = [293 55 68 22];
            app.Frequency2EditFieldLabel.Text = 'Frequency2';

            % Create Frequency2EditField
            app.Frequency2EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Frequency2EditField.Visible = 'off';
            app.Frequency2EditField.Position = [376 55 17 22];

            % Create Phase2EditFieldLabel
            app.Phase2EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Phase2EditFieldLabel.HorizontalAlignment = 'right';
            app.Phase2EditFieldLabel.Position = [292 23 46 22];
            app.Phase2EditFieldLabel.Text = 'Phase2';

            % Create Phase2EditField
            app.Phase2EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Phase2EditField.Visible = 'off';
            app.Phase2EditField.Position = [353 23 40 22];
            app.Phase2EditField.Value = 9999999999;

            % Create Amplitude3EditFieldLabel
            app.Amplitude3EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Amplitude3EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude3EditFieldLabel.Position = [411 87 65 22];
            app.Amplitude3EditFieldLabel.Text = 'Amplitude3';

            % Create Amplitude3EditField
            app.Amplitude3EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Amplitude3EditField.Visible = 'off';
            app.Amplitude3EditField.Position = [491 87 21 22];

            % Create Frequency3EditFieldLabel
            app.Frequency3EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Frequency3EditFieldLabel.HorizontalAlignment = 'right';
            app.Frequency3EditFieldLabel.Position = [412 55 68 22];
            app.Frequency3EditFieldLabel.Text = 'Frequency3';

            % Create Frequency3EditField
            app.Frequency3EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Frequency3EditField.Visible = 'off';
            app.Frequency3EditField.Position = [495 55 17 22];

            % Create Phase3EditFieldLabel
            app.Phase3EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Phase3EditFieldLabel.HorizontalAlignment = 'right';
            app.Phase3EditFieldLabel.Position = [411 23 46 22];
            app.Phase3EditFieldLabel.Text = 'Phase3';

            % Create Phase3EditField
            app.Phase3EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Phase3EditField.Visible = 'off';
            app.Phase3EditField.Position = [472 23 40 22];
            app.Phase3EditField.Value = 9999999999;

            % Create Amplitude4EditFieldLabel
            app.Amplitude4EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Amplitude4EditFieldLabel.HorizontalAlignment = 'right';
            app.Amplitude4EditFieldLabel.Position = [522 88 65 22];
            app.Amplitude4EditFieldLabel.Text = 'Amplitude4';

            % Create Amplitude4EditField
            app.Amplitude4EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Amplitude4EditField.Visible = 'off';
            app.Amplitude4EditField.Position = [602 88 21 22];

            % Create Frequency4EditFieldLabel
            app.Frequency4EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Frequency4EditFieldLabel.HorizontalAlignment = 'right';
            app.Frequency4EditFieldLabel.Position = [523 56 68 22];
            app.Frequency4EditFieldLabel.Text = 'Frequency4';

            % Create Frequency4EditField
            app.Frequency4EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Frequency4EditField.Visible = 'off';
            app.Frequency4EditField.Position = [606 56 17 22];

            % Create Phase4EditFieldLabel
            app.Phase4EditFieldLabel = uilabel(app.MultipleCosineTab);
            app.Phase4EditFieldLabel.HorizontalAlignment = 'right';
            app.Phase4EditFieldLabel.Position = [522 24 46 22];
            app.Phase4EditFieldLabel.Text = 'Phase4';

            % Create Phase4EditField
            app.Phase4EditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.Phase4EditField.Visible = 'off';
            app.Phase4EditField.Position = [583 24 40 22];
            app.Phase4EditField.Value = 9999999999;

            % Create CompEditFieldLabel
            app.CompEditFieldLabel = uilabel(app.MultipleCosineTab);
            app.CompEditFieldLabel.HorizontalAlignment = 'right';
            app.CompEditFieldLabel.Position = [27 76 37 22];
            app.CompEditFieldLabel.Text = 'Comp';

            % Create CompEditField
            app.CompEditField = uieditfield(app.MultipleCosineTab, 'numeric');
            app.CompEditField.ValueChangedFcn = createCallbackFcn(app, @CompEditFieldValueChanged, true);
            app.CompEditField.Position = [79 76 68 22];

            % Create SpectrogramTab
            app.SpectrogramTab = uitab(app.TabGroup);
            app.SpectrogramTab.Title = 'Spectrogram';

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = appsevval_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

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