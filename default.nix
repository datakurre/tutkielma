with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "env";
  buildInputs = [
    (texlive.combine {
      inherit (texlive)
        scheme-basic
        amsfonts
        babel
        babel-finnish
        beebe
        ec
        enumitem
        epstopdf
        etoolbox
        footmisc
        geometry
        graphics
        hyperref
        hyphen-finnish
        latex
        latexmk
        mathpazo
        microtype
        ms
        multirow
        natbib
        oberdiek
        palatino
        pdfpages
        pgf
        preview
        pstricks
        setspace
        subfigure
        tocbibind
        totpages
        url
        xcolor
        xkeyval;
    })
    gnumake
  ];
}
