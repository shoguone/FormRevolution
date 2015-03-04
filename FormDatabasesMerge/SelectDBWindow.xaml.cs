using FormRevolution.EntityDataModel.GeneralDatabaseModel;
using FormRevolution.EntityDataModel.SingleDatabaseModel;
using FormRevolution.Utility;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Threading;

namespace FormRevolution
{
    /// <summary>
    /// Interaction logic for SelectDBWindow.xaml
    /// </summary>
    public partial class SelectDBWindow : Window
    {
        //private string dbExtension = Properties.Settings.Default.DBExtension;
        //private string driveLetter = Properties.Settings.Default.InternalDriveLetter;
        //private string serverAddress = Properties.Settings.Default.ExternalServerAddress;

        private int commitBufferSize = Properties.Settings.Default.CommitBufferSize;
        private int progressBarUpdateRate = Properties.Settings.Default.ProgressBarUpdateRate;

        private string defaultYear = Properties.Settings.Default.DefaultYear;
        private string defaultNumber = Properties.Settings.Default.DefaultNumber;

        private DatabaseFilePath generalDBFile;
        private List<DatabaseFilePath> newDBFiles;

        private DatabaseFilePath selectedFile;

        private SolidColorBrush _brush;
        private SolidColorBrush brush
        {
            get
            {
                if (_brush == null)
                    _brush = ProgressBar.Foreground as SolidColorBrush;
                return _brush;
            }
        }

        private string year;
        private string number;

        private int current;

        public delegate void DoubleParameterDelegate(double d);
        private Thread heavyWeightThread;
        private bool isProcessRunning = false;

        private IEqualityComparer<FormRevolution.EntityDataModel.GeneralDatabaseModel.PRIZ>
            seasonComparer = new PrizGeneralSeasonComparer();

        private List<Season> seasons;

        private BindingExpression seasonsBindingExpression;




        public SelectDBWindow()
        {
            try
            {
                InitializeComponent();

                Init();
            }
            catch (Exception ex)
            {
                MessageBox.Show(String.Format("{0}\n{1}", ex.Message, ex.StackTrace));
            }
        }

        private void Init()
        {
            string generalDBConnectionString = ConfigurationManager
                .ConnectionStrings["EntityContextGeneral"]
                .ConnectionString;

            string dbPair;
            string dbPath;
            try
            {
                dbPair = Regex.Match(generalDBConnectionString, @"(?:database=).+?(?=;)").Value;
                dbPath = dbPair.Split('=')[1];
            }
            catch (Exception ex)
            {
                MessageBox.Show(String.Format(
                    "В строке подключения не найден путь к базе данных ('database=DatabaseAddressHere')\nТекст ошибки:\n{0}", 
                    ex.Message));
                return;
            }

            generalDBFile = new DatabaseFilePath(dbPath);
            GeneralDBTextBox.Text = generalDBFile.FileName;

            var fs = Directory.GetFiles(generalDBFile.ExternalDirectory);
            newDBFiles = fs
                .Reverse()
                .Select(f => new DatabaseFilePath(f))
                .ToList();

            string curYear = newDBFiles[0].Year;
            int fCnt = newDBFiles.Count();
            for (int i = 0; i < fCnt; i++)
            {
                if (newDBFiles[i].Year != curYear)
                {
                    var separator = new DatabaseFilePath() { Path = "-" };
                    newDBFiles.Insert(i, separator);

                    i++;
                    curYear = newDBFiles[i].Year;
                    fCnt++;
                }
            }

            SelectDBComboBox.ItemsSource = newDBFiles;

            var defaultSeason = newDBFiles.First(f => f.Year.Equals(defaultYear) && f.Number.Equals(defaultNumber));
            if (defaultSeason != null)
                SelectDBComboBox.SelectedItem = defaultSeason;

            FillExistingSeasons();

        }

        //private void FindDuplicates()
        //{

        //}

        private void FillExistingSeasons()
        {
            using (EntityContextGeneral ctxg = new EntityContextGeneral())
            {
                seasons = ctxg.PRIZ
                    .AsEnumerable()
                    //.ToList()
                    .Distinct(seasonComparer)
                    .Select(p => new Season(p))
                    .OrderByDescending(p => p.DateTime)
                    .ToList();

                Binding myBinding = new Binding() { Source = seasons };

                SeasonsListView.SetBinding(ListView.ItemsSourceProperty, myBinding);
                seasonsBindingExpression = SeasonsListView.GetBindingExpression(ListView.ItemsSourceProperty);
            }
        }

