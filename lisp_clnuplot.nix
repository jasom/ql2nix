
{ buildLispPackage, stdenv, fetchurl, lisp-project_clnuplot, 
   lisp_trivial-shell, lisp_metabang-bind, lisp_cl-mathstats, lisp_cl-containers,  
  sbcl, ccl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_trivial-shell lisp_metabang-bind lisp_cl-mathstats lisp_cl-containers  ];
      inherit stdenv;
      systemName = "clnuplot";
      
      sourceProject = "${lisp-project_clnuplot}";
      patches = [];
      lisp_dependencies = "${lisp_trivial-shell} ${lisp_metabang-bind} ${lisp_cl-mathstats} ${lisp_cl-containers}";
      name = "lisp_clnuplot-20130128-darcs";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.sbcl}" "${pkgs.ccl}" ];
    }
