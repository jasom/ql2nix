
{ buildLispPackage, stdenv, fetchurl, lisp-project_cl-l10n, 
   lisp_closer-mop, lisp_local-time, lisp_cxml, lisp_flexi-streams, lisp_cl-fad, lisp_metabang-bind, lisp_cl-ppcre, lisp_iterate, lisp_cl-l10n-cldr, lisp_alexandria,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_closer-mop lisp_local-time lisp_cxml lisp_flexi-streams lisp_cl-fad lisp_metabang-bind lisp_cl-ppcre lisp_iterate lisp_cl-l10n-cldr lisp_alexandria  ];
      inherit stdenv;
      systemName = "cl-l10n";
      
      sourceProject = "${lisp-project_cl-l10n}";
      patches = [];
      lisp_dependencies = "${lisp_closer-mop} ${lisp_local-time} ${lisp_cxml} ${lisp_flexi-streams} ${lisp_cl-fad} ${lisp_metabang-bind} ${lisp_cl-ppcre} ${lisp_iterate} ${lisp_cl-l10n-cldr} ${lisp_alexandria}";
      name = "lisp_cl-l10n-20161204-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
