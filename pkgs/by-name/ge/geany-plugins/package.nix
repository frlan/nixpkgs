{
  stdenv,
  gtk3,
  geany,
  intltool,
  fetchurl,
  pkg-config
}:

stdenv.mkDerivation {
    enableParallelBuilding = true;
    pname = "geany-plugins";
    version = "2.0";
    buildInputs = [
      intltool
      geany
      gtk3
    ]; 
    nativeBuildInputs = [
      pkg-config
    ];
    src = fetchurl {
	    url = "https://plugins.geany.org/geany-plugins/geany-plugins-2.0.tar.bz2";
	    hash = "sha256-n8LsXJmnRnj7nozfvSRdPiBhpEjXD9EQpq77Yt1RRwU=";
	  };
    configureFlags = [
      "--prefix=${placeholder "out"}"
      "--with-geany-libdir=${placeholder "out"}/lib"
    ];
  }
