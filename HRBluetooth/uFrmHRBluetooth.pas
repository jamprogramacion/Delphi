unit uFrmHRBluetooth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, IPPeerClient,
  IPPeerServer, System.Tether.Manager, System.Bluetooth,
  System.Bluetooth.Components, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo;

type
  TfrmHRBluetooth = class(TForm)
    ActionList1: TActionList;
    actTabPrev: TPreviousTabAction;
    TitleAction: TControlAction;
    actTabNext: TNextTabAction;
    TopToolBar: TToolBar;
    btnBack: TSpeedButton;
    lblToolBar: TLabel;
    tabcMain: TTabControl;
    tabDevices: TTabItem;
    tabChannels: TTabItem;
    BottomToolBar: TToolBar;
    pnDevices: TPanel;
    pnDetails: TPanel;
    btnScan: TButton;
    lbDevices: TListView;
    actScanHRDevices: TControlAction;
    lbDeviceDetails: TListView;
    btDevices: TBluetoothLE;
    pnService: TPanel;
    btnReadData: TButton;
    lbCharacteristics: TListView;
    pnData: TPanel;
    txtData: TMemo;
    actReadData: TAction;
    procedure FormCreate(Sender: TObject);
    procedure TitleActionUpdate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure actScanHRDevicesExecute(Sender: TObject);
    procedure lbDevicesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btDevicesEndDiscoverDevices(const Sender: TObject;
      const ADeviceList: TBluetoothLEDeviceList);
    procedure btDevicesServicesDiscovered(const Sender: TObject;
      const AServiceList: TBluetoothGattServiceList);
    procedure lbCharacteristicsChange(Sender: TObject);
    procedure actReadDataExecute(Sender: TObject);
    procedure btDevicesCharacteristicRead(const Sender: TObject;
      const ACharacteristic: TBluetoothGattCharacteristic;
      AGattStatus: TBluetoothGattStatus);
    procedure lbDeviceDetailsItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure tabcMainChange(Sender: TObject);
  private
    lstDeviceServiceList: TBluetoothGattServiceList;
    lstServiceCharList: TBluetoothGattCharacteristicList;
    lstServiceCharNotify: TBluetoothGattCharacteristicList;

    procedure UpdateDeviceDetails();
    procedure UpdateServiceCharacteristics();
    procedure AddServiceCharNotification(const AServiceChar: TBluetoothGattCharacteristic);
    procedure ReleaseServiceCharNotifications();
    function SelectedDevice(): TBluetoothLEDevice;
    function ReadCharacteristicValue(const ACharacteristic: TBluetoothGattCharacteristic): String;
    function BytesValuesAsStr(Value: TBytes): String;
  public
    { Public declarations }
  end;

var
  frmHRBluetooth: TfrmHRBluetooth;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

uses
  System.TypInfo;

const
  HRService: TBluetoothUUID = '{0000180D-0000-1000-8000-00805F9B34FB}';

procedure TfrmHRBluetooth.TitleActionUpdate(Sender: TObject);
begin
  if Sender is TCustomAction then
  begin
    if tabcMain.ActiveTab <> nil then
      TCustomAction(Sender).Text := tabcMain.ActiveTab.Text
    else
      TCustomAction(Sender).Text := '';
  end;
end;

procedure TfrmHRBluetooth.UpdateDeviceDetails;

var
  devHR: TBluetoothLEDevice;

begin
  lbDeviceDetails.Items.Clear;
  lstDeviceServiceList.Clear;
  ReleaseServiceCharNotifications();
  lstServiceCharList.Clear;

  devHR := SelectedDevice;
  if devHR.DeviceName <> '' then
  begin
    lbDeviceDetails.Items.Add.Text := 'Name: ' + devHR.DeviceName;
  end
  else
  begin
    lbDeviceDetails.Items.Add.Text := 'Name: Unnamed device';
  end;
  lbDeviceDetails.Items.Add.Text := 'Address: ' + devHR.Address;
  lbDeviceDetails.Items.Add.Text := 'RSSI: ' + IntToStr(devHR.LastRSSI);

  TThread.CreateAnonymousThread(
    procedure
    begin
      if not devHR.DiscoverServices then
      begin
        ShowMessage('Cannot discover BT device [' + devHR.deviceName + '] services');
      end;
    end).Start;
end;

procedure TfrmHRBluetooth.UpdateServiceCharacteristics;
begin
  lbCharacteristics.Items.Clear;
  lbCharacteristics.ItemIndex := -1;
  ReleaseServiceCharNotifications();
  lstServiceCharList.Clear;
  TThread.CreateAnonymousThread(
    procedure

    var
      devServiceChar: TBluetoothGattCharacteristic;

    begin
      for devServiceChar in lstDeviceServiceList[lbDeviceDetails.ItemIndex - 3].Characteristics do
      begin
        if devServiceChar.UUIDName <> '' then
        begin
          lbCharacteristics.Items.Add.Text := devServiceChar.UUIDName + ' (' + devServiceChar.UUID.ToString + ')';
        end
        else
        begin
          lbCharacteristics.Items.Add.Text := '(' + devServiceChar.UUID.ToString + ')';
        end;
        lstServiceCharList.Add(devServiceChar);
      end;
    end).Start;
