#
# Spec file for package paper-gtk-theme
#
# Copyright (c) 2016 Sam Hewitt
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.
#

Name:           paper-gtk-theme
Version:        2.1
Release:        0
License:        GPL-3.0+
Summary:        Paper GTK theme
Url:            https://snwh.org/paper
Group:          System/GUI/Other
Source:         %{name}-%{version}.tar.xz
BuildRequires:  automake
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch
Requires:       gtk2-engines

%description
Paper is a modern desktop theme suite. Its design is mostly flat with a minimal use of shadows for depth.

%prep
%setup -q
chmod +x autogen.sh
chmod a-x AUTHORS README.md

%build
./autogen.sh
make %{?_smp_mflags}

%install
make install DESTDIR=%{buildroot} %{?_smp_mflags}
rm -f %{buildroot}%{_datadir}/themes/Paper/AUTHORS

%files
%defattr(-,root,root)
%doc AUTHORS LICENSE README.md
%{_datadir}/themes/Paper