        private void MergeButton_Click(object sender, RoutedEventArgs e)
        {
            if (!Equals(ProgressBar.Foreground, brush))
            {
                ProgressBar.Value = 0;
                ProgressBar.Foreground = brush;
            }

            if (selectedFile == null)
            {
                MessageBox.Show("Выберите призывной сезон для копирования");
                return;
            }

            year = YearTextBox.Text;
            number = NumberTextBox.Text;

            if (isProcessRunning)
            {
                MessageBox.Show("Процесс добавления уже запущен");
                return;
            }

            try
            {
                heavyWeightThread = new Thread(new ThreadStart(MergeAsynchronous));
                heavyWeightThread.Start();
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("{0}\n\n{1}",
                    ex.Message, ex.StackTrace));
            }

        }

        private void UpdateProgress(double d)
        {
            ProgressBar.Value = d;
        }

        private void CompleteProgress()
        {
            ProgressBar.Value = 100;
            isProcessRunning = false;

            ColorAnimation ca = new ColorAnimation()
            {
                From = brush.Color, 
                /*ca.To = Brushes.Wheat.Color;*/
                To = Brushes.Lavender.Color, 
                Duration = new Duration(TimeSpan.FromSeconds(1))
            };
            ProgressBar.Foreground = new SolidColorBrush();
            ProgressBar.Foreground.BeginAnimation(SolidColorBrush.ColorProperty, ca);

            //ToolTip tooltip = new ToolTip { 
            //    Content = string.Format("Добавлено {0} записей", current),
            //    FontSize = 20,
            //    StaysOpen = false,
            //    IsOpen = true
            //};
            //tooltip.StaysOpen = false;
            //tooltip.FontSize = 20;
            //tooltip.IsOpen = true;

            //heavyWeightThread.Abort();
        }

        private void UpdateSeasonsSource()
        {
            SeasonsListView.ItemsSource = null;
            //SeasonsListView.ItemsSource = seasons;

            Binding myBinding = new Binding()
            {
                Source = seasons
            };

            SeasonsListView.SetBinding(ListView.ItemsSourceProperty, myBinding);
            seasonsBindingExpression = SeasonsListView.GetBindingExpression(ListView.ItemsSourceProperty);
            
            seasonsBindingExpression.UpdateTarget();

        }