end;

procedure TfrmHRBluetooth.actReadDataExecute(Sender: TObject);

var
  devServiceChar: TBluetoothGattCharacteristic;

begin
  txtData.Lines.Clear;
  devServiceChar := lstServiceCharList[lbCharacteristics.ItemIndex];
  if TBluetoothProperty.Read in devServiceChar.Properties then
  begin
    SelectedDevice.ReadCharacteristic(devServiceChar);
  end;
  if TBluetoothProperty.Notify in devServiceChar.Properties then
  begin
    if SelectedDevice.SetCharacteristicNotification(devServiceChar, True) then
    begin
      AddServiceCharNotification(devServiceChar);
    end
    else
    begin
      txtData.Lines.Add('Error connecting to [' + devServiceChar.UUIDName + ']...');
    end;
  end;
end;

procedure TfrmHRBluetooth.actScanHRDevicesExecute(Sender: TObject);

var
  AdvertisedDataFilter: TBluetoothLEScanFilter;
  lstAdvertisedDataFilter: TBluetoothLEScanFilterList;

begin
  lbDevices.Items.Clear;
  lbDevices.ItemIndex := -1;
  lbDeviceDetails.Items.Clear;
  lbDeviceDetails.ItemIndex := -1;
  lstServiceCharList.Clear;
  if not btDevices.Enabled then
  begin
    btDevices.Enabled := True;
  end;

  AdvertisedDataFilter := TBluetoothLEScanFilter.Create;
  AdvertisedDataFilter.ServiceUUID := HRService;
  lstAdvertisedDataFilter := TBluetoothLEScanFilterList.Create([AdvertisedDataFilter]);
  if not btDevices.CurrentManager.StartDiscovery(5000, lstAdvertisedDataFilter) then
  begin
    ShowMessage('Cannot start BT device scanning');
  end;
end;

procedure TfrmHRBluetooth.AddServiceCharNotification(
  const AServiceChar: TBluetoothGattCharacteristic);
begin
  if lstServiceCharNotify.IndexOf(AServiceChar) <> -1 then
  begin
    Exit;
  end;

  lstServiceCharNotify.Add(AServiceChar);
end;

procedure TfrmHRBluetooth.btDevicesCharacteristicRead(const Sender: TObject;
  const ACharacteristic: TBluetoothGattCharacteristic;
  AGattStatus: TBluetoothGattStatus);

var
  devCharDesc: TBluetoothGattDescriptor;
  sValue: String;

begin
  if AGattStatus <> TBluetoothGattStatus.Success then
  begin
    txtData.Lines.Add('Error reading [' + ACharacteristic.UUIDName + ']');
    Exit;
  end;

  sValue := ReadCharacteristicValue(ACharacteristic);
  if sValue <> '' then
  begin
    txtData.Lines.Add(sValue);
    Exit;
  end;

  for devCharDesc in ACharacteristic.Descriptors do
  begin
    if devCharDesc.Kind = TBluetoothDescriptorKind.PresentationFormat then
    begin
      txtData.Lines.Add('Exponent: ' + IntToStr(devCharDesc.Exponent));
      txtData.Lines.Add('Format: ' + GetEnumName(TypeInfo(TBluetoothGattFormatType), Ord(devCharDesc.Format)));
      txtData.Lines.Add('Unit: ' + devCharDesc.GetKnownUnitName(devCharDesc.FormatUnit));
    end
    else if devCharDesc.Kind = TBluetoothDescriptorKind.ClientConfiguration then
    begin
      txtData.Lines.Add(BytesValuesAsStr(ACharacteristic.Value));
      Exit;
    end;
  end;

  if ACharacteristic.Descriptors.Count = 0 then
  begin
    try
      txtData.Lines.Add(ACharacteristic.GetValueAsString);
    except
    end;
  end;
end;

procedure TfrmHRBluetooth.btDevicesEndDiscoverDevices(const Sender: TObject;
  const ADeviceList: TBluetoothLEDeviceList);

var
  devHR: TBluetoothLEDevice;
  oItem: TListViewItem;

begin
  for devHR in ADeviceList do
  begin
    if devHR.DeviceName <> '' then
    begin
      oItem := lbDevices.Items.Add;
      oItem.Text := 'Name: ' + devHR.DeviceName;
    end
    else
    begin
      oItem := lbDevices.Items.Add;
      oItem.Text := 'Name: Unnamed device';
    end;
    oItem.Detail := 'RSSI: ' + IntToStr(devHR.LastRSSI);
  end;
