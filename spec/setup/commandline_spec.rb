require 'spec_helper'

describe "command-line parameters" do

  describe "operating system" do
    it "sets os to unix" do
      expect(Serverspec::Setup.ask_os_type ['-os', 'unix']).to eq 'UN*X'
      expect(Serverspec::Setup.ask_os_type ['-os', 'UNix']).to eq 'UN*X'
    end

    it "sets os to windows" do
      expect(Serverspec::Setup.ask_os_type ['-os', 'windows']).to eq 'Windows'
      expect(Serverspec::Setup.ask_os_type ['-os', 'WINDOWS']).to eq 'Windows'
    end
  end

  describe "unix backend" do
    it "sets backend to ssh" do
      expect(Serverspec::Setup.ask_unix_backend ['-be', 'ssh']).to eq 'ssh'
      expect(Serverspec::Setup.ask_unix_backend ['-be', 'SSH']).to eq 'ssh'
    end

    it "sets backend to exec" do
      expect(Serverspec::Setup.ask_unix_backend ['-be', 'exec']).to eq 'exec'
      expect(Serverspec::Setup.ask_unix_backend ['-be', 'EXEC']).to eq 'exec'
    end
  end

  describe "windows backend" do
    it "sets backend to ssh" do
      expect(Serverspec::Setup.ask_windows_backend ['-be', 'winrm']).to eq 'winrm'
      expect(Serverspec::Setup.ask_windows_backend ['-be', 'WinRM']).to eq 'winrm'
    end

    it "sets backend to exec" do
      expect(Serverspec::Setup.ask_windows_backend ['-be', 'Cmd']).to eq 'cmd'
      expect(Serverspec::Setup.ask_windows_backend ['-be', 'cmd']).to eq 'cmd'
    end
  end
end
