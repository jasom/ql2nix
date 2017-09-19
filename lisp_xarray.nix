
{ buildLispPackage, stdenv, fetchurl, lisp-project_xarray, 
   lisp_anaphora, lisp_metabang-bind, lisp_iterate, lisp_cl-utilities,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_anaphora lisp_metabang-bind lisp_iterate lisp_cl-utilities  ];
      inherit stdenv;
      systemName = "xarray";
      
      sourceProject = "${lisp-project_xarray}";
      patches = [];
      lisp_dependencies = "${lisp_anaphora} ${lisp_metabang-bind} ${lisp_iterate} ${lisp_cl-utilities}";
      name = "lisp_xarray-20140113-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