end;

procedure TfrmHRBluetooth.btDevicesServicesDiscovered(const Sender: TObject;
  const AServiceList: TBluetoothGattServiceList);

var
  devService: TBluetoothGattService;

begin
  for devService in AServiceList do
  begin
    lstDeviceServiceList.Add(devService);
    lbDeviceDetails.Items.Add.Text := 'Service: ' + devService.UUIDName + ' (' +
      devService.UUID.ToString + ')';
  end;
end;

function TfrmHRBluetooth.BytesValuesAsStr(Value: TBytes): String;
var
  sValue: String;
  bValue: Byte;

begin
  sValue := '';
  for bValue in Value do
  begin
    if sValue = '' then
    begin
      sValue := IntToStr(bValue);
    end
    else
    begin
      sValue := sValue + '-' + IntToStr(bValue);
    end;
  end;

  Result := sValue;
end;

procedure TfrmHRBluetooth.FormCreate(Sender: TObject);
begin
  lstDeviceServiceList := TBluetoothGattServiceList.Create(False);
  lstServiceCharList := TBluetoothGattCharacteristicList.Create(False);
  lstServiceCharNotify := TBluetoothGattCharacteristicList.Create(False);

  { This defines the default active tab at runtime }
  tabcMain.First(TTabTransition.None);
end;

procedure TfrmHRBluetooth.FormDestroy(Sender: TObject);
begin
  btDevices.Enabled := False;
end;

procedure TfrmHRBluetooth.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkHardwareBack) and (tabcMain.TabIndex <> 0) then
  begin
    tabcMain.First;
    Key := 0;
  end;
end;

procedure TfrmHRBluetooth.lbCharacteristicsChange(Sender: TObject);
begin
  ReleaseServiceCharNotifications;
  actReadData.Enabled := lbCharacteristics.ItemIndex <> -1;
end;

procedure TfrmHRBluetooth.lbDeviceDetailsItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  if lbDeviceDetails.ItemIndex < 3 then
  begin
    Exit;
  end;

  UpdateServiceCharacteristics;
  actTabNext.Execute;
end;

procedure TfrmHRBluetooth.lbDevicesChange(Sender: TObject);
begin
  ReleaseServiceCharNotifications;

  UpdateDeviceDetails;
end;


function TfrmHRBluetooth.ReadCharacteristicValue(
  const ACharacteristic: TBluetoothGattCharacteristic): String;
begin
  // Battery level
  if ACharacteristic.UUID.ToString = '{00002A19-0000-1000-8000-00805F9B34FB}' then
  begin
    Result := IntToStr(ACharacteristic.Value[0]) + '%';
    Exit;
  end;

  // HEART RATE MEASUREMENT
  if ACharacteristic.UUID.ToString = '{00002A37-0000-1000-8000-00805F9B34FB}' then
  begin
    Result := IntToStr(ACharacteristic.Value[1]) + ' bpm';
    Exit;
  end;

  // BODY SENSOR LOCATION
  if ACharacteristic.UUID.ToString = '{00002A38-0000-1000-8000-00805F9B34FB}' then
  begin
    case ACharacteristic.Value[0] of
      0: Result := 'Other';
      1: Result := 'Chest';
      2: Result := 'Wrist';
      3: Result := 'Finger';
      4: Result := 'Arm';
      5: Result := 'Ear lobe';
      6: Result := 'Foot';
    else
      Result := 'Unknown';
    end;
    Exit;
  end;

  // System ID
  if ACharacteristic.UUID.ToString = '{00002A23-0000-1000-8000-00805F9B34FB}' then
  begin
    Result := BytesValuesAsStr(ACharacteristic.Value);
    Exit;
  end;

  Result := '';
end;

procedure TfrmHRBluetooth.ReleaseServiceCharNotifications;

var
  devServiceCharNotify: TBluetoothGattCharacteristic;

begin
  if (SelectedDevice = nil) or (lstServiceCharNotify.IsEmpty) then
  begin
    Exit;
  end;

  for devServiceCharNotify in lstServiceCharNotify do
  begin
      SelectedDevice.SetCharacteristicNotification(devServiceCharNotify, False);
  end;
  lstServiceCharNotify.Clear;
end;

function TfrmHRBluetooth.SelectedDevice: TBluetoothLEDevice;
begin
  if lbDevices.ItemIndex = -1 then
  begin
    Result := nil;
    Exit;
  end;

  Result := btDevices.DiscoveredDevices[lbDevices.ItemIndex];
end;

procedure TfrmHRBluetooth.tabcMainChange(Sender: TObject);
begin
  actReadData.Enabled := lbCharacteristics.ItemIndex <> -1;
end;

end.