        /// <summary>
        /// Without try/catches
        /// </summary>
        private void MergeUnsafely()
        {
            isProcessRunning = true;

            string singleDBConnectionString = ConfigurationManager
                .ConnectionStrings["EntityContextSingle"]
                .ConnectionString;

            string oldPair = Regex.Match(singleDBConnectionString, @"(?:database=).+?(?=;)").Value;
            string connectionStringSelected = singleDBConnectionString.Replace(oldPair, "database=" + selectedFile.InternalPath);

            using (EntityContextSingle ctxs = new EntityContextSingle(connectionStringSelected))
            {
                using (EntityContextGeneral ctxg = new EntityContextGeneral())
                {
                    int countPriz = ctxs.PRIZ.Count();
                    int countKom = ctxs.kom.Count();
                    if (countPriz == 0 && countKom == 0)
                    {
                        MessageBox.Show("Отсутствуют записи в таблицах призывников и команд данного сезона");
                        ctxg.Dispose();
                        ctxs.Dispose();
                        return;
                    }


                    var komGeneralToDelete = ctxg.kom
                        .Where(p => p.SeasonYear.Equals(year) &&
                            p.SeasonNumber.Equals(number))
                        .ToList();
                    int deleteCount = komGeneralToDelete.Count();
                    for (int i = 0; i < deleteCount; i++)
                    {
                        ctxg.DeleteObject(komGeneralToDelete[i]);

                        if (i % progressBarUpdateRate == 0)
                        {
                            ProgressBar.Dispatcher.BeginInvoke(
                                new DoubleParameterDelegate(UpdateProgress),
                                (double)(50 + 50 * (deleteCount - i) / deleteCount));
                        }
                        if (commitBufferSize != 0 && i % commitBufferSize == 0)
                        {
                            ctxg.SaveChanges();
                        }
                    }
                    ctxg.SaveChanges();

                    var prizGeneralToDelete = ctxg.PRIZ
                        .Where(p => p.SeasonYear.Equals(year) &&
                            p.SeasonNumber.Equals(number))
                        .ToList();
                    deleteCount = prizGeneralToDelete.Count();
                    for (int i = 0; i < deleteCount; i++)
                    {
                        ctxg.DeleteObject(prizGeneralToDelete[i]);

                        if (i % progressBarUpdateRate == 0)
                        {
                            ProgressBar.Dispatcher.BeginInvoke(
                                new DoubleParameterDelegate(UpdateProgress),
                                (double)(50 * (deleteCount - i) / deleteCount));
                        }
                        if (commitBufferSize != 0 && i % commitBufferSize == 0)
                        {
                            ctxg.SaveChanges();
                        }
                    }
                    ctxg.SaveChanges();

                    DateTime date = DateTime.Now.Date;
                    TimeSpan time = DateTime.Now.TimeOfDay;

                    //if (deleteCount == 0)
                    //{
                    //    Season seasonToAdd = new Season(
                    //        year, number, date.Add(time));
                    //    seasons.Add(seasonToAdd);
                    //}
                    if (seasons.Any(s => s.Year.Equals(year) && s.Number.Equals(number)))
                    {
                        Season seasonOld = seasons.First(s => s.Year.Equals(year) && s.Number.Equals(number));
                        seasonOld.DateTime = date.Add(time);
                    }
                    seasons = seasons
                        .OrderByDescending(s => s.DateTime)
                        .ToList();
                    SeasonsListView.Dispatcher.BeginInvoke(
                        new Action(UpdateSeasonsSource));


                    int id = 0;
                    if (ctxg.kom.Count() > 0)
                        id = ctxg.kom.Max(p => p.ID);
                    IEnumerable<FormRevolution.EntityDataModel.SingleDatabaseModel.kom> komEntities =
                        ctxs.kom.OrderBy(p => p.ID).AsEnumerable();
                    current = 0;
                    foreach (var kom in komEntities)
                    {
                        current++;

                        var komGeneral = DataConverter.FromSinglekom(
                            kom, id + current, year, number, date, time);
                        ctxg.AddTokom(komGeneral);

                        if (current % progressBarUpdateRate == 0)
                        {
                            ProgressBar.Dispatcher.BeginInvoke(
                                new DoubleParameterDelegate(UpdateProgress),
                                (double)(50 * current / countKom));
                        }
                        if (commitBufferSize != 0 && current % commitBufferSize == 0)
                        {
                            ctxg.SaveChanges();
                        }

                    }

                    //ctxg.SaveChanges(false);
                    //ctxg.AcceptAllChanges();
                    ctxg.SaveChanges();


                    id = 0;
                    if (ctxg.PRIZ.Count() > 0)
                        id = ctxg.PRIZ.Max(p => p.ID);
                    IEnumerable<FormRevolution.EntityDataModel.SingleDatabaseModel.PRIZ> prizEntities =
                        ctxs.PRIZ.OrderBy(p => p.ID).AsEnumerable();
                    current = 0;
                    foreach (var priz in prizEntities)
                    {
                        current++;

                        var kom = ctxg.kom.First(k => 
                            k.N_KOM == priz.N_KOM && 
                            k.SeasonYear.Equals(year) && 
                            k.SeasonNumber.Equals(number));
                        var prizGeneral = DataConverter.FromSinglePRIZ(
                            priz, id + current, kom.ID, year, number, date, time);
                        ctxg.AddToPRIZ(prizGeneral);

                        if (current % progressBarUpdateRate == 0)
                        {
                            ProgressBar.Dispatcher.BeginInvoke(
                                new DoubleParameterDelegate(UpdateProgress),
                                (double)(50 + 50 * current / countPriz));
                        }
                        if (commitBufferSize != 0 && current % commitBufferSize == 0)
                        {
                            ctxg.SaveChanges();
                        }

                    }

                    //ctxg.SaveChanges(false);
                    //ctxg.AcceptAllChanges();
                    ctxg.SaveChanges();


                    ProgressBar.Dispatcher.BeginInvoke(new Action(CompleteProgress));
                }
            }
        }

        private void MergeAsynchronous()
        {
            try
            {
                MergeUnsafely();
            }
            catch (Exception ex)
            {
                MessageBox.Show(string.Format("{0}\n\n{1}",
                    ex.Message, ex.StackTrace));
            }
        }

        private void SelectDBComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            selectedFile = SelectDBComboBox.SelectedItem as DatabaseFilePath;

            if (SelectDBComboBox.SelectedIndex < 0)
                return;

            var dbFilePath = (SelectDBComboBox.SelectedItem as DatabaseFilePath);
            YearTextBox.Text = dbFilePath.Year;
            NumberTextBox.Text = dbFilePath.Number;

            //ParseSummonNumbers();
        }

        //private void ParseSummonNumbers()
        //{
        //    if (SelectDBComboBox.SelectedIndex < 0)
        //        return;

        //    var numbers = (SelectDBComboBox.SelectedItem as DatabaseFilePath).FileName.Split('-');
        //    YearTextBox.Text = Regex.Match(Regex.Escape(numbers[0]), @"\d+").Value;
        //    NumberTextBox.Text = numbers[1];
        //}

    }
}
