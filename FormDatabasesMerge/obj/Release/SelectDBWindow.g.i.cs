﻿#pragma checksum "..\..\SelectDBWindow.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "D2CF8C40F985548C08EA090FA1AFD7FE"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.17929
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;


namespace FormDatabasesMerge {
    
    
    /// <summary>
    /// SelectDBWindow
    /// </summary>
    public partial class SelectDBWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 47 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox GeneralDBTextBox;
        
        #line default
        #line hidden
        
        
        #line 50 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView SeasonsListView;
        
        #line default
        #line hidden
        
        
        #line 57 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SelectDBComboBox;
        
        #line default
        #line hidden
        
        
        #line 78 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button MergeButton;
        
        #line default
        #line hidden
        
        
        #line 86 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.GroupBox SummonGroupBox;
        
        #line default
        #line hidden
        
        
        #line 91 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox YearTextBox;
        
        #line default
        #line hidden
        
        
        #line 93 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox NumberTextBox;
        
        #line default
        #line hidden
        
        
        #line 99 "..\..\SelectDBWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ProgressBar ProgressBar;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/FormDatabasesMerge;component/selectdbwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\SelectDBWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.GeneralDBTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.SeasonsListView = ((System.Windows.Controls.ListView)(target));
            return;
            case 3:
            this.SelectDBComboBox = ((System.Windows.Controls.ComboBox)(target));
            
            #line 59 "..\..\SelectDBWindow.xaml"
            this.SelectDBComboBox.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SelectDBComboBox_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.MergeButton = ((System.Windows.Controls.Button)(target));
            
            #line 80 "..\..\SelectDBWindow.xaml"
            this.MergeButton.Click += new System.Windows.RoutedEventHandler(this.MergeButton_Click);
            
            #line default
            #line hidden
            return;
            case 5:
            this.SummonGroupBox = ((System.Windows.Controls.GroupBox)(target));
            return;
            case 6:
            this.YearTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 7:
            this.NumberTextBox = ((System.Windows.Controls.TextBox)(target));
            return;
            case 8:
            this.ProgressBar = ((System.Windows.Controls.ProgressBar)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

