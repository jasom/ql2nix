
{ buildLispPackage, stdenv, fetchurl, lisp-project_software-evolution, 
   lisp_metabang-bind,  
  ccl, clisp, sbcl,  
  system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  #buildLispPackage = pkgs.callPackage ./lisp-builder/default.nix pkgs.sbcl;
in
  buildLispPackage {
      propagatedBuildInputs = [ lisp_metabang-bind  ];
      inherit stdenv;
      systemName = "software-evolution-command-line";
      
      sourceProject = "${lisp-project_software-evolution}";
      patches = [];
      lisp_dependencies = "${lisp_metabang-bind}";
      name = "lisp_software-evolution-command-line-20160929-git";
      #lisp = "${pkgs.sbcl}/bin/sbcl";
      lisp_implementations = [ "${pkgs.ccl}" "${pkgs.clisp}" "${pkgs.sbcl}" ];
    }
